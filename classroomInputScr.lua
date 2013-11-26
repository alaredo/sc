function ClassroomInputScr()
    local self = {}
    
    local cmbTeacher
    local cmbTurn
    local cmbSubLevel
    local cmbSchoolYear
    local classroomEditIndex = -1
    local backModal
 
    function self.save()
        local ok = true
        local nameClassroom =  _G.GUI.Get("txtNameClassroomInputScr", "caption")
        local teacherCode = cmbTeacher.code
        local turnCode = cmbTurn.code
        local subLevelCode = cmbSubLevel.code
        local schoolYearCode = cmbSchoolYear.code
        
        if turnCode == nil then
            cmbTurn.showBorder()
            _G.GUI.Set( "lblAlertClassroomInputScr", { caption = "Informe o turno" })
            ok = false
            return
        end
        
        if teacherCode == nil then
            cmbTeacher.showBorder()
            _G.GUI.Set( "lblAlertClassroomInputScr", { caption = "Informe o professor" } )
            ok = false
            return
        end
        
        if subLevelCode == nil then
            cmbSubLevel.showBorder()
            _G.GUI.Set( "lblAlertClassroomInputScr", { caption = "Informe o periodo" })
            ok = false
            return
        end
        if schoolYearCode == nil then
            cmbSchoolYear.showBorder()
            _G.GUI.Set( "lblAlertClassroomInputScr", { caption = "Informe o ano letivo" })
            ok = false
            return
        end
        
        
        if ok == true then
            
            if classroomEditIndex == -1 then     
                updateClassroom({ Code = 0, Name=nameClassroom, Turn = turnCode, Teacher = teacherCode, Sublevel = subLevelCode, SchoolYear = schoolYearCode })
                fillClassroom()
                --table.insert(classroomData, { name=nameClassroom, code = getNextCode(classroomData), turn = turnCode, teacher = teacherCode, sublevel = subLevelCode, schoolYear = schoolYearCode })
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
    
    function self.edit(nameClassroom, turnClassroom, subLevelClassroom, teacherClassroom, schoolYearClassroom, editIndex)
        classroomEditIndex = editIndex
      
      --  _G.GUI.Set( "classroomInputScr", {caption = "Editar"} )
        _G.GUI.Set( "txtNameClassroomInputScr", {caption = nameClassroom} )
        cmbSchoolYear.set(schoolYearClassroom)
        cmbSubLevel.set(subLevelClassroom)
        cmbTeacher.set(teacherClassroom)
        cmbTurn.set(turnClassroom)
    end
    
    function self.close()
        
        _G.GUI.GetHandle("lblClassroomInputLabelTurn"):destroy()
        _G.GUI.GetHandle("lblClassroomInputLabelLevel"):destroy()
        _G.GUI.GetHandle("lblClassroomInputLabelTeacher"):destroy()
        _G.GUI.GetHandle("lblClassroomInputLabelSchoolYear"):destroy()
        
        _G.GUI.GetHandle("imgBgClassroomInputScr"):destroy()
        _G.GUI.GetHandle("txtNameClassroomInputScr"):destroy()
        _G.GUI.GetHandle("btnOkClassroomInputScr"):destroy()
        _G.GUI.GetHandle("btnCancelClassroomInputScr"):destroy()
        _G.GUI.GetHandle("lblAlertClassroomInputScr"):destroy()
        
        cmbSchoolYear.destroy()
        cmbTeacher.destroy()
        cmbSubLevel.destroy()
        cmbTurn.destroy() 
        backModal:removeSelf()
    end
    
    
    backModal = display.newRect( 1, 1, display.contentWidth, display.contentHeight)
    backModal:setFillColor( 185, 231, 40, 1 )
    backModal.isHitTestable = true
    backModal:addEventListener( "touch", function( EventData ) return true end )
    backModal:addEventListener( "tap", function( EventData ) return true end )
    
    _G.GUI.NewImage( display.newImage(getImage("imgClassroomInfoBg.png")),
    {
        x               = "25%",
        y               = "5.5%",
        width           = "75%",
        height          = "100%",
        name            = "imgBgClassroomInputScr",
        --border          = {"normal", 4, 6, 245, 255, 245, 100},
    } )
        
    _G.GUI.NewSquareButton(
    {
	x       = "88%",
	y       = "0%",
	name    = "btnOkClassroomInputScr",
	theme   = "theme_5",
        caption = "Ok",
	icon    = 15,
	onPress = function( EventData ) self.save() end,
	
    } )
        
        
    _G.GUI.NewSquareButton(
    {
	x       = "92%",
	y       = "0%",
	name    = "btnCancelClassroomInputScr",
	theme   = "theme_5",
        caption = "Cancelar",
	icon    = 16,
	onPress = function( EventData ) self.close() end,
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "26%",
        y           = "95%",
        name        = "lblAlertClassroomInputScr",
        theme       = "theme_5",
        width       = "74%",
        caption     = "",
        fontSize    = "22",
        textColor   = {255,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    })
    
    _G.GUI.NewInput(
    {
	x               = "30%",
	y               = "8%",
	width           = "66%",
	theme           = "theme_5",
	name            = "txtNameClassroomInputScr",
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
    
    _G.GUI.NewLabel(
    {
        x           = "30%",
        y           = "15%",
        name        = "lblClassroomInputLabelTurn",
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
        x           = "30%",
        y           = "20.5%",
        name        = "lblClassroomInputLabelLevel",
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
        x           = "30%",
        y           = "26%",
        name        = "lblClassroomInputLabelTeacher",
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
        x           = "30%",
        y           = "31.5%",
        name        = "lblClassroomInputLabelSchoolYear",
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
    
    
    cmbSchoolYear   = ComboBox("cmbSchoolYearClassroomInputScr", "46%", "31.5%", "35.5%", "50%", schoolYearData, "Ano Letívo", "")
    cmbTeacher      = ComboBox("cmbTeacherClassroomInputScr",    "46%", "26%", "30.5%", "50%", teacherData, "Professor", "")
    cmbSubLevel     = ComboBox("cmbSublevelClassroomInputScr",   "46%", "20.5%", "24.5%", "50%", subLevelData, "Nivel", "")
    cmbTurn         = ComboBox("cmbTurnClassroomInputScr",       "46%", "15%", "19.5%", "50%", turnData, "Turno", "")

    classroomEditIndex = -1
    
    return self
end

