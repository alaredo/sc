require ("data")
require ("util")
require ("textLine")

function StudentMedic()
    local self = {}
   
    local txtGroupSanguine
    local txtAllergicDisease
    local txtMedication
    local txtDoctorName
    local txtDoctorFone
    local txtDoctorFoneAlter
    local txtDoctorEmail
    local txtHospital
    local txtMedicCare
 
 
    function self.Hide()
        _G.GUI.Show("imgBgStudentMedic", false, animeTime )
        _G.GUI.Show("btnEditStudentMedicScr", false, animeTime)
        _G.GUI.Show("lblNameStudentMedicScr", false, animeTime)
        _G.GUI.Show("lblClassroomStudentMedicScr", false, animeTime)
       
        txtGroupSanguine.Hide()
        txtAllergicDisease.Hide()
        txtMedication.Hide()
        txtDoctorName.Hide()
        txtDoctorFone.Hide()
        txtDoctorFoneAlter.Hide()
        txtDoctorEmail.Hide()
        txtHospital.Hide()
        txtMedicCare.Hide()
        
        _G.GUI.Show("txtBoxAllergicDisease", false, animeTime)
        _G.GUI.Show("txtBoxMedication", false, animeTime)
    end


    function self.Show()
        
        _G.GUI.GetHandle("lblNameStudentMedicScr"):set("caption", studentData[studentIndex].name)
        _G.GUI.GetHandle("lblClassroomStudentMedicScr"):set("caption", getName( classroomData, studentData[studentIndex].classroom))    

        _G.GUI.Show("imgBgStudentMedic", true, animeTime )
        _G.GUI.Show("btnEditStudentMedicScr", true, animeTime)
        _G.GUI.Show("lblNameStudentMedicScr", true, animeTime)
        _G.GUI.Show("lblClassroomStudentMedicScr", true, animeTime)
       
        txtGroupSanguine.Show()
        txtAllergicDisease.Show()
        txtMedication.Show()
        txtDoctorName.Show()
        txtDoctorFone.Show()
        txtDoctorFoneAlter.Show()
        txtDoctorEmail.Show()
        txtHospital.Show()
        txtMedicCare.Show()
        
        _G.GUI.Show("txtBoxAllergicDisease", true, animeTime)
        _G.GUI.Show("txtBoxMedication", true, animeTime)
    end
    
    
    function self.Edit()
        
        
    end


    function self.ShowStudent()
    
    
    
    end

    function self.EditMedic()
        
    end
    

    _G.GUI.NewImage( display.newImage(getImage("imgStudentMedicBg.png")),
    {
        x               = "25%",
        y               = "5%",
        width           = "75%",
        height          = "90%",
        name            = "imgBgStudentMedic",
        border          = {"normal", 4, 1, 245, 255, 245, 50},
    } )
    
    _G.GUI.NewSquareButton(
    {
	x       = "92%",
	y       = "0%",
	name    = "btnEditStudentMedicScr",
	theme   = "theme_5",
	icon    = 28,
	onPress = function( EventData ) self.EditMedic() end,
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "30%",
        y           = "10%",
        name        = "lblNameStudentMedicScr",
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
        name        = "lblClassroomStudentMedicScr",
        theme       = "theme_5",
        width       = "60%",
        caption     = "",
        fontSize    = "22",
        textColor   = {0,0,0},
        textAlign   = "left",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
        
    txtGroupSanguine    = TextLine("GroupSanguine",     "30%", "20%", "Grupo Sanguineo", 15, 30 )
    txtAllergicDisease  = TextLine("AllergicDisease",   "30%", "25.5%", "Alergias", 15, 30 )
    txtMedication       = TextLine("Medication",        "30%", "41%", "Medicamentos", 15, 30 )
    txtDoctorName       = TextLine("DoctorName",        "30%", "56.5%", "Nome do Pediatra", 15, 30 )
    txtDoctorFone       = TextLine("DoctorFone",        "30%", "62%", "Telefone do Pediatra", 15, 30 )
    txtDoctorFoneAlter  = TextLine("DoctorFoneAlter",   "30%", "67.5%", "Celular do Pediatra ", 15, 30 )       
    txtDoctorEmail      = TextLine("DoctorEmail",       "30%", "73%", "Email do Pediatra ", 15, 30 )
    txtHospital         = TextLine("Hospital",          "30%", "78.5%", "Hospital ", 15, 30 )
    txtMedicCare        = TextLine("MedicCare",         "30%", "84%", "Plano de Saude ", 15, 30 )
    
    
    
    _G.GUI.NewText(
    {
	x           = "46%",
	y           = "25.5%",
	name        = "txtBoxAllergicDisease",
	theme       = "theme_5",
	width       = "50%",
	height      = "16%",
	caption     = "Here goes some text...|linha2|linha3|linha4|linha5|linha6|linha7|linha8|linha9",
	textAlign   = "left",
        border  = {"outside",5,1, 5,0,0,50} ,
    } )
    
    _G.GUI.NewText(
    {
	x           = "46%",
	y           = "41%",
	name        = "txtBoxMedication",
	theme       = "theme_5",
	width       = "50%",
	height      = "16%",
	caption     = "Here goes some text...|linha2|linha3|linha4|linha5|linha6|linha7|linha8|linha9",
	textAlign   = "left",
        border  = {"outside",5,1, 5,0,0,50} ,
    } )
    
    
    self.Hide()
    
    return self
end






