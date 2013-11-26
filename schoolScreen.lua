require( "schoolInfo" )
require( "schoolStatistic")
require( "schoolCalendar")


School = {}
School.__index = School

local schoolInfo 
local schoolStatistic
local schoolCalendar

function School.new(n)
  local self = setmetatable({}, School)
  self.name = n
  self.address = "Av. Afonso Pena, 4000 - Centro - Belo Horizonte"
  
  schoolInfo = SchoolInfo.new(self)
  schoolStatistic = SchoolStatistic.new(self)
  schoolCalendar = SchoolCalendar.new(self)
  
  School:ShowIconBar()
  
  
  return self
end

function School.setAddress( self, a ) 
    self.address = a
end

function School.HideAll()
    _G.GUI.Show("ibarSchool", false, animeTime )
    schoolInfo:Hide()
    schoolStatistic:Hide()
    schoolCalendar:Hide()
end

function School.Hide()
    
    schoolInfo:Hide()
    schoolStatistic:Hide()
    schoolCalendar:Hide()
end

function School.Show()
    _G.GUI.Show("ibarSchool", true, animeTime )
    
    schoolInfo:Show()
end

function School.IconBarClick(self, selected)
    --School:Hide()
    
    if selected == 1 then schoolInfo:Show() end
    if selected == 2 then schoolStatistic:Show() end 
    if selected == 3 then schoolCalendar:Show() end
    --if selected == 4 then School.ShowMenu() end
    --if selected == 5 then School.ShowAlerts() end
    --if selected == 6 then School.ShowPictures() end
    
end
    
    
function School.ShowIconBar(self)
    _G.GUI.NewIconBar(
    {
	x        = "25%",
	y        = "90%",
	width    = "75%",
	height   = "10%",
	name     = "ibarSchool",
	theme    = "theme_5",
	border   = {"inset",1,0, 206,238,21, 255 }, -- border   = {"normal",1,1, 206,238,21,100,  185,185,185,150},
	marker   = {0, 1,  255, 255, 255, 100,  0, 0, 0, 100},
	iconSize = 64,
	icons    =
		{
                    {icon  = 9},
                    {icon  = 10},
                    {icon  = 19},
                    {icon  = 14},
                    {icon  = 12},
                    {icon  = 32},
		},
	onPress = function( EventData ) School.IconBarClick( self, EventData.selectedIcon  ) end,

    } )
end


        









