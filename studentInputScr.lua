function StudentInputScr()
    local self = {}
    local backModal
    
    local txtEmail
    local txtEmailAlter
    local txtFacebook
    local txtFone
    local txtFoneAlter
    local studentEditIndex = -1
    
    function self.save()
        local ok = true
        
        if ok == true then
            
            if studentEditIndex == -1 then     
                updateStudent({ Code = 0, Name=nameClassroom, Turn = turnCode, Teacher = teacherCode, Sublevel = subLevelCode, SchoolYear = schoolYearCode })
                fillStudents()
                self.close()
                
                
            else
                updateClassroom({ Code = classroomData[classroomEditIndex].code, Name=nameClassroom, Turn = turnCode, Teacher = teacherCode, Sublevel = subLevelCode, SchoolYear = schoolYearCode  })
                fillClassroom()
                classroomData[classroomEditIndex].name = nameClassroom
                classroomData[classroomEditIndex].turn = turnCode
                classroomData[classroomEditIndex].teacher = teacherCode
                classroomData[classroomEditIndex].sublevel = subLevelCode
                classroomData[classroomEditIndex].schoolYear = schoolYearCode
                
                ClassroomInfo:ShowClassroom()
                self.close()     
            end
        end
    end
    
    function self.close()
        
        
        txtEmail.Destroy()
        txtEmailAlter.Destroy()
        txtFacebook.Destroy()
        txtFone.Destroy()
        txtFoneAlter.Destroy()
        
        _G.GUI.GetHandle("imgBgStudentInputScr"):destroy()
        
        _G.GUI.GetHandle("btnOkStudentInputScr"):destroy()
        _G.GUI.GetHandle("btnCancelStudentInputScr"):destroy()
        _G.GUI.GetHandle("lblAlertStudentInputScr"):destroy()
        _G.GUI.GetHandle("txtNameStudentInputScr"):destroy()
        backModal:removeSelf()
    end
    
    function self.EditStudent()
        
    end
    
    function self.edit(nameStudent, emailStudent, emailAlterStudent, facebookStudent, foneStudent, foneAlterStudent )
        
        _G.GUI.Set("txtNameStudentInputScr", { caption = nameStudent })
        
        txtEmail.Edit( emailStudent )
        txtEmailAlter.Edit( emailAlterStudent)
        
        txtFacebook.Edit(facebookStudent)
        txtFone.Edit(foneStudent)
        txtFoneAlter.Edit(foneAlterStudent)
        
    end
    
    backModal = display.newRect( 1, 1, display.stageWidth, display.stageHeight)
    backModal:setFillColor( 185, 231, 40, 1 )
    backModal.isHitTestable = true
    backModal:addEventListener( "touch", function( EventData ) return true end )
    backModal:addEventListener( "tap", function( EventData ) return true end )
    
    _G.GUI.NewImage( display.newImage(getImage("imgStudentInfoBg.png")),
    {
        x               = "25%",
        y               = "0%",
        width           = "75%",
        height          = "100%",
        name            = "imgBgStudentInputScr",
        --border          = {"normal", 4, 6, 245, 255, 245, 100},
    } )
    
    _G.GUI.NewSquareButton(
    {
	x       = "88%",
	y       = "0%",
	name    = "btnOkStudentInputScr",
	theme   = "theme_5",
	icon    = 15,
        
	onPress = function( EventData ) self.save() end,
	
    } )
        
    _G.GUI.NewSquareButton(
    {
	x       = "92%",
	y       = "0%",
	name    = "btnCancelStudentInputScr",
	theme   = "theme_5",
	icon    = 16,
        
	onPress = function( EventData ) self.close() end,
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "5%",
        y           = "85%",
        name        = "lblAlertStudentInputScr",
        theme       = "theme_5",
        width       = "100%",
        caption     = "",
        fontSize    = "22",
        textColor   = {255,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    
    txtEmail        = TextLine("emailStudentInputScr",         "30%", "43%", "Email ", 15, 30 )
    txtEmailAlter   = TextLine("emailAlterStudentInputScr",    "30%", "48.5%", "Email Alternativo ", 15, 30 )
    txtFacebook     = TextLine("facebookStudentInputScr",      "30%", "54%", "Facebook ", 15, 30 )
    txtFone         = TextLine("foneStudentInputScr",          "30%", "59.5%", "Telefone ", 15, 30 )
    txtFoneAlter    = TextLine("foneAlterStudentInputScr",     "30%", "65%", "Telefone Alternativo ", 15, 30 )

    _G.GUI.NewInput(
    {
	x               = "30%",
	y               = "8%",
	width           = "66%",
	theme           = "theme_5",
	name            = "txtNameStudentInputScr",
    	caption         = "Nome",
        --fontsize        = 32,
	notEmpty        = true,
	textColor       = {20,40,20},
	inputType       = "default", -- "number" | "password" | "default"
	quitCaption     = "Toque a tela para sair.",
        --border          = {"normal",1,1, 245,255,245,50},
	--onChange        = function(EventData) print(EventData.value) end,
	--onBlur          = function(EventData) print(EventData.value) end,
    } )
    
    txtEmail.Edit()
    txtEmailAlter.Edit()
    txtFacebook.Edit()
    txtFone.Edit()
    txtFoneAlter.Edit()
    
    return self
    
end

