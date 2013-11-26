require ("data")
require ("util")
require ("textLine")
require ("studentInputScr")


function StudentInfo()
    local self = {}
    
    local nameStudent
    local txtEmail
    local txtEmailAlter
    local txtFacebook
    local txtFone
    local txtFoneAlter
    local txtDtNasc
    local txtSexo
    
    
    function self.CreateImage()

        local imageName
        if studentData[studentIndex].pictureName == "" then
            imageName = getImage("defaultStudent.jpeg")
        else
            imageName = getImage(studentData[studentIndex].pictureName)
        end
           
        _G.GUI.GetHandle("imgStudent"):destroy()
        _G.GUI.NewImage( display.newImage( imageName ),
        {
            x               = "70%",
            y               = "10%",
            width           = "20%",
            height          = "26%",
            name            = "imgStudent",
            border      = { "normal", 3, 8, 181, 10, 181, 100 },
        } )  
    end
    
    function self.Hide()
        _G.GUI.Show("imgBgStudent", false, animeTime )
        _G.GUI.Show("btnEditStudentInfoScr", false, animeTime)
        _G.GUI.Show("imgStudent", false, animeTime )
        _G.GUI.Show("lblNameStudent", false, animeTime )
        _G.GUI.Show("lblClassroomStudent", false, animeTime )

        txtEmail.Hide()
        txtEmailAlter.Hide()
        txtFacebook.Hide()
        txtFone.Hide()
        txtFoneAlter.Hide()

    end

    function self.Show()
        _G.GUI.Show("imgBgStudent", true, animeTime )
        _G.GUI.Show("btnEditStudentInfoScr", true, animeTime)
        _G.GUI.Show("imgStudent", true, animeTime )
        _G.GUI.Show("lblNameStudent", true, animeTime )
        _G.GUI.Show("lblClassroomStudent", true, animeTime )

        txtEmail.Show()
        txtEmailAlter.Show()
        txtFacebook.Show()
        txtFone.Show()
        txtFoneAlter.Show()

    end
    
    function self.EditStudent()
        local window = StudentInputScr()
        window.studentEditIndex = studentIndex
        window.edit(studentData[studentIndex].name, txtEmail.Value, txtEmailAlter.Value, txtFacebook.Value, txtFone.Value, txtFoneAlter.Value)
        
    end

    function self.ShowStudent()
        getStudentData(studentData[studentIndex].code)
    
        self.CreateImage()

        _G.GUI.GetHandle("lblNameStudent"):set("caption", studentData[studentIndex].name)
        _G.GUI.GetHandle("lblClassroomStudent"):set("caption", getName( classroomData, studentData[studentIndex].classroom))    
        
        txtEmail.Set(studentData[studentIndex].email)
        txtEmailAlter.Set(studentData[studentIndex].emailAlter)
        self.Show()
    end





    _G.GUI.NewImage( display.newImage(getImage("imgStudentInfoBg.png")),
    {
        x               = "25%",
        y               = "5%",
        width           = "75%",
        height          = "90%",
        name            = "imgBgStudent",
        border          = {"normal", 4, 1, 245, 255, 245, 50},
    } )
    
    _G.GUI.NewSquareButton(
    {
	x       = "92%",
	y       = "0%",
	name    = "btnEditStudentInfoScr",
	theme   = "theme_5",
	icon    = 28,
	onPress = function( EventData ) self.EditStudent() end,
    } )
        
    _G.GUI.NewImage( display.newImage(getImage( "logoSchool.png" ) ),
    {
        x               = "70%",
        y               = "10%",
        width           = "20%",
        height          = "26%",
        name            = "imgStudent",
        --border          = {"normal", 4, 1, 255, 255, 255, 50},
    } )    

    
    _G.GUI.NewLabel(
    {
        x           = "30%",
        y           = "10%",
        name        = "lblNameStudent",
        theme       = "theme_5",
        width       = "60%",
        caption     = "",
        fontSize    = "22",
        textColor   = {255,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "30%",
        y           = "15%",
        name        = "lblClassroomStudent",
        theme       = "theme_5",
        width       = "60%",
        caption     = "",
        fontSize    = "22",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    
    txtEmail        = TextLine("email",         "30%", "43%", "Email ", 15, 30 )
    txtEmailAlter   = TextLine("emailAlter",    "30%", "48.5%", "Email Alternativo ", 15, 30 )
    txtFacebook     = TextLine("facebook",      "30%", "54%", "Facebook ", 15, 30 )
    txtFone         = TextLine("fone",          "30%", "59.5%", "Telefone ", 15, 30 )
    txtFoneAlter    = TextLine("foneAlter",     "30%", "65%", "Telefone Alternativo ", 15, 30 )
    --txtDtNasc       
    --txtSexo
    
    
    self.Hide()
    
    return self
end




