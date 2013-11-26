require ("data")
require ("util")
require ("classroomScreen")
require ("studentScreen")
require ("classroomInputScr")
require ("teacherInputScr")
require ("teacherScreen")
require ("studentInputScr")

StudentMnu = {}
StudentMnu.__index = StudentMnu

local Scene
local StudentList = {}
local ClassroomList = {}
local TeacherList = {}
local studentScr 
local classroomScr
local teacherScr

function StudentMnu.new(sc)
    local self = setmetatable({}, StudentMnu)
    
    Scene = sc    
    
    _G.GUI.NewLabel(
    {
        x           = "0%",
        y           = "1%",
        name        = "lblStudentTitle",
        theme       = "theme_5",
        width       = "255",
        caption     = "Alunos",
        fontSize    = "26",
        textColor   = {206,238,21},
        textAlign   = "center",
        group       = "Menu",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    
    _G.GUI.NewSquareButton(
    {
        x       = 0,
        y       = 0,
        name    = "btnBackStudent",
        theme   = "theme_5",
        icon    = 23,
        onPress = function( EventData ) StudentMnu:BackButton() end,
    } )
    
    _G.GUI.NewSquareButton(
    {
        x       = "21%",
        y       = 0,
        name    = "btnAddStudent",
        theme   = "theme_5",
        icon    = 7,
        onPress = function( EventData ) StudentMnu:AddButton() end,
    } )
    
    studentScr = StudentScr.new()
    classroomScr = ClassroomScr.new()
    teacherScr = TeacherScr.new()
    StudentMnu.GetAllStudents()
    StudentMnu.CreateStudentList()
    StudentMnu.CreateClassroomList()
    StudentMnu.CreateTeacherList()
    StudentMnu.Hide()
    
    return self
end

function StudentMnu.AddButton()
    if activeMenu == "Classroom" then
        local window = ClassroomInputScr()
    end
    
    if activeMenu == "Teacher" then
        local window = TeacherInputScr()
    end
    
    if activeMenu == "Student" then
        local window = StudentInputScr()
    end
    
end

function StudentMnu.CreateClassroomList()
    ClassroomList={}
    for i=1,#classroomData do
        table.insert(ClassroomList, i, { height = "auto", iconR = 40, caption = classroomData[i].name, textColor = tColor, deletable = false, selectable = true, code = classroomData[i].code })
    end
    
    
    _G.GUI.NewList(
    {
	x             = "0%",
	y             = "7%",
	name          = "classroomGrid",
	theme         = "theme_5",
	width         = "25%",
	height        = "75%",
	list          = ClassroomList,
	allowDelete   = true,
	readyCaption  = "Quit Editing",
	scrollbar     = "onScroll",
	onSelect      = function(EventData) GetStudents(EventData.Item.code)  end,
        onIconPressR  =  function(EventData) printVars(EventData, EventData.Item.code) end,
    } )
end

function StudentMnu.CreateTeacherList()
    for i=1,#teacherData do
        table.insert(TeacherList, i, { height = "auto", iconR = 40, caption = teacherData[i].name, textColor = tColor, deletable = false, selectable = true, code = teacherData[i].code })        
    end
    
    _G.GUI.NewList(
    {
	x             = "0%",
	y             = "10%",
	name          = "teacherGrid",
	theme         = "theme_5",
	width         = "25%",
	height        = "75%",
	list          = TeacherList,
	allowDelete   = true,
	readyCaption  = "Quit Editing",
	scrollbar     = "onScroll",
	onSelect      = function(EventData) GetStudentsTeacher(EventData.Item.code) end,
        onIconPressR  =  function(EventData) printVars(EventData, EventData.Item.code) end,
    } )
end

function GetStudents( c )
    StudentMnu.ClassroomShow(c)
    
    StudentList = {}
    local students = {}
    students = getStudentsClassroom( c )
    for i=1, #students do 
        
        table.insert(StudentList, { height = "auto", iconR = 40, code = students[i].Code, caption = students[i].Name, textColor = tColor, deletable = false, selectable = true })
    end
       
    table.insert( lastMenu,  "Classroom")
    activeMenu = "Student"
    _G.GUI.GetHandle("studentGrid"):destroy()
    StudentMnu.CreateStudentList()  
    StudentMnu.Show()
    
end

function GetStudentsTeacher( c )   
    StudentMnu.ShowTeacher(c)
    
    StudentList = {}
    local posArray = 1
    for i=1,#studentData do
        if studentData[i].teacher == c then 
            table.insert(StudentList, posArray, { height = "auto", iconR = 40, code = studentData[i].code, caption = studentData[i].name, textColor = tColor, deletable = false, selectable = true, image = getImage(studentData[i].pictureName), imageSize = 30 })     
            posArray = posArray + 1
        end    
    end
    
    
    table.insert( lastMenu,  "Teacher")
    activeMenu = "Student"
    _G.GUI.GetHandle("studentGrid"):destroy()
    _G.GUI.Show("teacherGrid", false, 0)
    StudentMnu.CreateStudentList() 
    StudentMnu.Show()
    
end

function StudentMnu.GetAllStudents()
    StudentList = {}
    for i=1,#studentData do
        --, image = getImage(studentData[i].pictureName), imageSize = 30
        table.insert(StudentList, i, { height = "auto", iconR = 40, code = studentData[i].code, caption = studentData[i].name, textColor = tColor, deletable = false, selectable = true })     
    end
end

function StudentMnu.CreateStudentList()
    
    _G.GUI.NewList(
    {
	x             = "0",
	y             = "7%",
	name          = "studentGrid",
	theme         = "theme_5",
	width         = "25%",
	height        = "auto",
	list          = StudentList,
	allowDelete   = true,
	readyCaption  = "Quit Editing",
	scrollbar     = "onScroll",
	onSelect      = function(EventData) printVars(EventData, EventData.Item.code) end,
--        onIconPressR  =  function(EventData) printVars(EventData, EventData.Item.code) end,
    } )
    
end

function printVars(event, var1)
    local code = var1
    
    if activeMenu == "Classroom" then
        StudentMnu.ClassroomShow(code)
    end
    
    if activeMenu == "Student" then
        StudentMnu.ShowStudent(code)
    end
    
    if activeMenu == "Teacher" then
        StudentMnu.ShowTeacher(code)
    end
end

function StudentMnu.ClassroomShow(c)
    
    for i=1,#classroomData do
        if classroomData[i].code == c then 
            School.HideAll()
            studentScr.Hide()
            teacherScr.Hide()
            classroomIndex = i
            classroomScr.ShowClassroom()
            break
        end
    end
end

function StudentMnu.Hide() 
    _G.GUI.Show("lblStudentTitle", false, animeTime )
    _G.GUI.Show("btnBackStudent", false, animeTime )
    _G.GUI.Show("btnAddStudent", false, animeTime )
    _G.GUI.Show("studentGrid", false, animeTime )
    _G.GUI.Show("classroomGrid", false, animeTime )
    _G.GUI.Show("teacherGrid", false, animeTime )
end

function StudentMnu.Show() 
    
    _G.GUI.GetHandle("lblStudentTitle"):set("caption", "Alunos")
    _G.GUI.Show("lblStudentTitle", true, animeTime )
    _G.GUI.Show("btnBackStudent", true, animeTime )
    _G.GUI.Show("btnAddStudent", true, animeTime )
    _G.GUI.Show("studentGrid", true, animeTime )
    _G.GUI.Show("classroomGrid", false, 0)
end

function StudentMnu.ShowStudent(c)
    for i=1,#studentData do
        if studentData[i].code == c then 
            studentIndex = i
            ClassroomScr:Hide()
            TeacherScr:Hide()
            StudentScr:ShowStudent()
            break
        end
    end
end

function StudentMnu.ShowStudentMnu() 
    activeMenu = "Student"
 --   _G.GUI.GetHandle("studentGrid"):destroy()
    StudentList = {}
    StudentMnu.GetAllStudents()
    _G.GUI.Set( "studentGrid", { list  = StudentList } )
 --   StudentMnu.CreateStudentList()
    
    _G.GUI.GetHandle("lblStudentTitle"):set("caption", "Alunos")
    _G.GUI.Show("lblStudentTitle", true, animeTime )
    _G.GUI.Show("btnAddStudent", true, animeTime )
    _G.GUI.Show("btnBackStudent", true, animeTime )
    _G.GUI.Show("studentGrid", true, animeTime )
    _G.GUI.Show("classroomGrid", false, 0 )
end

function StudentMnu.ShowClassroomMnu() 
    activeMenu = "Classroom"
    ClassroomList = {}
    
    for i=1,#classroomData do
        table.insert(ClassroomList, i, { height = "auto", iconR = 40, caption = classroomData[i].name, textColor = tColor, deletable = false, selectable = true, code = classroomData[i].code })
    end    
    _G.GUI.Set( "classroomGrid", { list  = ClassroomList } )
        
        
    
    _G.GUI.GetHandle("lblStudentTitle"):set("caption", "Turmas")
    _G.GUI.Show("lblStudentTitle", true, animeTime )
    _G.GUI.Show("btnAddStudent", true, animeTime )
    _G.GUI.Show("btnBackStudent", true, animeTime )
    _G.GUI.Show("studentGrid", false, animeTime )
    _G.GUI.Show("classroomGrid", true, animeTime )
    
end

function StudentMnu.ShowTeacher(c)
    for i=1,#teacherData do
        if teacherData[i].code == c then 
            School:HideAll()
            StudentScr:Hide()
            teacherIndex = i
            TeacherScr:ShowTeacher()
            break
        end
    end
end

function StudentMnu.ShowTeacherMnu()
    activeMenu = "Teacher"
    TeacherList = {}
    
    for i=1,#teacherData do
        table.insert(TeacherList, i, { height = "auto", iconR = 40, caption = teacherData[i].name, textColor = tColor, deletable = false, selectable = true, code = teacherData[i].code })
    end
    _G.GUI.Set( "teacherGrid", { list  = TeacherList } )
    
    
    _G.GUI.GetHandle("lblStudentTitle"):set("caption", "Professores")
    _G.GUI.Show("lblStudentTitle", true, animeTime )
    _G.GUI.Show("btnAddStudent", true, animeTime )
    _G.GUI.Show("btnBackStudent", true, animeTime )
    _G.GUI.Show("studentGrid", false, animeTime )
    _G.GUI.Show("classroomGrid", false, animeTime )
    _G.GUI.Show("teacherGrid", true, animeTime )
end

function StudentMnu.BackButton()
   
    
   
    local lastPosMenu = #lastMenu
    if lastMenu[lastPosMenu] == "Main" then
        StudentMnu.Hide()
        Scene:mnuShow()
    end
    
    if lastMenu[lastPosMenu] == "Student" then
        StudentMnu.ShowStudentMnu()
    end
    
    if lastMenu[lastPosMenu] == "Classroom" then
        StudentMnu.ShowClassroomMnu()
        
    end
        
    if lastMenu[lastPosMenu] == "Teacher" then
        StudentMnu.ShowTeacherMnu()
    end
    
    table.remove(lastMenu, lastPosMenu)
    
end
