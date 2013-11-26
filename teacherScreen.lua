require ("teacherInfo")

TeacherScr = {}
TeacherScr.__index = TeacherScr

local teacherInfo

function TeacherScr.new()
    local self = setmetatable({}, TeacherScr)  
    teacherInfo = TeacherInfo.new()
    
  
    TeacherScr:CreateIconBar()
    TeacherScr:Hide()
  
    return self
end


function TeacherScr.Hide()
    _G.GUI.Show("ibarTeacher", false, animeTime )
    teacherInfo:Hide()
end

function TeacherScr.Show()
    
    _G.GUI.Show("ibarTeacher", true, animeTime )
    
end

function TeacherScr.ShowTeacher()  
    TeacherScr.Show()
    teacherInfo:ShowTeacher()
end


function TeacherScr.IconBarClick(self, selected)
    
    
    
    
end


function TeacherScr.CreateIconBar(self)
    _G.GUI.NewIconBar(
    {
	x        = "25%",
	y        = "90%",
	width    = "75%",
	height   = "10%",
	name     = "ibarTeacher",
	theme    = "theme_5",
	border   = {"inset",1,0, 206,238,21, 255 },
	marker   = {0, 1,  255, 255, 255, 100,  0, 0, 0, 100},
	iconSize = 64,
	icons    =
		{
                    {icon  = 9},
		},
	onPress = function( EventData ) TeacherScr.IconBarClick( self, EventData.selectedIcon  ) end,

    } )
end





