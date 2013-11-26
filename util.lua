require ("data")
local json = require("json")

function getImage(imageName)
    return imageFolder .. imageName
end

function getName(tableSearch, codeSearch)
    for i=1,#tableSearch do
        if tableSearch[i].code == codeSearch then 
            return tableSearch[i].name
        end
    end
end

function addValScreen( strValue, vr )
    local pos = string.len(strValue)
    local val = string.sub(strValue, 1, pos - 1)
    local total = val + vr
    return total .. "%"
end


function trace( strMsg )
    print( "================================================================")
    print( strMsg )
    print( "================================================================")
end



function getNextCode( tableData )
    local greater = 0
    for i=1,#tableData do
        if tableData[i].code > greater then
            greater = tableData[i].code
        end
    end
    return greater + 1
end


---------------------------------------------------------------------------
function getFromServer( add )
    local response = {}
    local result = {}
    local http = require("socket.http")
    local ltn12 = require("ltn12")
    local json = require("json")
    
    address = add
    
    http.request{
        url = address,
        method = "GET",
        headers = {
            ["token"] = token,
        },
        sink = ltn12.sink.table(result)
    }
    
    response = json.decode(result[1])

    return response
end


function fillTurn()
    local turn = {}
    turn = getFromServer( "http://aeservices.azurewebsites.net/api/Shifts" ) 
    
    for i=1,#turn do
        table.insert(turnData, i, { code = turn[i].Code, name = turn[i].Name, description = turn[i].Description  })
    end 
end


function fillLevel()
    local level = {}
    level = getFromServer( "http://aeservices.azurewebsites.net/api/EducationLevelTree" )
   
    for i=1,#level do
        table.insert(levelData, i, { code = level[i].Code, name = level[i].Name, description = level[i].Description  })
    end 
end

function fillSubLevel()
    local sublevel = {}
    sublevel = getFromServer( "http://aeservices.azurewebsites.net/api/EducationSubLevel/?owner=1" )
    
    for i=1,#sublevel do
        table.insert(subLevelData, i, { code = sublevel[i].SubLevel, name = sublevel[i].Name, description = sublevel[i].Description  })
    end 
end


function fillSchoolYear()
    local schoolYear 
    schoolYear = getFromServer( "http://aeservices.azurewebsites.net/api/ScholarshipTerms" )
    
    for i=1,#schoolYear do
        table.insert(schoolYearData, i, { code = schoolYear[i].Code, name = schoolYear[i].Name, year = schoolYear[i].year  })
    end 
end


function fillClassroom()
    local classroom = {}

    classroom = getFromServer( "http://aeservices.azurewebsites.net/api/Classrooms/" )
    classroomData = {}
    for i=1,#classroom do
        table.insert(classroomData, i, { code = classroom[i].Code, name = classroom[i].Name, version = classroom[i].Version  })
    end 
end



function fillTeachers()
    local teacher = {}
    teacher = getFromServer( "http://aeservices.azurewebsites.net/api/Teachers/" )
    --trace("=== Teachers =====")
    for i=1,#teacher do
      --  print ( teacher[i].Code .. " " .. teacher[i].Name .. " " ..teacher[i].Version )
        table.insert(teacherData, i, { code = teacher[i].Code, name = teacher[i].Name, version = teacher[i].Version  })
    end 
end


function fillStudents()
    local students = {}
    students = getFromServer( "http://aeservices.azurewebsites.net/api/Studants/" )
    trace("=== Students ====")
    for i=1,#students do
        print ( students[i].Code .. " " .. students[i].Name .. " " .. students[i].Version )
        table.insert(studentData, i, { code = students[i].Code, name = students[i].Name, version = students[i].Version  })
    end 
end

function fillDB() 
    
    fillTurn()
    fillLevel()
    fillSubLevel()
    fillSchoolYear()
    fillClassroom()
    fillTeachers() 
    fillStudents()
end


