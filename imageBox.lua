
function ImageBox(name, x, y, width )
    local self = { }
    
    local imageName
    local fileName
    
    function self.show()
        _G.GUI.Show(imageName, true, 0 )
        
    end
    
    function self.hide()
        _G.GUI.Show(imageName, false, 0 )
    end

    function self.buttonRelease()
    
    end
     
    function self.destroy()
        _G.GUI.GetHandle(imageName):destroy()
    end
    
    function self.set( c )
               
    end
    
    
    ------------------------
    ------- > new 
    ------------------------
    _G.GUI.NewImage( display.newImage( fileName ),
    {
        x               = "30%",
        y               = "10%",
        width           = "20%",
        height          = "26%",
        name            = imageName,
        border      = { "shadow", 3, 8, 181, 10,     return self
end



