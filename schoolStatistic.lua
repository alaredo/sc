SchoolStatistic = {}
SchoolStatistic.__index = SchoolStatistic

local animeTime = 500

function SchoolStatistic.new(s)
    local self = setmetatable({}, SchoolStatistic)

  
    _G.GUI.NewImage( display.newImage(getImage("imgBgBar.png")),
    {
        x               = "25.5%",
        y               = "10.5%",
        width           = "75%",
        height          = "89%",
        name            = "imgBgStatistic",
        group           = "schoolStatistic",
        border          = {"normal", 4, 1, 245, 255, 245, 50},
    } )
    
    
    SchoolStatistic.Hide()
    
    return self
end

function SchoolStatistic.Hide()
    _G.GUI.Show("imgBgStatistic", false, animeTime )
end

function SchoolStatistic.Show()
    
    _G.GUI.Show("imgBgStatistic", true, animeTime )
end

