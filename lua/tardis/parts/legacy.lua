-- Atom Accelerator

local PART = {}
PART.ID = "legacy_atomaccel"
PART.Name = "Legacy Atom Accelerator"
PART.Text = "Parts.DefaultAtomAccelerator.Text"
PART.Model = "models/drmatt/legtar/atomaccel.mdl"
PART.AutoSetup = true
PART.Collision = true

if CLIENT then
    function PART:Think()
        if not self:GetData("flight") then return end
        local spindir = self.exterior:GetSpinDir()
        if spindir == 0 then return end
        local pos = self:GetPoseParameter("switch")
        local target
        if spindir == 1 then
            target = 0
            if pos == 0 then
                pos = 1
            end
        else
            target = 1
            if pos == 1 then
                pos = 0
            end
        end
        self:SetPoseParameter("switch", math.Approach( pos, target, FrameTime() * 1 ))
        self:InvalidateBoneCache()
    end
end

TARDIS:AddPart(PART)

-- Fast Return Lever

local PART = {}
PART.ID = "legacy_biglever"
PART.Name = "Legacy Fast Return Lever"
PART.Model = "models/drmatt/legtar/biglever.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)

-- Cloaking Blacksticks

local PART = {}
PART.ID = "legacy_blacksticks"
PART.Name = "Legacy Cloaking Blacksticks"
PART.Model = "models/drmatt/legtar/blacksticks.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)

-- Dematerialisation Circuit

local PART = {}
PART.ID = "legacy_dematcircuit"
PART.Name = "Legacy Dematerialisation Circuit"
PART.Text = "Parts.DefaultDematCircuit.Text"
PART.Model = "models/drmatt/legtar/smallbutton.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

PART.Sound = "drmatt/tardis/seq_ok.wav"

TARDIS:AddPart(PART)

-- Directional Pointer

local PART = {}
PART.ID = "legacy_directionalpointer"
PART.Name = "Legacy Directional Pointer"
PART.Text = "Parts.DefaultDirectionalPointer.Text"
PART.Model = "models/drmatt/legtar/directionalpointer.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)

-- Door button

local PART = {}
PART.ID = "legacy_doorbutton"
PART.Name = "Legacy Door Button"
PART.Model = "models/drmatt/legtar/longflighttoggle.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Sound = "legtar/control_handbrake.wav"

PART.PowerOffUse = false

TARDIS:AddPart(PART)

-- Door frame

local PART = {}
PART.ID = "legacy_doorframe"
PART.Name = "Legacy Door Frame"
PART.Model = "models/drmatt/legtar/arch.mdl"
PART.BypassIsomorphic = true
PART.AutoSetup = true
PART.Collision = false
PART.CollisionUse = false
PART.Animate = true

TARDIS:AddPart(PART)

-- Door frame bottom

local PART = {}
PART.ID = "legacy_doorframe_bottom"
PART.Name = "Legacy Door Frame Bottom"
PART.Model = "models/hunter/blocks/cube025x1x025.mdl"
PART.BypassIsomorphic = true
PART.AutoSetup = true
PART.Collision = false
PART.CollisionUse = false
PART.Animate = true

function PART:Initialize()
    self:SetMaterial("models/drmatt/legtar/tardisfloor")
end

TARDIS:AddPart(PART)

PART.ID = "legacy_doorframe_bottom2" -- make a copy
TARDIS:AddPart(PART)

-- Engine Release

local PART = {}
PART.ID = "legacy_enginerelease"
PART.Name = "Legacy Engine Release"
PART.Model = "models/drmatt/legtar/longflighttoggle.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Sound = "legtar/control_handbrake.wav"

TARDIS:AddPart(PART)

-- Flightmode Lever

local PART = {}
PART.ID = "legacy_flightlever"
PART.Name = "Legacy Flight Lever"
PART.Model = "models/drmatt/legtar/handbrake.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Sound = "legtar/control_handbrake.wav"

TARDIS:AddPart(PART)

-- Anti-Gravs Pull Handle

local PART = {}
PART.ID = "legacy_float"
PART.Name = "Legacy Float"
PART.Model = "models/drmatt/legtar/handbrake.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Sound = "legtar/control_handbrake.wav"

TARDIS:AddPart(PART)

-- Gramophone

local PART = {}
PART.ID = "legacy_gramophone"
PART.Name = "Legacy Gramophone"
PART.Text = "Parts.DefaultGramophone.Text"
PART.Model = "models/drmatt/legtar/gramophone.mdl"
PART.AutoSetup = true
PART.Collision = true

TARDIS:AddPart(PART)

-- HADS Switch

local PART = {}
PART.ID = "legacy_hads"
PART.Name = "Legacy HADS Switch"
PART.Model = "models/drmatt/legtar/handbrake.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Sound = "legtar/control_handbrake.wav"

TARDIS:AddPart(PART)

-- Handbrake

local PART = {}
PART.ID = "legacy_handbrake"
PART.Name = "Legacy Handbrake"
PART.Model = "models/drmatt/legtar/handbrake.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Sound = "legtar/control_handbrake.wav"

TARDIS:AddPart(PART)

-- Helmic Regulator

local PART = {}
PART.ID = "legacy_helmic"
PART.Name = "Legacy Helmic Regulator"
PART.Text = "Parts.DefaultHelmic.Text"
PART.Model = "models/drmatt/legtar/helmicregulator.mdl"
PART.AutoSetup = true
PART.Collision = true

