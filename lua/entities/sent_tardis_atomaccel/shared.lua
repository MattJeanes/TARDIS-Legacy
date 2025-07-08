ENT.Type = "anim"
if WireLib then
	ENT.Base 			= "base_wire_entity"
else
	ENT.Base			= "base_gmodentity"
end 
ENT.PrintName		= "TARDIS Atom Accelerator"
ENT.Spawnable		= false
ENT.AdminSpawnable	= false
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.Category		= "Doctor Who"
ENT.tardis_part		= true

function ENT:SetupDataTables()
	self:NetworkVar( "Int",	0,	"Mode" );
	self:NetworkVar( "Bool",	1,	"IsToggle" );

	self:SetMode( -1 )
	self:SetIsToggle( true );
end