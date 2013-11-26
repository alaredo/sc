require ("studentInfo")
require ("studentMedic")

StudentScr = {}
StudentScr.__index = StudentScr

local studentInfo
local studentMedic

function StudentScr.new()
    local self = setmetatable({}, StudentScr)  
    
    studentInfo = StudentInfo()
    studentMedic = StudentMedic()
  
    StudentScr:CreateIconBar()
    StudentScr:Hide()
  
    return self
end

function StudentScr.Hide()
    _G.GUI.Show("ibarStudent", false, animeTime )
    studentInfo.Hide()
    studentMedic.Hide()
end

function StudentScr.Show()
    _G.GUI.Show("ibarStudent", true, animeTime ) 
    studentInfo.Show()
end

function StudentScr.ShowStudent()  
    StudentScr:Show()
    studentInfo.ShowStudent()
    
end

function StudentScr.IconBarClick(self, selected)
   -- StudentScr:Hide()
    if selected == 1 then 
        studentInfo.Show() 
    end
    
    if selected == 2 then 
        studentMedic.Show() 
    end 
    
    
end

function printVarsStudent(event, var1)
    local code = var1
    
    if code == 1 then
        studentMedic.Hide()
        studentInfo.Show() 
    end
    
    if code == 2 then 
        studentInfo.Hide()
        studentMedic.Show() 
    end 
end

function StudentScr.CreateIconBar(self)
    _G.GUI.NewIconBar(
    {
	x        = "25%",
	y        = "90%",
	width    = "75%",
	height   = "10%",
	name     = "ibarStudent",
	theme    = "theme_5",
	border   = {"inset",1,0, 206,238,21, 255 },
	marker   = {8, 1,  255, 255, 255, 100,  0, 0, 0, 50},
	iconSize = 64,
	icons    =
		{
                    {icon  = 9},
                    {icon  = 2},
                    {icon  = 21},
                    {icon  = 26},
                    {icon  = 14},
                    {icon  = 12},
		},
	onPress = function( EventData )  printVarsStudent( self, EventData.selectedIcon  ) end,

    } )
end