if CLIENT then
    function PART:Think()
        local pos = self:GetPoseParameter("switch")
        if pos == 1 then
            pos = 0
        end
        self:SetPoseParameter("switch", math.Approach( pos, 1, FrameTime() * 1 ))
        self:InvalidateBoneCache()
    end
end

TARDIS:AddPart(PART)

-- Isomorphic Security

local PART = {}
PART.ID = "legacy_isomorphic"
PART.Name = "Legacy Isomorphic Security"
PART.Model = "models/drmatt/legtar/handbrake.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Sound = "legtar/control_handbrake.wav"

TARDIS:AddPart(PART)

-- Keyboard

local PART = {}
PART.ID = "legacy_keyboard"
PART.Name = "Legacy Keyboard"
PART.Model = "models/drmatt/legtar/keyboard.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)

-- Long Flight Toggle

local PART = {}
PART.ID = "legacy_longflighttoggle"
PART.Name = "Legacy Long Flight Toggle"
PART.Model = "models/drmatt/legtar/longflighttoggle.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)

-- Physics Lock

local PART = {}
PART.ID = "legacy_physlock"
PART.Name = "Legacy Physics Lock"
PART.Model = "models/drmatt/legtar/handbrake.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Sound = "legtar/control_handbrake.wav"

TARDIS:AddPart(PART)

-- Power Lever

local PART = {}
PART.ID = "legacy_powerlever"
PART.Name = "Legacy Power Lever"
PART.Model = "models/drmatt/legtar/flightlever.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)

-- Adds legacy rails

local PART={}
PART.ID = "legacy_rails"
PART.Name = "Rails"
PART.Model = "models/drmatt/legtar/rails.mdl"
PART.AutoSetup = true
PART.Collision = true

TARDIS:AddPart(PART)

-- Redecorate button

local PART = {}
PART.ID = "legacy_redecoratebutton"
PART.Name = "Legacy Redecotate Button"
PART.Model = "models/drmatt/legtar/smallbutton.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

PART.SoundOn = "drmatt/tardis/seq_ok.wav"
PART.SoundOff = "drmatt/tardis/seq_bad.wav"

TARDIS:AddPart(PART)

-- Repair Lever

local PART = {}
PART.ID = "legacy_repairlever"
PART.Name = "Legacy Repair Lever"
PART.Model = "models/drmatt/legtar/repairlever.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)

-- Scanner button

local PART = {}
PART.ID = "legacy_scannerbutton"
PART.Name = "Legacy Scanner Button"
PART.Model = "models/drmatt/legtar/smallbutton.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)

-- Screen

local PART = {}
PART.ID = "legacy_screen"
PART.Name = "Legacy Screen"
PART.Text = "Parts.DefaultScreen.Text"
PART.Model = "models/drmatt/legtar/screen.mdl"
PART.AutoSetup = true
PART.Collision = true

TARDIS:AddPart(PART)

-- Screen Button

local PART = {}
PART.ID = "legacy_screenbutton"
PART.Name = "Legacy Screen Button"
PART.Model = "models/drmatt/legtar/smallbutton.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)

-- Sonic charger

local PART = {}
PART.ID = "legacy_sonicdispenser"
PART.Name = "Legacy Sonic Screwdriver Dispenser"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Model = "models/drmatt/legtar/smallbutton.mdl"

TARDIS:AddPart(PART)

-- Sonic charger

local PART = {}
PART.ID = "legacy_sonic_inserted"
PART.Name = "Legacy Sonic Screwdriver in the charger"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Model = "models/weapons/c_sonicsd.mdl"

if CLIENT then
    function PART:Think()
        local weapon = LocalPlayer():GetActiveWeapon()
        if IsValid(weapon) and weapon:GetClass() == "swep_sonicsd" then
            self:SetColor(Color(0,0,0,0))
        else
            self:SetColor(Color(255,255,255,255))
        end
    end
end

TARDIS:AddPart(PART)

-- Throttle

local PART = {}
PART.ID = "legacy_throttle"
PART.Name = "Legacy Throttle"
PART.Model = "models/drmatt/legtar/throttle.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true
PART.Sound = "legtar/control_throttle.wav"

if SERVER then
    function PART:Use(ply)
        if self.Control ~= "teleport_double" then
            TARDIS:Control(self.Control, ply, self)
        end

        if self:GetData("teleport") == true or self:GetData("vortex") == true
            or not self.interior:GetSequencesEnabled()
        then
            TARDIS:Control("teleport_double", ply, self)
        else
            TARDIS:ErrorMessage(ply, "Common.ControlSequencesEnabledWarning")
        end
    end
end

TARDIS:AddPart(PART)

-- Typewriter

local PART = {}
PART.ID = "legacy_typewriter"
PART.Name = "Legacy Typewriter"
PART.Model = "models/drmatt/legtar/typewriter.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)

-- Wibbly Lever

local PART = {}
PART.ID = "legacy_wibblylever"
PART.Name = "Legacy Wibbly lever"
PART.Text = "Parts.DefaultWibblyLever.Text"
PART.Model = "models/drmatt/legtar/wibblylever.mdl"
PART.AutoSetup = true
PART.Collision = true
PART.Animate = true

TARDIS:AddPart(PART)
