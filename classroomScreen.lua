require ("classroomInfo")

ClassroomScr = {}
ClassroomScr.__index = ClassroomScr

local classroomInfo

function ClassroomScr.new()
    local self = setmetatable({}, ClassroomScr)  
    classroomInfo = ClassroomInfo.new()
    
  
    ClassroomScr:CreateIconBar()
    ClassroomScr:Hide()
  
    return self
end


function ClassroomScr.Hide()
    _G.GUI.Show("ibarClassroom", false, animeTime )
    classroomInfo:Hide()
end

function ClassroomScr.Show()
    
    _G.GUI.Show("ibarClassroom", true, animeTime )
    
end

function ClassroomScr.ShowClassroom()  
    ClassroomScr.Show()
    classroomInfo:ShowClassroom()
end


function ClassroomScr.IconBarClick(self, selected)
    
    
    
    
end


function ClassroomScr.CreateIconBar(self)
    _G.GUI.NewIconBar(
    {
	x        = "25%",
	y        = "90%",
	width    = "75%",
	height   = "10%",
	name     = "ibarClassroom",
	theme    = "theme_5",
	border   = {"inset",1,0, 206,238,21, 255 }, -- border   = {"normal",1,1, 206,238,21,100,  185,185,185,150},
	marker   = {0, 1,  255, 255, 255, 100,  0, 0, 0, 100},
	iconSize = 64,
	icons    =
		{
                    {icon  = 9},
                    {icon  = 10},
                    {icon  = 20},
                    {icon  = 19},
                    {icon  = 12},
		},
	onPress = function( EventData ) School.IconBarClick( self, EventData.selectedIcon  ) end,

    } )
end



