require ("data")
require ("util")

SchoolInfo = {}
SchoolInfo.__index = SchoolInfo

local animeTime = 500


function SchoolInfo.new()
  local self = setmetatable({}, SchoolInfo)
  

  _G.GUI.NewImage( display.newImage(getImage("imgClassroomInfoBg.png")),
    {
        x               = "25%",
        y               = "5%",
        width           = "75%",
        height          = "100%",
        name            = "imgBgSchool",
        group           = "schoolInfo",
        border          = {"normal", 4, 1, 245, 255, 245, 50},
    } )
        
--    _G.GUI.NewImage( display.newImage( getImage("logoSchool.png") ),
--    {
--        x               = "30%",
--        y               = "10%",
--        width           = "16%",
--        height          = "22%",
--        name            = "imgLogoSchool",
--        group           = "schoolInfo",
        --border          = {"normal", 4, 1, 255, 255, 255, 50},
--    } )    

    
    _G.GUI.NewLabel(
    {
        x           = "40%",
        y           = "15%",
        name        = "lblNameSchool",
        group       = "schoolInfo",
        theme       = "theme_5",
        width       = "100%",
        caption     = schoolData.name,
        fontSize    = "28",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "40%",
        y           = "20%",
        name        = "lblAddressSchool",
        group       = "schoolInfo",
        theme       = "theme_5",
        width       = "100%",
        height      = "auto",
        caption     = schoolData.address,
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "40%",
        y           = "25%",
        name        = "lblFoneSchool",
        group       = "schoolInfo",
        theme       = "theme_5",
        width       = "100%",
        height      = "auto",
        caption     = "Telefones: " .. schoolData.fone .. " - " .. schoolData.foneAlter,
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "40%",
        y           = "30%",
        name        = "lblEmailSchool",
        group       = "schoolInfo",
        theme       = "theme_5",
        width       = "100%",
        height      = "auto",
        caption     = "email: " .. schoolData.email,
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    
    _G.GUI.NewLabel(
    {
        x           = "45%",
        y           = "35%",
        name        = "lblEmailAlterSchool",
        group       = "schoolInfo",
        theme       = "theme_5",
        width       = "100%",
        height      = "auto",
        caption     = schoolData.emailAlter,
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    
    myMap = native.newMapView(30, 40, 280, 320 )
    
   --SchoolInfo.Hide()
    
  return self
end

function SchoolInfo.Hide()
    _G.GUI.Show("imgBgSchool", false, animeTime )
--    _G.GUI.Show("imgLogoSchool", false, animeTime )
    _G.GUI.Show("lblNameSchool", false, animeTime )
    _G.GUI.Show("lblAddressSchool", false, animeTime )
end

function SchoolInfo.Show()
    
    _G.GUI.Show("imgBgSchool", true, animeTime )
    
 --   _G.GUI.Show("imgLogoSchool", false, animeTime )
    _G.GUI.Show("lblNameSchool", true, animeTime )
    _G.GUI.Show("lblAddressSchool", true, animeTime )
end





