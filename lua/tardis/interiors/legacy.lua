-- Legacy

local function SonicModelExists()
    if SonicSD and file.Exists("models/weapons/c_sonicsd.mdl", "GAME") then
        return true
    end
    return false
end

local T = {}

T.Versions = {
    randomize = false,
    allow_custom = false,
    randomize_custom = false,

    main = {
        id = "legacy",
    },
    other = {
        {
            name = "Interiors.Default.Versions.TTCapsuleType40",
            id = "legacy_tt_type40",
        },
        {
            name = "Interiors.Default.Versions.TTCapsuleType50",
            id = "legacy_tt_type50",
        },
        {
            name = "Interiors.Default.Versions.TTCapsuleType55",
            id = "legacy_tt_type55",
        },
        {
            name = "Interiors.Default.Versions.SIDRAT",
            id = "legacy_sidrat",
        },
    },
}


T.Base = "base"
T.Name = "Legacy TARDIS"
T.ID = "legacy"
T.Interior = {
    Model = "models/drmatt/legtar/interior.mdl",
    IdleSound = {
        {
            path = "legtar/interior_idle_loop.wav",
            volume = 0.5
        },
        {
            path = "legtar/interior_idle2_loop.wav",
            volume = 0.5
        }
    },
    Light = {
        color = Color(255, 50, 0),
        warncolor = Color(255, 0, 0),
        pos = Vector(0, 0, 120),
        brightness = 5
    },
    Lights = {
        {
            color = Color(0, 255, 0),
            pos = Vector(0, 0, -50),
            brightness = 2,
            nopower = true
        }
    },
    Portal = {
        pos = Vector(316.7, 334.9, -33.7),
        ang = Angle(0, 230, 0),
        width = 45,
        height = 91
    },
    Fallback = {
        pos = Vector(291, 305, -75),
        ang = Angle(0, 230, 0)
    },
    Screens = {
        {
            pos = Vector(44.5, -6.5, 39),
            ang = Angle(0, 84.5, 91),
            width = 227.75,
            height = 140,
            gui_rows = 2,
            power_off_black = true
        }
    },
    Scanners = {
        {
            mat = "models/drmatt/legtar/tardisscanner",
            width = 1024,
            height = 1024,
            ang = Angle(0,0,0),
            fov = 90,
        }
    },
    Sounds = {
        Teleport = {
            demat = "drmatt/tardis/demat.wav",
            mat = "drmatt/tardis/mat.wav",
            mat_fast = "p00gie/tardis/mat_fast.wav",
            mat_damaged_fast = "p00gie/tardis/mat_damaged_fast.wav",
            fullflight = "drmatt/tardis/full.wav",
        },
    },
    Sequences = "legacy_sequences",
    Parts = {
        door = {
            posoffset=Vector(28,0,-54.6),
            ang = Angle(0, 50, 0),
            width = 443,
            height = 335
        },
        legacy_rails = true,
        legacy_throttle            =   {pos = Vector(-8.87, -50, 5.5),                     ang = Angle(-12, -5, 24),               },
        legacy_flightlever         =   {pos = Vector(-0.431641, 44.75, 6.4),               ang = Angle(-63.913, 137.035, 136.118), },
        legacy_screen              =   {pos = Vector(42, 0.75, 27.1),                      ang = Angle(0, -5, 0),                  },
        legacy_screenbutton        =   {pos = Vector(44.5, 9.75, 38.2),                    ang = Angle(215, 85, 90),               },
        legacy_scannerbutton       =   {pos = Vector(42, -31.5, 1.4),                      ang = Angle(-25, 150, -10)              },
        legacy_wibblylever         =   {pos = Vector(-48, 18, 5.4),                        ang = Angle(335, 347, 6),               },
        legacy_enginerelease       =   {pos = Vector(-61.229, 21.622, -4.514),             ang = Angle(180, 90.911, -90),          },
        legacy_doorbutton          =   {pos = Vector(-60.782, -25.129, -6.108),            ang = Angle(0, 65.911, -81.515),        },
        legacy_powerlever          =   {pos = Vector(44, -18, 5.5),                        ang = Angle(22, 328, 347.5),            },
        legacy_keyboard            =   {pos = Vector(29, -53, -8),                         ang = Angle(0, 30, 50),                 },
        legacy_hads                =   {pos = Vector(39, 22.75, 5.828125),                 ang = Angle(296.260, 78.027, 136.528),  },
        legacy_typewriter          =   {pos = Vector(19.002930, 48.807617, 2.078125),      ang = Angle(0.945, 330.128, 339.750),   },
        legacy_repairlever         =   {pos = Vector(-6.623535, 44.351563, 7),             ang = Angle(349, 5, 337),               },
        legacy_redecoratebutton    =   {pos = Vector(-6.412, 53.588, 1.556),               ang = Angle(9.445, 46.482, -21.861),    },
        legacy_handbrake           =   {pos = Vector(-40.088379, -21.466797, 7.924805),    ang = Angle(290.494, 208.321, 182.157), },
        legacy_gramophone          =   {pos = Vector(-26, -1.5, 30),                       ang = Angle(0, 30, 0),                  },
        legacy_biglever            =   {pos = Vector(-9.94, -65, -52),                     ang = Angle(0, 270, 0),                 },
        legacy_physlock            =   {pos = Vector(39.5, -22.75, 6.914063),              ang = Angle(303.286, 6.660, 148.819),   },
        legacy_isomorphic          =   {pos = Vector(-39.5, 22, 6.629883),                 ang = Angle(290.762, 195, 137.777),     },
        legacy_atomaccel           =   {pos = Vector(20, -37.669998, 1.75),                ang = Angle(0, 0, 0),                   },
        legacy_directionalpointer  =   {pos = Vector(12.5, -24.5, 23),                     ang = Angle(0, 30, 0),                  },
        legacy_float               =   {pos = Vector(-2.5, -45.5, 7.75),                   ang = Angle(-56.714, -54.280, 148.819), },
        legacy_blacksticks         =   {pos = Vector(4.480469, -43.906372, 7),             ang = Angle(13, 0, 24.176),             },
        legacy_longflighttoggle    =   {pos = Vector(-37.242310, -27.915344, 7.428223),    ang = Angle(338, 28.721, 15),           },
        legacy_dematcircuit        =   {pos = Vector(-43.168457, -31.015625, 4.7),         ang = Angle(22, 209.224, 348),          },
        legacy_sonicdispenser      =   {pos = Vector(-26.048, 42.31, 1.45),                ang = Angle(9.445, 46.482, -21.861),    },
        legacy_helmic              =   {pos = Vector(-26, -41, 4),                         ang = Angle(0, 330, 24.5),              },
        legacy_sonic_inserted      =   SonicModelExists() and
                                        {pos = Vector(-29.748, 40.71, -20.15),              ang = Angle(-100, -90, 90),             },
        legacy_doorframe = {
            pos = Vector(317, 336.3, -80),
            ang = Angle(0, -40, 0),
            scale = 0.764,
            matrixScale = Vector(1, 1, 1.083)
        },
        legacy_doorframe_bottom = {
            pos = Vector(317, 335.8, -93.5),
            ang = Angle(0, 50, 0),
            scale = 1.14,
            matrixScale = Vector(0.53, 1.02, 1)
        },
        legacy_doorframe_bottom2 = {
            pos = Vector(317, 335.8, -93.5),
            ang = Angle(0, 230, 0),
            scale = 1.14,
            matrixScale = Vector(0.54, 1.02, 1)
        },
    },
    Controls = {
        legacy_throttle            = "teleport_double",
        legacy_flightlever         = "flight",
        legacy_screen              = nil,
        legacy_screenbutton        = "toggle_screens",
        legacy_scannerbutton       = "toggle_scanners",
        legacy_wibblylever         = "doorlock",
        legacy_enginerelease       = "engine_release",
        legacy_doorbutton          = "door",
        legacy_powerlever          = "power",
        legacy_keyboard            = "destination",
        legacy_hads                = "hads",
        legacy_typewriter          = "coordinates",
        legacy_repairlever         = "repair",
        legacy_redecoratebutton    = "redecorate",
        legacy_handbrake           = "handbrake",
        legacy_gramophone          = "music",
        legacy_biglever            = "fastreturn",
        legacy_physlock            = "physlock",
        legacy_isomorphic          = "isomorphic",
        legacy_float               = "float",
        legacy_blacksticks         = "cloak",
        legacy_longflighttoggle    = "vortex_flight",
        legacy_dematcircuit        = nil,
        legacy_sonicdispenser      = "sonic_dispenser",
        legacy_sonic_inserted      = SonicModelExists() and "sonic_dispenser",
        legacy_helmic              = "thirdperson",
        legacy_atomaccel           = "spin_toggle",
        legacy_directionalpointer  = "spin_switch",


    },
    Tips = {},
    -- Interior.Tips are deprecated; should be deleted when the extensions update and
    -- replace with Interior.CustomTips, Interior.PartTips and Interior.TipSettings
    TipSettings = {
        view_range_min = 70,
        view_range_max = 90,
    },
    CustomTips = {
        --{ text = "Example", pos = Vector(0, 0, 0) },
    },
    PartTips = {

        legacy_throttle            =   {pos = Vector(-8.87, -50, 5.5), down = true},
        legacy_flightlever         =   {pos = Vector(-1, 59, 2), down = true},
        legacy_screen              =   {pos = Vector(42, 0.75, 29.1), down = true},
        legacy_screenbutton        =   {pos = Vector(47, 10, 38), right = true},
        legacy_scannerbutton        =  {pos = Vector(43, -32, 3.5), down = true},
        legacy_wibblylever         =   {pos = Vector(-48, 18, 5.4), right = true},
        legacy_enginerelease       =   {pos = Vector(-61.229, 21.622, -4.514), down = true},
        legacy_doorbutton          =   {pos = Vector(-62.699, -24.23, -5.506), down = true},
        legacy_powerlever          =   {pos = Vector(44, -18, 5.5), right = true},
        legacy_keyboard            =   {pos = Vector(29, -53, -8), right = true, down = true},
        legacy_hads                =   {pos = Vector(52, 31, 1), down = true},
        legacy_typewriter          =   {pos = Vector(19, 48.80, 2.07) },
        legacy_repairlever         =   {pos = Vector(-8, 45, 9), right = true},
        legacy_redecoratebutton    =   {pos = Vector(-6.542, 54.408, 3.081), down = true, right = true},
        legacy_handbrake           =   {pos = Vector(-52, -29, 2), down = true},
        legacy_gramophone          =   {pos = Vector(-26, -1.50, 40), right = true, down = true},
        legacy_biglever            =   {pos = Vector(-9.94, -65, -12) },
        legacy_physlock            =   {pos = Vector(52, -30, 0), down = true},
        legacy_isomorphic          =   {pos = Vector(-52, 29, 2), down = true},
        legacy_atomaccel           =   {pos = Vector(20, -38, 6), right = true},
        legacy_directionalpointer  =   {pos = Vector(12.5, -24.5, 23) },
        legacy_float               =   {pos = Vector(-2, -60, 1), right = true, down = true},
        legacy_blacksticks         =   {pos = Vector(4.48, -43.9, 7) },
        legacy_longflighttoggle    =   {pos = Vector(-37.24, -27.91, 7.42) },
        legacy_dematcircuit        =   {pos = Vector(-43.16, -31.01, 4.7), right = true, down = true},
        legacy_sonicdispenser      =   {pos = Vector(-26.048, 42.31, 3.15), right = true, down = false},
        legacy_helmic = {
            pos = Vector(-26, -41, 4),
            right = true,
            view_range_max = 70, --less view range since there's a lot stuff in the way
            view_range_min = 50,
        },
    },
    Seats = {
        {
            pos = Vector(130, -96, -30),
            ang = Angle(0, 40, 0)
        },
        {
            pos = Vector(125, 55, -30),
            ang = Angle(0, 135, 0)
        }
    },
    BreakdownEffectPos = Vector(0, 0, 40),
}

