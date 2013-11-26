SchoolCalendar = {}
SchoolCalendar.__index = SchoolCalendar

local animeTime = 500

function SchoolCalendar.new()
    local self = setmetatable({}, SchoolCalendar)

  
    _G.GUI.NewImage( display.newImage(getImage("imgBgBar.png")),
    {
        x               = "25.5%",
        y               = "5.5%",
        width           = "75%",
        height          = "89%",
        name            = "imgBgCalendar",
        border          = {"normal", 4, 1, 245, 255, 245, 50},
    } )
    
    SchoolCalendar.Hide()
    
    return self
end

function SchoolCalendar.Hide()
    _G.GUI.Show("imgBgCalendar", false, animeTime )
end

function SchoolCalendar.Show()
    
    _G.GUI.Show("imgBgCalendar", true, animeTime )
end



