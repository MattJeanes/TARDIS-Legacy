include('shared.lua')

function ENT:Draw()
	if LocalPlayer().tardis==self:GetNWEntity("TARDIS", NULL) and LocalPlayer().tardis_viewmode and not LocalPlayer().tardis_render then
		self:DrawModel()
	end
end

function ENT:StopTheme()
	if self.sound then
		self.sound:Stop()
		self.sound=nil
	end
end

function ENT:OnRemove()
	self:StopTheme()
end

local sounds={}

net.Receive("TARDISInt-Gramophone-Send", function(l,ply)
	local gramophone=net.ReadEntity()
	local tardis=net.ReadEntity()
	local interior=net.ReadEntity()
	local play=tobool(net.ReadBit())
	local choice=net.ReadFloat()
	local custom=tobool(net.ReadBit())
	local customstr
	if custom then
		customstr=net.ReadString()
	end
	if IsValid(gramophone) and IsValid(tardis) and IsValid(interior) then
		gramophone:StopTheme()
		if play and tobool(GetConVarNumber("tardisint_music"))==true then
			local addr
			if custom and not (customstr=="") then
				addr=customstr
			elseif choice and sounds[choice] then
				addr="https://cdn.amyjeanes.com/tardis/"..sounds[choice][2]..".mp3"
			else
				return
			end
			sound.PlayURL(addr, "", function(station)
				if station then
					station:SetPos(gramophone:GetPos())
					station:SetVolume(1)
					station:Play()
					gramophone.sound=station
				else
					LocalPlayer():ChatPrint("ERROR: Failed to load song (check console for BASS error!)")
				end
			end)
		end
	end
end)

net.Receive("TARDISInt-Gramophone-GUI", function()	
	local gramophone=net.ReadEntity()
	local tardis=net.ReadEntity()
	local interior=net.ReadEntity()
	local choice=0
	
	local function SendSelection(play,customstr)
		if IsValid(gramophone) and IsValid(tardis) and IsValid(interior) then
			net.Start("TARDISInt-Gramophone-Bounce")
				net.WriteEntity(gramophone)
				net.WriteEntity(tardis)
				net.WriteEntity(interior)
				net.WriteBit(play)
				net.WriteFloat(choice)
				if customstr then
					net.WriteBit(true)
					net.WriteString(customstr)
				else
					net.WriteBit(false)
				end
			net.SendToServer()
			return true
		else
			return false
		end
	end
	
	local window = vgui.Create( "DFrame" )
	window:SetSize( 200, 155+221 )
	window:Center()
	window:SetTitle( "Gramophone" )
	window:MakePopup()
	
	local label = vgui.Create( "DLabel", window )
	label:SetPos(10,30) // Position
	label:SetColor(Color(255,255,255,255)) // Color
	label:SetFont("Trebuchet24")
	label:SetText("Select a song") // Text
	label:SizeToContents() // make the control the same size as the text.
	
	local listview = vgui.Create( "DListView", window )
	listview:SetPos(10,60)
	listview:SetSize(180,16+221)
	listview:SetMultiSelect( false )
	listview:AddColumn( "Songs" )
	listview.OnClickLine = function(self,line)
		if self.loading then return end
		if self.errored then return end
		local name=line:GetValue(1)
		self:ClearSelection()
		self:SelectItem(line)
		for k,v in pairs(sounds) do
			if v[1]==name then
				choice=k
			end
		end
	end
	
	local button = vgui.Create( "DButton", window )
	button:SetSize( 180, 30 )
	button:SetPos( 10, window:GetTall()-74 )
	button:SetText( "Enter Custom Theme" )
	button.DoClick = function( button )
		Derma_StringRequest(
			"Enter Custom Theme",
			"Input a web link of a sound (MP3, MP2, MP1, OGG, WAV, AIFF)",
			"",
			function(text) SendSelection(true,text) end,
			function(text) end
		)
	end
	
	local button = vgui.Create( "DButton", window )
	button:SetSize( 87.5, 30 )
	button:SetPos( 10, window:GetTall()-38 )
	button:SetText( "Play" )
	button.DoClick = function( button )
		local success=SendSelection(true)
		if success then
			window:Close()
		end
	end
	
	local button = vgui.Create( "DButton", window )
	button:SetSize( 87.5, 30 )
	button:SetPos( 102.5, window:GetTall()-38 )
	button:SetText( "Stop" )
	button.DoClick = function( button )
		local success=SendSelection(false)
		if success then
			window:Close()
		end
	end

	listview.loading = true
	listview:AddLine("Loading songs...")
	http.Fetch("https://cdn.amyjeanes.com/tardis/songs.json", function(body)
		if not listview then return end
		default_music = util.JSONToTable(body)
		if not default_music then
			print("Failed to parse preloaded music JSON")
			listview:Clear()
			listview:AddLine("Failed to load songs!")
			listview.loading = false
			listview.errored = true
			return
		end
		listview:Clear()
		for _,catObj in ipairs(default_music) do
				for _,song in ipairs(catObj.songs) do
						table.insert(sounds, {song.name, song.id})
						listview:AddLine(song.name)
				end
		end
		listview.loading = false
	end, function(err)
		if not listview then return end
		print("Failed to fetch preloaded music: " .. err)
		listview:Clear()
		listview:AddLine("Failed to load songs!")
		listview.loading = false
		listview.errored = true
	end)
end)

function ENT:Think()
	if self.sound then
		if tobool(GetConVarNumber("tardisint_music"))==true then
			local tardis=self:GetNWEntity("TARDIS",NULL)
			if IsValid(tardis) then
				local interior=tardis:GetNWEntity("interior",NULL)
				if LocalPlayer().tardis==tardis and IsValid(interior) then
					if LocalPlayer().tardis_viewmode and not (LocalPlayer().tardis_skycamera and IsValid(LocalPlayer().tardis_skycamera)) then
						local distance=LocalPlayer():GetPos():Distance(interior:GetPos())
						local volume=math.Clamp(((distance*-1)/800+1.1)*GetConVarNumber("tardisint_musicvol"),0,1)
						self.sound:SetVolume(volume)
					elseif (not LocalPlayer().tardis_viewmode or (LocalPlayer().tardis_skycamera and IsValid(LocalPlayer().tardis_skycamera))) and tobool(GetConVarNumber("tardisint_musicext"))==true then
						local volume=math.Clamp(GetConVarNumber("tardisint_musicvol"),0,1)
						self.sound:SetVolume(volume)
					else
						self.sound:SetVolume(0)
					end
				else
					self:StopTheme()
				end
			end
		else
			self:StopTheme()
		end
	end

	if LocalPlayer():GetEyeTraceNoCursor().Entity==self and LocalPlayer():EyePos():Distance(self:GetPos())<85 then
		if tobool(GetConVarNumber("tardisint_tooltip"))==true then
			AddWorldTip( self:EntIndex(), "Gramophone", 0.5, self:GetPos(), self )
		end
		self.shouldglow=true
	else
		self.shouldglow=false
	end
end
