---------------------------------------------------------------------------------
--
-- SCENE1.LUA
--
---------------------------------------------------------------------------------
require( "schoolScreen" )
require( "studentScreen" )
require( "data" )
require( "util")
require( "studentMnu" )


local Storyboard = require( "storyboard" )
local Scene      = Storyboard.newScene()

local studentMnu
local studentScr


local schoolScr



function Scene:mnuHide()
    _G.GUI.Show("lblMenuTitle", false, animeTime )
    _G.GUI.Show("btnMenu1", false, animeTime )
    _G.GUI.Show("btnMenu2", false, animeTime )
    _G.GUI.Show("btnMenu3", false, animeTime )
    _G.GUI.Show("lblSchoolTitle", false, animeTime )
    --_G.GUI.Show("btnHome", false, animeTime )
end

function Scene:mnuShow()
    _G.GUI.Show("lblMenuTitle", true, animeTime )
    _G.GUI.Show("btnMenu1", true, animeTime )
    _G.GUI.Show("btnMenu2", true, animeTime )
    _G.GUI.Show("btnMenu3", true, animeTime )
    _G.GUI.Show("btnHome", true, animeTime )
    _G.GUI.Show("lblSchoolTitle", true, animeTime )
end

function Scene:ShowClassroomMnu()
    table.insert( lastMenu, "Main")
    activeMenu = "Classroom"
    Scene:mnuHide()
    studentMnu:ShowClassroomMnu()
    
end

function Scene:ShowStudentMnu()
    table.insert( lastMenu, "Main")
    activeMenu = "Student"
    Scene:mnuHide()
    studentMnu:ShowStudentMnu()
end

function Scene:ShowTeacherMnu()
    table.insert( lastMenu, "Main")
    activeMenu = "Teacher"
    Scene:mnuHide()
    studentMnu:ShowTeacherMnu()
end

