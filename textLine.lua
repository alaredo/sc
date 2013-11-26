require ("data")
require ("util")

function TextLine(name, x, y, caption, widthPercNum, txtWidthPercNum)
    local self = {  }
    
    local lblName
    local txtName
    local inputName
    
    self.Value = ""
    
    function self.Show()
        _G.GUI.Show(lblName, true, 0 )
        _G.GUI.Show(txtName, true, 0 )
    end
    
    function self.Hide()
        _G.GUI.Show(lblName, false, 0 )
        _G.GUI.Show(txtName, false, 0 )
        _G.GUI.Show(inputName, false, 0 )
    end
    
    function self.Destroy()
        _G.GUI.GetHandle(lblName):destroy()
        _G.GUI.GetHandle(txtName):destroy()
        _G.GUI.GetHandle(inputName):destroy()
        
        
    end
    
    function self.CreateTxt()
        _G.GUI.NewLabel(
        {
            x           = addValScreen(x, 2 + widthPercNum ),
            y           = y,
            name        = txtName,
            theme       = "theme_5",
            width       = txtWidthPercNum .. "%",
            height      = "auto",
            caption     = self.Value,
            fontSize    = "18",
            textColor   = {0,0,0},
            textAlign   = "left",
            --border      = { "normal", 1, 1, 181, 181, 181, 100 }
        } )
    end
    
    function self.CreateInput()
        _G.GUI.NewInput(
        {
            x               = addValScreen(x, 2 + widthPercNum ),
            y               = y,
            width           = "50%",
            theme           = "theme_5",
            name            = inputName,
            caption         = self.Value,
            notEmpty        = true,
            textColor       = {20,40,20},
            inputType       = "default", -- "number" | "password" | "default"
            quitCaption     = "Toque a tela para sair.",
    	onChange        = function(EventData) self.Value = EventData.value end,
    --	onBlur          = function(EventData) print(EventData.value) end,
        } )
    end
    
    function self.Set(vr)
        self.Value = vr
        trace( vr )
        _G.GUI.GetHandle( txtName ):destroy()
        self.CreateTxt()
        
        
    end
    
    function self.Edit(value)
        _G.GUI.Show(txtName, false, 0 )
        _G.GUI.GetHandle(inputName):destroy()
        self.CreateInput()
        _G.GUI.Set( inputName, { caption = value })
        
    end
    
    lblName = "lbl" .. name
    txtName = "txt" .. name
    inputName = "input" .. name
    
    _G.GUI.NewLabel(
    {
        x           = x,
        y           = y,
        name        = lblName,
        theme       = "theme_5",
        width       = widthPercNum .. "%",
        height      = "auto",
        caption     = caption,
        fontSize    = "18",
        textColor   = {0,0,0},
        textAlign   = "right",
        --border      = {"inset",4,1, 245,255,245,50},
        border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    self.CreateTxt()
    self.CreateInput()
    
    
        
    _G.GUI.Show( inputName, false, 0)

    
    
    
    return self
end

