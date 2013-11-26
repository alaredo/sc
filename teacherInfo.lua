require ("data")
require ("util")
require ("comboBox")
require ("listBox")

TeacherInfo = {}
TeacherInfo.__index = TeacherInfo

local animeTime = 500
local classroomTeacherList = {}


function TeacherInfo.new()
  local self = setmetatable({}, TeacherInfo)
  
  _G.GUI.NewImage( display.newImage(getImage("imgTeacherInfoBg.png")),
    {
        x               = "25%",
        y               = "0%",
        width           = "75%",
        height          = "90%",
        name            = "imgBgTeacher",
        group           = "schoolInfo",
        border          = {"normal", 4, 1, 245, 255, 245, 50},
    } )
    
    _G.GUI.NewSquareButton(
    {
	x       = "92%",
	y       = "0%",
	name    = "btnEditTeacherInputScr",
	theme   = "theme_5",
	icon    = 28,
	onPress = function( EventData ) TeacherInfo.EditTeacher() end,
    } )
    
    _G.GUI.NewSquareButton(
    {
	x       = "96%",
	y       = "0%",
	name    = "btnDeleteTeacherInputScr",
	theme   = "theme_5",
	icon    = 24,
	onPress = function( EventData ) TeacherInfo.EditTeacher() end,
    } )
    
    _G.GUI.NewImage( display.newImage( getImage("defaultTeacher.jpeg" )),
    {
        x               = "30%",
        y               = "10%",
        width           = "20%",
        height          = "26%",
        name            = "imgTeacher",
        --border          = {"normal", 4, 1, 255, 255, 255, 50},
    } )
     
    _G.GUI.NewLabel(
    {
        x           = "55%",
        y           = "10%",
        name        = "lblTeacherNameLabel",
        theme       = "theme_5",
        width       = "15%",
        height      = "auto",
        caption     = "Nome: ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        --border      = {"inset",4,1, 245,255,245,50},
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "55%",
        y           = "15.5%",
        name        = "lblTeacherEmailLabel",
        theme       = "theme_5",
        width       = "15%",
        height      = "auto",
        caption     = "Email: ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        --border      = {"inset",4,1, 245,255,245,50},
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "55%",
        y           = "21%",
        name        = "lblTeacherEmailAlterLabel",
        theme       = "theme_5",
        width       = "15%",
        height      = "auto",
        caption     = "Email Alternativo: ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        --border      = {"inset",4,1, 245,255,245,50},
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "55%",
        y           = "26.5%",
        name        = "lblTeacherFoneLabel",
        theme       = "theme_5",
        width       = "15%",
        height      = "auto",
        caption     = "Telefone: ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        --border      = {"inset",4,1, 245,255,245,50},
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "55%",
        y           = "32%",
        name        = "lblTeacherFoneAlterLabel",
        theme       = "theme_5",
        width       = "15%",
        height      = "auto",
        caption     = "Telefone: ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        --border      = {"inset",4,1, 245,255,245,50},
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
     _G.GUI.NewLabel(
    {
        x           = "55%",
        y           = "10%",
        name        = "lblTeacherName",
        group       = "schoolInfo",
        theme       = "theme_5",
        width       = "100%",
        height      = "auto",
        caption     = "",
        fontSize    = "28",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "72%",
        y           = "15.5%",
        name        = "lblTeacherEmail",
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
        x           = "72%",
        y           = "21%",
        name        = "lblTeacherEmailAlter",
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
        x           = "72%",
        y           = "26.5%",
        name        = "lblTeacherFone",
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
        x           = "72%",
        y           = "32%",
        name        = "lblTeacherFoneAlter",
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
        y           = "45%",
        name        = "lblTeacherClassroom",
        theme       = "theme_5",
        width       = "40%",
        height      = "auto",
        caption     = "Turmas",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewList(
    {
	x             = "30%",
	y             = "50%",
	name          = "classroomTeacherGrid",
	theme         = "theme_5",
	width         = "25%",
	height        = "auto",
	list          = classroomTeacherList,
	allowDelete   = true,
	readyCaption  = "Quit Editing",
	scrollbar     = "onScroll",
	--onSelect      = function(EventData) GetStudents(EventData.Item.code)  end,
        --onIconPressR  =  function(EventData) printVars(EventData, EventData.Item.code) end,
    } )
    
    TeacherInfo.Hide()
    
    return self
end

function TeacherInfo.CreateClassroomList()
        
    local teacherClassroom = {}
    teacherClassroom = getTeacherClassroom( teacherData[teacherIndex].code )
    classroomTeacherList = {}
    
    for i=1,#teacherClassroom do
        
            table.insert ( classroomTeacherList, { height = "auto", iconR = 40, caption = teacherClassroom[i].Name, textColor = tColor, deletable = false, selectable = true, code = teacherClassroom[i].Code })

    end
            
    _G.GUI.Set("classroomTeacherGrid", { list = classroomTeacherList } )
    
end

function TeacherInfo.CreateImage()
    local repository = require("dao.repository")
    
--    repository.uploadImage("AE_PROFESSOR", teacherData[teacherIndex].PRO_CODIGO, "images/teacher1.jpg")
    
--    repository.downloadImage("AE_PROFESSOR", teacherData[teacherIndex].PRO_CODIGO, getImage("download.jpg"))
    local imageName = getImage("defaultTeacher.jpeg")
    if not teacherData[teacherIndex].pictureName == "" then
        imageName = getImage(teacherData[teacherIndex].pictureName)
    end
    
    _G.GUI.GetHandle("imgTeacher"):destroy()
    _G.GUI.NewImage( display.newImage( imageName ),
    {
        x               = "30%",
        y               = "10%",
        width           = "20%",
        height          = "30%",
        name            = "imgTeacher",
        border      = { "shadow", 3, 8, 181, 10, 181, 100 },
    } )  

end

function TeacherInfo.Hide()
    _G.GUI.Show("lblTeacherNameLabel", false, animeTime )
    _G.GUI.Show("lblTeacherEmailLabel", false, animeTime )
    _G.GUI.Show("lblTeacherEmailAlterLabel", false, animeTime )
    _G.GUI.Show("lblTeacherFoneLabel", false, animeTime )
    _G.GUI.Show("lblTeacherFoneAlterLabel", false, animeTime )
    _G.GUI.Show("lblTeacherClassroom", false, animeTime )
    
    _G.GUI.Show("imgBgTeacher", false, animeTime )
    _G.GUI.Show("lblTeacherName", false, animeTime )
    _G.GUI.Show("lblTeacherEmail", false, animeTime )
    _G.GUI.Show("lblTeacherEmailAlter", false, animeTime )
    _G.GUI.Show("lblTeacherFone", false, animeTime )
    _G.GUI.Show("lblTeacherFoneAlter", false, animeTime )
    _G.GUI.Show("imgTeacher", false, animeTime )
    _G.GUI.Show("btnEditTeacherInputScr", false, animeTime )
    _G.GUI.Show("btnDeleteTeacherInputScr", false, animeTime )
    _G.GUI.Show("classroomTeacherGrid", false, animeTime )
    
    
end

function TeacherInfo.Show()
    _G.GUI.Show("lblTeacherNameLabel", false, animeTime )
    _G.GUI.Show("lblTeacherEmailLabel", true, animeTime )
    _G.GUI.Show("lblTeacherEmailAlterLabel", true, animeTime )
    _G.GUI.Show("lblTeacherFoneLabel", true, animeTime )
    _G.GUI.Show("lblTeacherFoneAlterLabel", true, animeTime )
    _G.GUI.Show("lblTeacherClassroom", true, animeTime )
    
    _G.GUI.Show("imgBgTeacher", true, animeTime )
    _G.GUI.Show("lblTeacherName", true, animeTime )
    _G.GUI.Show("lblTeacherEmail", true, animeTime )
    _G.GUI.Show("lblTeacherEmailAlter", true, animeTime )
    _G.GUI.Show("lblTeacherFone", true, animeTime )
    _G.GUI.Show("lblTeacherFoneAlter", true, animeTime )
    _G.GUI.Show("imgTeacher", true, animeTime )
    _G.GUI.Show("btnEditTeacherInputScr", true, animeTime )
    _G.GUI.Show("btnDeleteTeacherInputScr", true, animeTime )
    _G.GUI.Show("classroomTeacherGrid", true, animeTime )
end

function TeacherInfo.ShowTeacher()
    
    TeacherInfo.Show()
    
    getTeacherData(teacherData[teacherIndex].code)
    
    TeacherInfo.CreateImage()
    _G.GUI.Set("lblTeacherName", {caption = teacherData[teacherIndex].name})
    _G.GUI.Set("lblTeacherEmail", {caption = teacherData[teacherIndex].email})
    _G.GUI.Set("lblTeacherEmailAlter", {caption = teacherData[teacherIndex].emailAlter})
    _G.GUI.Set("lblTeacherFone", {caption = teacherData[teacherIndex].fone})
    _G.GUI.Set("lblTeacherFoneAlter", {caption = teacherData[teacherIndex].foneAlter})
    
    TeacherInfo.CreateClassroomList()
end

function TeacherInfo.EditTeacher()
    local window = TeacherInputScr()
    window.edit(teacherData[teacherIndex].name, 
                teacherData[teacherIndex].email, 
                teacherData[teacherIndex].emailALter, 
                teacherData[teacherIndex].fone, 
                teacherData[teacherIndex].foneAlter, 
                "FACEBOOK",
                teacherIndex)
end