function Scene:CreateMainMenu()
    
    
    
    
    _G.GUI.NewImage( display.newImage(getImage("imgBgBar.png")),
    {
                x               = "0%",
		y               = "0%",
		width           = "25%",
		height          = "5%",
		name            = "imgBgMenuTitle",
		border          = {"normal", 4, 1, 245, 255, 245, 50},
    } )
    
    _G.GUI.NewImage( display.newImage(getImage("imgBgMenu.jpg")),
    {
                x               = "0%",
		y               = "0%", -- 5.5
		width           = "25%",
		height          = "100%",
		name            = "imgBgMenu",
		border          = {"normal", 4, 1, 245, 255, 245, 50},
    } )
    
    
    
    _G.GUI.NewLabel(
    {
                x           = "0%",
                y           = "top",
                name        = "lblMenuTitle",
                theme       = "theme_5",
                width       = "255",
                caption     = "",
                fontSize    = "30",
                textColor   = {206,238,21},
                textAlign   = "center",
                group       = "Menu",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    
    
    
    
    _G.GUI.NewShapeButton(
    {
		x               = "0%",                
		y               = "32%", 
		width           = "26%",
		height          = "12%",
		border          = {"inset", 0, 1, 255, 255, 255, 200, 0, 0, 0, 255}, 
		pressColor      = {200,150,0,255},
		name            = "btnMenu1",  
                group           = "Menu",  
		caption         = "",
		textColor       = {50,50,50},
		textAlign       = "center",
		theme           = "theme_5",               
		icon            = 5,
                image           = getImage( "imageMenu1.jpg" ),      
		baseDir         = system.ResourceDirectory,
                
	--onPress         = function(EventData) print("Pressed - Button")  end,
	onRelease       = function(EventData) Scene:ShowClassroomMnu() end,
    } )

    
    _G.GUI.NewShapeButton(
    {
		x               = "0%",                
		y               = "43.5%", 
		width           = "26%",
		height          = "12%",
		border          = {"inset", 0, 1, 255, 255, 255, 200, 0, 0, 0, 255}, 
		pressColor      = {200,150,0,255},
		name            = "btnMenu2",  
                group           = "Menu",  
		caption         = "",
		textColor       = {50,50,50},
		textAlign       = "center",
		theme           = "theme_5",               
		icon            = 5,
                image           = getImage( "imageMenu2.jpg" ),      
		baseDir         = system.ResourceDirectory,
                
	--onPress         = function(EventData) print("Pressed - Button")  end,
	onRelease       = function(EventData) Scene:ShowTeacherMnu() end,
    } )
    
    
    
    _G.GUI.NewShapeButton(
    {
		x               = "0%",                
		y               = "55%", 
		width           = "26%",
		height          = "12%",
		border          = {"inset", 0, 1, 255, 255, 255, 200, 0, 0, 0, 255}, 
		pressColor      = {200,150,0,255},
		name            = "btnMenu3",  
                group           = "Menu",  
		caption         = "",
		textColor       = {50,50,50},
		textAlign       = "center",
		theme           = "theme_5",               
		icon            = 5,
                image           = getImage( "imageMenu3.jpg" ),      
		baseDir         = system.ResourceDirectory,
                
	--onPress         = function(EventData) print("Pressed - Button")  end,
	onRelease       = function(EventData) Scene:ShowStudentMnu() end,
    } )
    
    
    
    _G.GUI.NewText(
    {
    
            x           = "0",
            y           = "15%",
            name        = "lblSchoolTitle",
            theme       = "theme_5",
            width       = "25%",
            caption     = schoolData.name,
            fontSize    = "20",
            textColor   = {255,255,255},
            textAlign   = "center",
            --border          = { "normal", 1, 1, 100, 100, 100, 200 },
    } )
    
    
        

end

function Scene:CreateBottomBar()
    _G.GUI.NewImage( display.newImage(getImage("imgBgBar.png")),
    {
            x               = "0%",
            y               = "bottom",
            width           = "100%",
            height          = "5%",
            name            = "imgBgBottomBar",
            border          = {"insert", 4, 1, 245, 255, 245, 50},
    } )
    
    _G.GUI.NewLabel(
    {
            x           = "left",
            y           = "bottom",
            name        = "lblBottomBar",
            theme       = "theme_5",
            width       = "100%",
            height      = "5%",
            caption     = "Prof. Mario Henrique Pena",
            fontSize    = "12",
            textColor   = {0,0,0},
            textAlign   = "center",
            --border      = { "normal", 1, 0, 181, 181, 181, 100 },
    } )
end


function Scene:CreateTopBar( )
    --_G.GUI.NewImage( display.newImage(getImage("imgBgBar.png")),
    --{
    --        x               = "25%",
    --        y               = "0%",
    --        width           = "75%",
    --        height          = "5%",
    --        name            = "imgBgTopBar",
    --        border          = {"insert", 1, 0, 206,238,21, 255},
    --} )
    
    _G.GUI.NewSquareButton(
    {
		x       = "0%",
		y       = "95%",
		name    = "btnHome",
		theme   = "theme_5",
		icon    = 17,
	onPress = function( EventData ) Scene:ShowHome() end,
    } )
    
    _G.GUI.NewSquareButton(
    {
		x       = "5%",
		y       = "95%",
		name    = "btnAlert",
		theme   = "theme_5",
		icon    = 19,
	--onPress = function( EventData ) Scene:ShowHome() end,
    } )
    
    _G.GUI.NewLabel(
    {
        x           = "10%",
        y           = "95%",
        name        = "lblLogon",
        theme       = "theme_5",
        width       = "255",
        caption     = "Prof. Jose Henrique",
        fontSize    = "16",
        textColor   = {206,238,21},
        textAlign   = "left",
        group       = "Menu",
        --border      = { "normal", 1, 1, 181, 181, 181, 100 }
    } )
    
    _G.GUI.NewLabel(
    {
    
            x           = "center",
            y           = "top",
            name        = "lblTopTitle",
            theme       = "theme_5",
            width       = "70%",
            caption     = "",
            fontSize    = "20",
            textColor   = {0,0,0},
            textAlign   = "center",
           -- border          = { "normal", 1, 1, 100, 100, 100, 200 },
    } )
    
    
    

end

function Scene:ShowHome() 
	studentMnu:Hide()
        StudentScr:Hide()
        ClassroomScr:Hide()
        TeacherScr:Hide()
        Scene.mnuShow()
	schoolScr:Show()
end





----------------------------------------------------------------
-- CREATE THE SCENE (WHEN THE SCENE'S VIEW DOES NOT EXIST)
----------------------------------------------------------------
function Scene:createScene( event )
    local Screen = self.view
    
    
    
    
    --Scene:CreateBottomBar()
    Scene:CreateMainMenu()
    Scene:CreateTopBar()
    
    schoolScr = School.new( schoolData["Name"] )
    schoolScr:setAddress( schoolData["Address"])
    
    
    --studentScr = StudentScr.new()
    studentMnu = StudentMnu.new(Scene)
    
    
end


----------------------------------------------------------------
-- CALLED IMMEDIATELY AFTER SCENE HAS MOVED ONSCREEN:
----------------------------------------------------------------
function Scene:enterScene( event )

	print( "ENTERED SCENE 1" )
	
end


----------------------------------------------------------------
-- CALLED WHEN SCENE IS ABOUT TO MOVE OFFSCREEN:
----------------------------------------------------------------
function Scene:exitScene( event )
	print( "EXIT SCENE 1" )
end


----------------------------------------------------------------
-- CALLED PRIOR TO THE REMOVAL OF SCENE'S "VIEW" (DISPLAY GROUP)
----------------------------------------------------------------
function Scene:destroyScene( event )
	print( "DESTROYING SCENE 1" )
	
	-- REMOVE ALL WIDGETS HERE
        _G.GUI.RemoveAllWidgets()
	
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "CREATESCENE" EVENT IS DISPATCHED IF SCENE'S VIEW DOES NOT EXIST
Scene:addEventListener( "createScene", Scene )

-- "ENTERSCENE" EVENT IS DISPATCHED WHENEVER SCENE TRANSITION HAS FINISHED
Scene:addEventListener( "enterScene", Scene )

-- "EXITSCENE" EVENT IS DISPATCHED BEFORE NEXT SCENE'S TRANSITION BEGINS
Scene:addEventListener( "exitScene", Scene )

-- "DESTROYSCENE" EVENT IS DISPATCHED BEFORE VIEW IS UNLOADED, WHICH CAN BE
-- AUTOMATICALLY UNLOADED IN LOW MEMORY SITUATIONS, OR EXPLICITLY VIA A CALL TO
-- STORYBOARD.PURGESCENE() OR STORYBOARD.REMOVESCENE().
Scene:addEventListener( "destroyScene", Scene )

---------------------------------------------------------------------------------

return Scene