T.Exterior = {
    Parts = {
        door = {
            posoffset=Vector(-28,0,-54.6)
        }
    },
    Sounds = {
        Teleport = {
            demat = "drmatt/tardis/demat.wav",
            demat_fast = "drmatt/tardis/demat.wav",
            demat_hads = "p00gie/tardis/demat_hads.wav",
            mat = "drmatt/tardis/mat.wav",
            mat_fast = "p00gie/tardis/mat_fast.wav",
            mat_damaged_fast = "p00gie/tardis/mat_damaged_fast.wav",
            fullflight = "drmatt/tardis/full.wav",
            interrupt = "drmatt/tardis/repairfinish.wav",
        },
        Spawn = "drmatt/tardis/repairfinish.wav",
        RepairFinish = "drmatt/tardis/repairfinish.wav",
        Delete = "p00gie/tardis/tardis_delete.wav",
        FlightLand = "p00gie/tardis/tardis_landing.wav",
    },
    Light = {
        warncolor = Color(255,200,200),
    },
    PhaseMaterial = "models/drmatt/tardis/exterior/phase.vmt",
    Portal = {
        pos = Vector(28,0,54.6),
        ang = Angle(0,0,0),
        width = 45,
        height = 92,
        thickness = 42,
        inverted = true,
    },
}

