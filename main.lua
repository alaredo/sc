require( "loginScr" )

display.setStatusBar( display.HiddenStatusBar )	

-- THIS IS TO FIND OUT IF THE APP RUNS ON A TABLET OR A SMALL DISPLAY
-- IF WE HAVE A TABLET, SCALE DOWN THE GUI TO THE HALF, OTHERWISE THE
-- WIDGETS APPEAR TOO BIG. YOU CAN USE ANY SCALE, BUT .5 IS FINE HERE.
-- CHANGING THE SCALE OF A WIDGET DOES NOT CHANGE ITS WIDTH OR HEIGHT,
-- IT JUST SCALES THE WIDGET GRAPHICS USED (BORDERS, ICONS, TEXT ETC.)

local physicalW = math.round( (display.contentWidth  - display.screenOriginX*2) / display.contentScaleX)
local physicalH = math.round( (display.contentHeight - display.screenOriginY*2) / display.contentScaleY)
_G.isTablet     = true; if physicalW >= 1024 or physicalH >= 1024 then isTablet = true end
_G.GUIScale     = _G.isTablet == true and .5 or 1.0
-- REQUIRE WIDGET CANDY
_G.GUI = require("widget_candy")              -- LOAD WIDGET CANDY, USING A GLOBAL VAR, SO WE CAN ACCESS IT FROM ANY LOADED SAMPLE CODE, TOO
-- LOAD A THEME
_G.GUI.LoadTheme("theme_5", "themes/theme_5/")-- LOAD THEME 5    
    
    
local storyboard = require "storyboard"
storyboard.gotoScene( "scene1", "fade", 400 )
   

LoginScr()