require ("data")
require ("util")

function ComboBox(name, x, y, yGrid, width, tableName, descr, parentWindow)
    local self = {code, name }
    
    local backModal
    local gridName
    local lblName
    local backName
    local lblGridDescr
    local gridVisible = false
    local comboList = {}
    local comboTable = {}
    local indexSelected = 0
    
    function self.showBorder()
        _G.GUI.Set( lblName, { border  = {"outside",5,1, 245,0,0,50} } )
    end
    
    function self.hideBorder()
        _G.GUI.Set( lblName, { border  = {"outside",5,1, 20,20,0,100,  185,185,185,150} } )
    end
    
    function self.readGrid(tableName)
        comboTable = tableName        
        comboList = {}
        --table.insert(comboList, 1, { height = "auto", caption = "", textColor = {0,0,0}, deletable = false, selectable = true, code = 0 })
        for i=1,#comboTable do
            table.insert(comboList, i, { height = "auto", caption = comboTable[i].name, textColor = tColor, deletable = false, selectable = true, code = comboTable[i].code })
        end
    end
    
    function self.show()
        _G.GUI.Show(backName, true, 0 )
        _G.GUI.Show(gridName, true, 0 )
        _G.GUI.Show(lblName, true, 0 )
    end
    
    function self.hide()
        _G.GUI.Show(backName, false, 0 )
        _G.GUI.Show(gridName, false, 0 )
        _G.GUI.Show(lblName, false, 0 )
    end

    function self.buttonRelease()
        if ( gridVisible ) then
            _G.GUI.GetHandle(backName):destroy()
            _G.GUI.GetHandle( gridName ):destroy()

            gridVisible = false
        else
            backModal = display.newRect( 1, 1, display.contentWidth, display.contentHeight)
            backModal:setFillColor( 185, 231, 40, 1 )
            backModal.isHitTestable = true
            backModal:addEventListener( "touch", function( EventData ) return true end )
            backModal:addEventListener( "tap", function( EventData ) return true end )
            
            _G.GUI.Show(backName, true, 0 )
            self.createGrid()
            --_G.GUI.Show(gridName, true, 500 )
            gridVisible = true
        end
    end

    function self.selected(c)
        for i=1,#comboTable do
            if comboTable[i].code == c then 
                indexSelected = i
                self.code = c
                self.name = comboTable[i].name
                self.hideBorder()
                break
            end
        end
        _G.GUI.GetHandle(lblName):set("caption", comboTable[indexSelected].name)
        
        self.cancel()
    end
    
    function self.destroy()
        _G.GUI.GetHandle(lblName):destroy()
        --_G.GUI.GetHandle(backName):destroy()
       -- _G.GUI.GetHandle(gridName):destroy()
    end
    
    function self.set( c )
       
        for i=1,#comboTable do
            if comboTable[i].code == c then 
                _G.GUI.Set(lblName, { caption = comboTable[i].name } )
                self.code = c
                self.name = comboTable[i].name
            end
        end
        
    end
    
    function self.cancel()
        _G.GUI.GetHandle(backName):destroy()
        _G.GUI.GetHandle( gridName ):destroy()
        _G.GUI.GetHandle( name .. "GridLbl"):destroy()
        _G.GUI.GetHandle( name .. "BtnCancel"):destroy()
        backModal:removeSelf()
        
        gridVisible = false
    end
    
    function self.createGrid()
        
        local yPos = addValScreen( y, 5 )
        _G.GUI.NewImage( display.newImage(getImage("popoverBack.png")),
        {
            x               = x,
            y               = yPos,
            width           = width,
            height          = "25%",
            theme           = "theme_5",
            name            = backName,
          --  border          = {"normal", 4, 1, 245, 255, 245, 50},
        } )
        
        _G.GUI.NewLabel({
            x           = x,
            y           = addValScreen( yPos, 2.5 ),
            name        = name .. "GridLbl",
            theme       = "theme_5",
            width       = width,
            caption     = lblGridDescr,
            fontSize    = "16",
            textColor   = {0,0,0},
            textAlign   = "left",
        })
        
        
        local gridPos = addValScreen( yGrid, 8 )
        _G.GUI.NewList(
        {
               x             = addValScreen(x, 2),  
               y             = gridPos,
               zindex        = 0,
               name          = gridName,
               theme         = "theme_5",
               width         = addValScreen(width, -4),
               height        = "auto",
               list          = comboList,
               allowDelete   = false,
               readyCaption  = "Editing",
               scrollbar     = "always",
               --border        = { "normal", 1, 1, 181, 181, 181, 0 },
            --   parentGroup   = parentWindow,
            
           onSelect = function(EventData) self.selected(EventData.Item.code) end
        } ) 
        
        _G.GUI.NewSquareButton(
        {
            x       = addValScreen( x, 44),
            y       = addValScreen(gridPos, -5),
            name    = name .. "BtnCancel",
            theme   = "theme_5",
            caption = "Cancelar",
            icon    = 16,
            onPress = function( EventData ) self.cancel() end,
        } )
    end
    
    ------------------------
    ------- > new 
    ------------------------
    
    _G.GUI.NewShapeButton(
    {
        x               = x,
        y               = y,
        zindex          = 0,
        width           = width,
        theme           = "theme_5",
        name            = name,
        caption         = descr,
        icon            = 30,
        textAlign       = "left",
        textColor       = {20,40,20},
        border          =  {"outside",1,1, 20,20,0,100,  185,185,185,150},
 --       parentGroup     = parentWindow,

        onRelease      = function(EventData) self.buttonRelease() end,
    } )
    
    gridName = name .. "Grid"
    lblName = name
    backName = name .. "Back"
    lblGridDescr = descr
    self.readGrid(tableName)

    
    return self
end