local function playerlookingat(self,ply,vec,fov,width)
    local disp = vec - self:WorldToLocal(ply:GetPos()+Vector(0,0,64))
    local dist = disp:Length()

    local maxcos = math.abs( math.cos( math.acos( dist / math.sqrt( dist * dist + width * width ) ) + fov * ( math.pi / 180 ) ) )
    disp:Normalize()

    if disp:Dot( ply:EyeAngles():Forward() ) > maxcos then
        return true
    end

    return false
end

T.Interior.CustomHooks = {
    init_rotor = {
        "Initialize",
        function(self)
            self.timerotor={}
            self.timerotor.pos=0
            self.timerotor.mode=1
        end
    },
    think_rotor = {
        "Think",
        function(self)
            local moving = self:GetData("teleport",false)
            local flightmode = self:GetData("flight",false)
            local active = (moving or flightmode)
            if not CLIENT then return end
            if active or self.timerotor.pos > 0 then
                if self.timerotor.pos==1 then
                    self.timerotor.mode=0
                elseif active and self.timerotor.pos==0 then
                    self.timerotor.mode=1
                end
                self.timerotor.pos=math.Approach( self.timerotor.pos, self.timerotor.mode, FrameTime()*1.1 )
                self:SetPoseParameter( "glass", self.timerotor.pos )
            end
        end,
    },
    use_console = {
        "Use",
        function(self,a,c)
            if SERVER and a:IsPlayer() and (not a:GetTardisData("outside")) and CurTime() > a:GetTardisData("outsidecool",0) then
                local pos=Vector(0,0,0)
                local pos2=self:WorldToLocal(a:GetPos())
                local distance=pos:Distance(pos2)
                if distance < 110 and playerlookingat(self,a,pos,10,10) then
                    TARDIS:Control("thirdperson_careful", a)
                end
            end
        end,
    },
}

T.CustomHooks = {
    init_door = {
        exthooks = {
            ["PostInitialize"] = true,
        },
        inthooks = {
            ["PostInitialize"] = true,
        },
        func = function(ext,int)
            local door_ext = IsValid(ext) and ext:GetPart("door")
            local door_int = IsValid(int) and int:GetPart("door")

            if IsValid(door_ext) then
                door_ext:SetBodygroup(1,1)
                door_ext:SetBodygroup(2,1)
            end

            if IsValid(door_int) then
                door_int:SetBodygroup(1,1)
                door_int:SetBodygroup(2,1)
                door_int:SetBodygroup(3,1) -- 3D sign
            end
        end,
    },
    scanner_override = {
        inthooks = {
            ["PostScannersToggled"] = true,
            ["PostInitialize"] = true,
        },
        func = function(ext, int, on)
            if not on then
                for k,v in ipairs(int.scanners) do
                    if v.submatid then
                        v.ent:SetSubMaterial(v.submatid, "models/drmatt/legtar/tardisscanner2")
                    end
                end
            end
        end,
    }
}

TARDIS:AddInterior(T)
