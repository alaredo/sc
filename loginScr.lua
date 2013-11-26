require ("data")
require ("util")

loginError, loginOk = 0, 1

function LoginScr()
    local self = {}
    
    
    self.uow = nil
    
    function self.getData()
        local result = {}
        

        --Procedimento para obter o token

        
    
    end
    
    
    function self.login(email, passwd)
        local uow = require("dao.unitOfWork")
        local site = "Login/Login?email=" .. email .. "&senha=" .. passwd

        uow.tryLogin("http://aeservices.azurewebsites.net/", site, "Login/Logout")
	if tryLogin == loginError then
            --Processo em caso de falha de login
            _G.GUI.Set("lblAlertLoginScr", {caption = 'Nao foi possível efetuar o login'})
            trace('erro ao efetuar login')
        else
            --Processo em caso de login ok
            local storyboard = require "storyboard"
            storyboard.gotoScene( "scene1", "fade", 400 )
            trace('login efetuado com sucesso')
            self.uow = uow
                        
            login = email
            password = passwd
            
            getToken()

            
            --self.getData()
            self.close()
        end

    end
    
    function self.ok()
        local emailLogin = _G.GUI.Get("txtEmailLoginScr", "caption")
        local passwdLogin =  _G.GUI.Get("txtPasswordLoginScr", "caption")
        self.login( emailLogin, passwdLogin )
    end
    
    function self.close()
        _G.GUI.GetHandle("loginScr"):destroy()
    end
    
    
    
    
    _G.GUI.NewWindow(
    {
	x           = "center",
	y           = "center",
        width       = "60%",
        height      = "50%",
        name        = "loginScr",
	theme       = "theme_5",
        shadow      = true,
        closeButton = false,
        slideOut    = 0.9,
        modal       = true, 
        caption     = "     Login"
    } )
    
    
    
    _G.GUI.NewInput(
    {
	x               = "center",
	y               = "5%",
	width           = "90%",
	theme           = "theme_5",
	name            = "txtEmailLoginScr",
	caption         = "laredo@estatec.com.br",
	notEmpty        = true,
	textColor       = {20,40,20},
	inputType       = "default", -- "number" | "password" | "default"
	quitCaption     = "Toque a tela para sair.",
        parentGroup     = "loginScr",
--	onChange        = function(EventData) print(EventData.value) end,
--	onBlur          = function(EventData) print(EventData.value) end,
    } )
    
    _G.GUI.NewInput(
    {
	x               = "center",
	y               = "20%",
	width           = "90%",
	theme           = "theme_5",
	name            = "txtPasswordLoginScr",
	caption         = "",
	notEmpty        = true,
	textColor       = {20,40,20},
	inputType       = "password", -- "number" | "password" | "default"
	quitCaption     = "Toque a tela para sair.",
        parentGroup     = "loginScr",
--	onChange        = function(EventData) print(EventData.value) end,
--	onBlur          = function(EventData) print(EventData.value) end,
    } )
    
        
    _G.GUI.NewSquareButton(
    {
	x       = "80%",
	y       = "85%",
	name    = "btnOkLoginScr",
	theme   = "theme_5",
	icon    = 7,
        parentGroup     = "loginScr",
	onPress = function( EventData ) self.ok() end,
	
    } )
        
    _G.GUI.NewSquareButton(
    {
	x       = "90%",
	y       = "85%",
	name    = "btnCancelLoginScr",
	theme   = "theme_5",
	icon    = 3,
        parentGroup     = "loginScr",
	onPress = function( EventData ) self.close() end,
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "5%",
        y           = "85%",
        name        = "lblAlertLoginScr",
        parentGroup = "loginScr",
        theme       = "theme_5",
        width       = "100%",
        caption     = "",
        fontSize    = "22",
        textColor   = {255,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    
    
    return self
end





