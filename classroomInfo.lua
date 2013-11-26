require ("data")
require ("util")
require ("comboBox")

ClassroomInfo = {}
ClassroomInfo.__index = ClassroomInfo

local animeTime = 500


function ClassroomInfo.new()
  local self = setmetatable({}, ClassroomInfo)
  
  _G.GUI.NewImage( display.newImage(getImage("imgClassroomInfoBg.png")),
    {
        x               = "25%",
        y               = "0%",
        width           = "75%",
        height          = "90%",
        name            = "imgBgClassroom",
        border          = {"inset", 1, 0, 245, 255, 245, 100},
    } )
    
    _G.GUI.NewSquareButton(
    {
    
	x       = "92%",
	y       = "0%",
	name    = "btnEditClassroom",
	theme   = "theme_5",
	icon    = 28,
	onPress = function( EventData ) ClassroomInfo.EditClassroom() end,
    } )
        
    _G.GUI.NewLabel(
    {
        x           = "30%",
        y           = "8%",
        name        = "lblClassroomName",
        group       = "schoolInfo",
        theme       = "theme_5",
        width       = "100%",
        height      = "20",
        caption     = "",
        fontSize    = "28",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "30%",
        y           = "15%",
        name        = "lblClassroomLabelTurn",
        theme       = "theme_5",
        width       = "15%",
        height      = "auto",
        caption     = "Turno: ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        --border      = {"inset",4,1, 245,255,245,50},
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "45%",
        y           = "15%",
        name        = "lblClassroomTurn",
        theme       = "theme_5",
        width       = "100%",
        height      = "auto",
        caption     = "",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "30%",
        y           = "20.5%",
        name        = "lblClassroomLabelLevel",
        theme       = "theme_5",
        width       = "15%",
        height      = "auto",
        caption     = "Nível: ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "45%",
        y           = "20.5%",
        name        = "lblClassroomLevel",
        theme       = "theme_5",
        width       = "100%",
        height      = "auto",
        caption     = "",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "30%",
        y           = "26%",
        name        = "lblClassroomLabelTeacher",
        theme       = "theme_5",
        width       = "15%",
        height      = "auto",
        caption     = "Professor: ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        --border      = {"inset",4,1, 245,255,245,50},
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "45%",
        y           = "26%",
        name        = "lblClassroomTeacher",
        theme       = "theme_5",
        width       = "100%",
        height      = "auto",
        caption     = " ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
        
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "30%",
        y           = "31.5%",
        name        = "lblClassroomLabelSchoolYear",
        theme       = "theme_5",
        width       = "15%",
        height      = "auto",
        caption     = "Ano: ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        border      = {"inset",4,1, 245,255,245,50},
        --border      = { "normal", 1, 1, 181, 181, 181, 50 }
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "45%",
        y           = "31.5%",
        name        = "lblClassroomSchoolYear",
        theme       = "theme_5",
        width       = "100%",
        height      = "auto",
        caption     = "",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
     
   ClassroomInfo.Hide()
    
  return self
end

function ClassroomInfo.EditClassroom()
    local window = ClassroomInputScr()
 
    window.edit( classroomData[classroomIndex].name,
                classroomData[classroomIndex].turn,
                classroomData[classroomIndex].sublevel,
                classroomData[classroomIndex].teacher,
                classroomData[classroomIndex].schoolYear,
                classroomIndex
                )    
end

function ClassroomInfo.Hide()
    _G.GUI.Show("imgBgClassroom", false, animeTime )
    _G.GUI.Show("lblClassroomName", false, animeTime )
    _G.GUI.Show("lblClassroomTurn", false, animeTime )
    _G.GUI.Show("lblClassroomLevel", false, animeTime )
    _G.GUI.Show("lblClassroomTeacher", false, animeTime )
    _G.GUI.Show("lblClassroomSchoolYear", false, animeTime )
    _G.GUI.Show("lblClassroomLabelTurn", false, animeTime )
    _G.GUI.Show("lblClassroomLabelLevel", false, animeTime )
    _G.GUI.Show("lblClassroomLabelTeacher", false, animeTime )
    _G.GUI.Show("lblClassroomLabelSchoolYear", false, animeTime )
    _G.GUI.Show("btnEditClassroom", false, animeTime)
end

function ClassroomInfo.Show()
    _G.GUI.GetHandle("lblClassroomTurn"):set("caption", "")
    _G.GUI.GetHandle("lblClassroomTeacher"):set("caption", "")
    _G.GUI.GetHandle("lblClassroomLevel"):set("caption", "")
    _G.GUI.GetHandle("lblClassroomSchoolYear"):set("caption", "")
    
    _G.GUI.Show("imgBgClassroom", true, animeTime )
    _G.GUI.Show("lblClassroomName", true, animeTime )
    _G.GUI.Show("lblClassroomTurn", true, animeTime )
    _G.GUI.Show("lblClassroomLevel", true, animeTime )
    _G.GUI.Show("lblClassroomTeacher", true, animeTime )
    _G.GUI.Show("lblClassroomSchoolYear", true, animeTime )
    _G.GUI.Show("lblClassroomLabelTurn", true, animeTime )
    _G.GUI.Show("lblClassroomLabelLevel", true, animeTime )
    _G.GUI.Show("lblClassroomLabelTeacher", true, animeTime )
    _G.GUI.Show("lblClassroomLabelSchoolYear", true, animeTime )

    _G.GUI.Show("btnEditClassroom", true, animeTime)
end

function ClassroomInfo.ShowClassroom()
    ClassroomInfo.Show()
    
    getClassroomData( classroomData[classroomIndex].code )
    
    
    _G.GUI.GetHandle("lblClassroomName"):set("caption", classroomData[classroomIndex].name)
    
    local turn = getName( turnData, classroomData[classroomIndex].turn )
    local teacher = getName(  teacherData, classroomData[classroomIndex].teacher )
    local subLevel = getName( subLevelData, classroomData[classroomIndex].sublevel )
    local schoolYear = getName ( schoolYearData, classroomData[classroomIndex].schoolYear )
            
            
    _G.GUI.GetHandle("lblClassroomTurn"):set("caption", turn)
    _G.GUI.GetHandle("lblClassroomTeacher"):set("caption", teacher)
    _G.GUI.GetHandle("lblClassroomLevel"):set("caption", subLevel)
    _G.GUI.GetHandle("lblClassroomSchoolYear"):set("caption", schoolYear)
    
    
    
    
    
end