function post( params, address )
    local http = require("socket.http")
    local result = {}
    local data = json.encode(params)
    trace ("Data Post")
    trace (data)
    http.request{
        url = address,
        method = "POST",
        headers = {
            ["token"] = token,
            ["content-length"] = string.len(data),
            ["content-type"] = "application/json"
        },
        source = ltn12.source.string(data),
        sink = ltn12.sink.table(result)
    }


    local response = {}
    response = json.decode(result[1])
    
    if (response == nil ) then 
        --Adicionar seu tratamento de erro quando o servidor não está disponivel
        print("Servidor fora do ar.")
    elseif (response.Exception ~= nil) then
        --Adicionar seu tratamento de erro quando o servidor retornou um erro
        print("Erro! " .. response.Exception)
    else
      --  classrooms = response;
        print("result[1]: " .. result[1] )
        
    end 
end


function updateClassroom( params )
    post ( params, "http://aeservices.azurewebsites.net/api/Classrooms/" )
end


function updateTeacher( params )
    trace( "==== Update Teacher ====================")
    
    post ( params, "http://aeservices.azurewebsites.net/api/Teachers/" )
    
    teacherData = {}
    fillTeachers()
end

function updateStudent( params )
    post ( params,  "http://aeservices.azurewebsites.net/api/Students/")
end


function getClassroomData( code )
    local classroom = {}

    classroom = getFromServer( "http://aeservices.azurewebsites.net/api/Classrooms/" .. code )
  
    for i=1,#classroomData do
        if classroomData[i].code == code then
            --classroomData[i].name = classroom.Name
            classroomData[i].turn = classroom.Turn
            classroomData[i].teacher = classroom.Teacher
            classroomData[i].sublevel = classroom.SubLevel
            classroomData[i].schoolYear = classroom.SchoolYear
            classroomData[i].version = classroom.Version
        end
    end 
end


function getTeacherData( code )
    local teacher = {}
    
    teacher = getFromServer( "http://aeservices.azurewebsites.net/api/Teachers/" .. code  ) --json.decode(result[1])
    
--{"Code":1,"Name":"Alexandre Laredo","EMailPrincipal":"laredo@estatec.com.br","AternativeEMail":"","Facebook":"","Telephone":"","AternativeTelephone":"","Picture":""}
    for i=1,#teacherData do
        if teacherData[i].code == code then
            teacherData[i].name = teacher.Name
            teacherData[i].email = teacher.EMailPrincipal
            teacherData[i].emailAlter = teacher.AternativeEMail
            teacherData[i].facebook = teacher.Facebook
            teacherData[i].fone = teacher.Telephone
            teacherData[i].foneAlter = teacher.AternativeTelephone
            teacherData[i].picture = teacher.Picture
            teacherData[i].version = teacher.Version
        end
    end 
end

function getStudentData( code )
    local student = {}
    trace( " ==== Student Data ====")
    student = getFromServer( "http://aeservices.azurewebsites.net/api/Studants/" .. code  ) --json.decode(result[1])

    for i=1,#studentData do
        if studentData[i].code == code then
            studentData[i].name = student.Name
            studentData[i].email = student.EMailPrincipal
            studentData[i].emailAlter = student.AternativeEMail
            studentData[i].facebook = student.Facebook
            studentData[i].fone = student.Telephone
            studentData[i].foneAlter = student.AternativeTelephone
            studentData[i].picture = student.Picture
            studentData[i].classroom = student.ClassroomCode
            studentData[i].pictureName = ""
            studentData[i].version = student.Version
        end
    end 
end



function getTeacherClassroom( code )
    local classroomTeacher = {}
    
    classroomTeacher = getFromServer( "http://aeservices.azurewebsites.net/api/TeacherClassrooms/" .. code )
    return classroomTeacher    
end


function getStudentsClassroom( code )
    local studentsClassroom = {}
    
    studentsClassroom = getFromServer( "http://aeservices.azurewebsites.net/api/ClassroomsStudants/" .. code ) 
    return studentsClassroom 
end


function getToken()    
    local result = {}
    local http = require("socket.http")
    local ltn12 = require("ltn12")
    local json = require("json")

--Procedimento para obter o token
    http.request{
        url = address .. "GetToken",
            method = "GET",
            headers = {
                ["user"] = login,
                ["password"] = password,
            },
        sink = ltn12.sink.table(result)
    }
    token = result[1]
    trace ("Token: " .. token)
    fillDB()
end


