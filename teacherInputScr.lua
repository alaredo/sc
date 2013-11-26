function TeacherInputScr()
    local self = {}
    
    local cmbTeacher
    local cmbTurn
    local cmbSubLevel
    local cmbSchoolYear
    local teacherEditIndex = 0
    local backModal
 
    function self.save()
        local ok = true
        local nameTeacher = _G.GUI.Get("txtNameTeacherInputScr", "caption") 
        local emailTeacher = _G.GUI.Get("txtEmailTeacherInputScr", "caption")
        local emailAlterTeacher = _G.GUI.Get("txtEmailAlterTeacherInputScr", "caption")
        local facebookTeacher = _G.GUI.Get("txtFacebookTeacherInputScr", "caption")
        local foneTeacher = _G.GUI.Get("txtFoneTeacherInputScr", "caption")
        local foneAlterTeacher = _G.GUI.Get("txtFoneAlterTeacherInputScr", "caption")
        
        if ok == true then
            if teacherEditIndex == -1 then 
                updateTeacher( {    Code = 0,
                                    Name=nameTeacher, 
                                    EMailPrincipal = emailTeacher, 
                                    AternativeEMail = emailAlterTeacher,
                                    Facebook = facebookTeacher,
                                    Telephone = foneTeacher,
                                    AternativeTelephone = foneAlterTeacher,
                                    Picture = ""
                                } )
                self.close()
            else
                updateTeacher( {    Code = teacherData[teacherEditIndex].code,
                                    Name=nameTeacher, 
                                    EMailPrincipal = emailTeacher, 
                                    AternativeEMail = emailAlterTeacher,
                                    Facebook = facebookTeacher,
                                    Telephone = foneTeacher,
                                    AternativeTelephone = foneAlterTeacher,
                                    Picture = ""
                                } )
                self.close()
                TeacherInfo:ShowTeacher()
            end
        end
    end
    
    function self.close()
        _G.GUI.GetHandle("imgBgTeacherInputScr"):destroy()
        _G.GUI.GetHandle("lblTeacherNameLabelInputScr"):destroy()
        _G.GUI.GetHandle("lblTeacherEmailLabelInputScr"):destroy()
        _G.GUI.GetHandle("lblTeacherEmailAlterLabelInputScr"):destroy()
        _G.GUI.GetHandle("lblTeacherFacebookLabelInputScr"):destroy()
        _G.GUI.GetHandle("lblTeacherFoneLabelInputScr"):destroy()
        _G.GUI.GetHandle("lblTeacherFoneAlterLabelInputScr"):destroy()
        
        _G.GUI.GetHandle("txtNameTeacherInputScr"):destroy()
        _G.GUI.GetHandle("txtEmailTeacherInputScr"):destroy()
        _G.GUI.GetHandle("txtEmailAlterTeacherInputScr"):destroy()
        _G.GUI.GetHandle("txtFacebookTeacherInputScr"):destroy()
        _G.GUI.GetHandle("txtFoneTeacherInputScr"):destroy()
        _G.GUI.GetHandle("txtFoneAlterTeacherInputScr"):destroy()
        
        _G.GUI.GetHandle("btnOkTeacherInputScr"):destroy()
        _G.GUI.GetHandle("btnCancelTeacherInputScr"):destroy()
        _G.GUI.GetHandle("lblAlertTeacherInputScr"):destroy()
            
        backModal:removeSelf()
    end
    
    function self.edit( nameEdit, emailEdit, emailAlterEdit, foneEdit, foneAlterEdit, facebookEdit, editIndex)
        teacherEditIndex = editIndex
       -- _G.GUI.Set( "teacherInputScr", {caption = "Editar"} )
        _G.GUI.Set( "txtNameTeacherInputScr", {caption = nameEdit} )
        _G.GUI.Set( "txtEmailTeacherInputScr", {caption = emailEdit} )
        _G.GUI.Set( "txtEmailAlterTeacherInputScr", {caption = emailAlterEdit} )
        _G.GUI.Set( "txtFacebookTeacherInputScr", {caption = facebookEdit} )
        _G.GUI.Set( "txtFoneTeacherInputScr", {caption = foneEdit} )
        _G.GUI.Set( "txtFoneAlterTeacherInputScr", {caption = foneEdit} )
    end
    
    backModal = display.newRect( 1, 1, display.stageWidth, display.stageHeight)
    backModal:setFillColor( 185, 231, 40, 1 )
    backModal.isHitTestable = true
    backModal:addEventListener( "touch", function( EventData ) return true end )
    backModal:addEventListener( "tap", function( EventData ) return true end )
    
    _G.GUI.NewImage( display.newImage(getImage("imgTeacherInfoBg.png")),
    {
        x               = "25%",
        y               = "0%",
        width           = "75%",
        height          = "100%",
        name            = "imgBgTeacherInputScr",
        --border          = {"normal", 4, 6, 245, 255, 245, 100},
    } )
    
     _G.GUI.NewLabel(
    {
        x           = "31%",
        y           = "10%",
        name        = "lblTeacherNameLabelInputScr",
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
        x           = "31%",
        y           = "15.5%",
        name        = "lblTeacherEmailLabelInputScr",
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
        x           = "31%",
        y           = "21%",
        name        = "lblTeacherEmailAlterLabelInputScr",
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
        x           = "31%",
        y           = "26.5%",
        name        = "lblTeacherFacebookLabelInputScr",
        theme       = "theme_5",
        width       = "15%",
        height      = "auto",
        caption     = "Facebook: ",
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        --border      = {"inset",4,1, 245,255,245,50},
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "31%",
        y           = "32%",
        name        = "lblTeacherFoneLabelInputScr",
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
        x           = "31%",
        y           = "37.5%",
        name        = "lblTeacherFoneAlterLabelInputScr",
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

    
    
    
    
    _G.GUI.NewInput(
    {
	x               = "46%",
	y               = "10%",
	width           = "50%",
	theme           = "theme_5",
	name            = "txtNameTeacherInputScr",
	caption         = "Nome",
	notEmpty        = true,
	textColor       = {20,40,20},
	inputType       = "default", -- "number" | "password" | "default"
	quitCaption     = "Toque a tela para sair.",
--	onChange        = function(EventData) print(EventData.value) end,
--	onBlur          = function(EventData) print(EventData.value) end,
    } )
    
    _G.GUI.NewInput(
    {
	x               = "46%",
	y               = "15.5%",
	width           = "50%",
	theme           = "theme_5",
	name            = "txtEmailTeacherInputScr",
	caption         = "Email",
	notEmpty        = true,
	textColor       = {20,40,20},
	inputType       = "default", -- "number" | "password" | "default"
	quitCaption     = "Toque a tela para sair.",
--	onChange        = function(EventData) print(EventData.value) end,
--	onBlur          = function(EventData) print(EventData.value) end,
    } )
    
    _G.GUI.NewInput(
    {
	x               = "46%",
	y               = "21%",
	width           = "50%",
	theme           = "theme_5",
	name            = "txtEmailAlterTeacherInputScr",
	caption         = "Email Alternativo",
	notEmpty        = true,
	textColor       = {20,40,20},
	inputType       = "default", -- "number" | "password" | "default"
	quitCaption     = "Toque a tela para sair.",
--	onChange        = function(EventData) print(EventData.value) end,
--	onBlur          = function(EventData) print(EventData.value) end,
    } )
    
    _G.GUI.NewInput(
    {
	x               = "46%",
	y               = "26.5%",
	width           = "50%",
	theme           = "theme_5",
	name            = "txtFacebookTeacherInputScr",
	caption         = "Facebook",
	notEmpty        = true,
	textColor       = {20,40,20},
	inputType       = "default", -- "number" | "password" | "default"
	quitCaption     = "Toque a tela para sair.",
--	onChange        = function(EventData) print(EventData.value) end,
--	onBlur          = function(EventData) print(EventData.value) end,
    } )
        
    _G.GUI.NewInput(
    {
	x               = "46%",
	y               = "32%",
	width           = "40%",
	theme           = "theme_5",
	name            = "txtFoneTeacherInputScr",
	caption         = "Telefone",
	notEmpty        = true,
	textColor       = {20,40,20},
	inputType       = "default", -- "number" | "password" | "default"
        allowedChars    = "()1234567890",
	quitCaption     = "Toque a tela para sair.",
--	onChange        = function(EventData) print(EventData.value) end,
--	onBlur          = function(EventData) print(EventData.value) end,
    } )    
    
    _G.GUI.NewInput(
    {
	x               = "46%",
	y               = "37.5%",
	width           = "40%",
	theme           = "theme_5",
	name            = "txtFoneAlterTeacherInputScr",
	caption         = "Telefone Alternativo",
	notEmpty        = true,
	textColor       = {20,40,20},
	inputType       = "default", -- "number" | "password" | "default"
        allowedChars    = "()1234567890",
	quitCaption     = "Toque a tela para sair.",
--	onChange        = function(EventData) print(EventData.value) end,
--	onBlur          = function(EventData) print(EventData.value) end,
    } )
    
    _G.GUI.NewSquareButton(
    {
	x       = "88%",
	y       = "0%",
	name    = "btnOkTeacherInputScr",
	theme   = "theme_5",
	icon    = 15,
        
	onPress = function( EventData ) self.save() end,
	
    } )
        
    _G.GUI.NewSquareButton(
    {
	x       = "92%",
	y       = "0%",
	name    = "btnCancelTeacherInputScr",
	theme   = "theme_5",
	icon    = 16,
        
	onPress = function( EventData ) self.close() end,
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "5%",
        y           = "85%",
        name        = "lblAlertTeacherInputScr",
        theme       = "theme_5",
        width       = "100%",
        caption     = "",
        fontSize    = "22",
        textColor   = {255,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    
    teacherEditIndex = -1
    
    return self
end



