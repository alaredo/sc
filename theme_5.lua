
----------------------------------------------------------------
-- WIDGET THEME DESCRIPTION FILE
----------------------------------------------------------------
-- EACH THEME MUST PROVIDE:
-- 1. A .LUA FILE LIKE THIS ONE WITH A UNIQUE NAME (FOR EXAMPLE "theme1.lua") WHICH IS PLACED IN YOUR PROJECT'S ROOT (WHERE THE "main.lua" IS).
-- 2. IMAGE & SOUND FILES THAT BELONG TO THIS THEME. PLACE THEM IN A SEPERATE FOLDER.
-- 3. ADJUST THE GRAPHICS, SOUNDS AND THE SETTINGS BELOW TO CREATE YOUR OWN THEMES.
----------------------------------------------------------------


-- THIS THEME'S SETTINGS
local Theme =
	{
	--------------------------------------------------------
	-- WINDOW SETTINGS 
	--------------------------------------------------------
	WindowCaptionFont          = "Myriad Pro",   -- TO USE CUSTOM FONTS, MAKE SURE THAT 1. IT IS INSTALLED PROPERLY ON YOUR MAC OR PC, 2. PLACE COPY OF THE .TTF FILE IN YOUR PROJECTS ROOT FOLDER, 3. DECLARE THE FONT IN YOUR "build.settings" FILE PROPERLY. 
	WindowFontSize             = 18,            -- FONT SIZE OF WINDOW'S TITLE CAPTION
	WindowCaptionOffsetY       = -2,		    -- OFFSET FROM WINDOW'S TOP BORDER TO THE CENTER OF THE CAPTION TEXT, ALSO AFFECTS ICON POSITION.
	WindowIconOffsetX          = 6,             -- LEFT MARGIN OF WINDOW'S TITLE ICON
	WindowFrameAlpha           = 1.0,           -- WINDOW FRAME TRANSPARENCY (0.0-1.0)
	WindowShadowAlpha          = 0.32,			-- WINDOW SHADOW ALPHA (0.0-1.0)
	WindowShadowOffset         = 10,		    -- WINDOW SHADOW X- AND Y-OFFSET IN PIXELS
	WindowShadowCornerSize     = 8,				-- USE 0 FOR SHARP CORNERS OR ANY OTHER VALUE FOR ROUNDED CORNERS
	WindowGradientMargin       = 4,				-- SPACING BETWEEN THE WINDOW'S OUTER BORDER AND THE INNER COLOR GRADIENT RECTANGLE, IF APPLIED. USEFUL WHEN YOUR WINDOW GRAPHICS CONTAIN ROUNDED CORNERS AND YOU WANT TO AVOID THE CORNERS OF THE GRADIENT TO OVERLAP THE WINDOW'S CORNERS. 
	WindowIconSize             = 32,			-- WINDOW TITLE BAR ICON SIZE IN PIXELS

	--------------------------------------------------------
	-- WIDGET SETTINGS 
	--------------------------------------------------------
	WidgetFont                 = "Myriad Pro",   -- TO USE CUSTOM FONTS, MAKE SURE THAT 1. IT IS INSTALLED PROPERLY ON YOUR MAC OR PC, 2. PLACE COPY OF THE .TTF FILE IN YOUR PROJECTS ROOT FOLDER, 3. DECLARE THE FONT IN YOUR "build.settings" FILE PROPERLY. 
	WidgetFontSize             = 16,
	WidgetDisabledAlpha        = .5,			-- ALPHA VALUE (0.0 - 1.0) TO DISPLAY DISABLED WIDGETS.
	ButtonIconSize             = 26,			-- SIZE OF A BUTTON'S ICON IN PIXELS
	MarginX                    = 4,             -- SPACING BETWEEN WIDGET LEFT/RIGHT BORDER AND ICON OR TEXT. 
	InputMarginX               = 12,            -- SPACING BETWEEN AN INPUT TEXT FIELD'S LEFT BORDER AND TEXT
	ListIconSize               = 28,            -- SIZE OF A LIST ITEM'S ICON
	WidgetTextYOffset          = 0,             -- Y-OFFSET OF A WIDGET'S TEXT (BUTTONS, CHECKBOXES, RADIO BUTTONS, TEXT LABELS, PROGRESS BAR, LIST TITLE) 
	TooltipTextYOffset         = 0,             -- ADJUST THIS IF TOOLTIP BUBBLE TEXT (SEE SLIDER WIDGET, FOR EXAMPLE) IS NOT CENTERED WITHIN TOOLTIP BUBBLE
	SliderTicksCenterOffset    = 10,            -- SLIDER TICK LINES OFFSET
	TextFieldCursor            = "_",
	
	--------------------------------------------------------
	-- COLORS USED IN THIS THEME (R,G,B,ALPHA)
	--------------------------------------------------------
	SwitchOnColor              = {142,162,188}, -- OPTIONAL COLOR OF ON/OFF SWITCHES WHEN SWITCH IS "ON"
	WindowCaptionColor1        = {20,20,20},    -- WINDOW TITLE CAPTION TEXT COLOR
	WindowCaptionColor2        = {250,250,250}, -- WINDOW TITLE CAPTION SHADOW COLOR
	WidgetTextColor            = {50,50,55},    -- THE DEFAULT TEXT COLOR OF ALL WIDGETS
	ButtonTextColor            = {240,240,240}, -- COLOR OF BUTTON TEXT CAPTIONS
	EmbossColorHigh            = {200,200,200}, -- USED FOR EMBOSSED THINGS LIKE BORDERS, LABEL ETC.
	EmbossColorLow             = {0,0,0},       -- USED FOR EMBOSSED THINGS LIKE BORDERS, LABEL ETC.
	BubbleTextColor            = {40,50,40},    -- COLOR OF A WIDGET'S BUBBLE TEXT (SLIDERS, DRAG BUTTON ETC., WHILE BEING DRAGGED)
	SliderTickStrokeColor      = {100,100,100}, -- SLIDER TICKS OUTLINE COLOR
	SliderTickFillColor        = {150,150,150}, -- SLIDER TICKS FILL COLOR
	ListItemTextColor          = {50,50,50},    -- DEFAULT LIST ITEM TEXT COLOR (YOU CAN ALSO SET INDIVIDUAL LIST ITEM COLORS)
	ListItemSelectedGradient   = graphics.newGradient({206,238,21,255},{206,238,21,32}, "top" ),   -- SELECTED LIST ITEM BACKGROUND COLOR GRADIENT
	InputTextColor             = {50,50,50},    -- INPUT TEXT COLOR

	--------------------------------------------------------
	-- SOUND LIST. YOU CAN ADD AS MANY AS YOU WANT. 
	-- ALL OF THESE SOUNDS ARE LOADED INTO MEMORY WHEN 
	-- ADDING A NEW THEME, SO TRY TO KEEP THEM SMALL.
	-- SOUND FILES SHOULD BE PLACED IN A THEME'S FOLDER.
	--------------------------------------------------------
	SoundFiles = 
		{
		"snd_button.mp3",	    -- SOUND ID: 1
		"snd_release.mp3",	    -- SOUND ID: 2
		"snd_slidertick.mp3",	-- SOUND ID: 3
		"snd_type.mp3",	        -- SOUND ID: 4
		"snd_switch.mp3",	    -- SOUND ID: 5 (AND SO ON...)
		},

	--------------------------------------------------------
	-- IMAGES & SPRITE SHEETS USED
	--------------------------------------------------------
	maskImage                    = "gfx_mask.png",     -- SOME WIDGETS REQUIRE THIS MASK IMAGE TO WORK PROPERLY. YOU SHOULD NOT CHANGE THIS UNLESS YOU NEED TO.
	maskImageSize                = 256,

	iconGraphics                 = "gfx_icons.png",
	iconSheetSize                = 256,                -- SIZE OF THE ICON SHEET THAT CONTAINS THE ICON GRAPHICS (SHOULD BE SQUARE SIZED AND A POWER OF 2, F.E. 512x512 PIXELS)
	iconFrameSize                = 32,                 -- SIZE OF A FRAME ON THE SPRITE SHEET (SQUARE SHAPED)
	Icon_List_Delete             = 1,
	Icon_List_Move               = 2,
	Icon_List_Close              = 3,

	widgetGraphics               = "gfx_widgets.png",  -- IMAGE THAT CONTAINS ALL WIDGET GRAPHICS
	widgetSheetSize              = 512,                -- SIZE OF THE IMAGE SHEET THAT CONTAINS THE WIDGET GRAPHICS (SHOULD BE SQUARE SIZED AND A POWER OF 2, F.E. 512x512 PIXELS)
	widgetFrameSize              = 40,                 -- SIZE OF A FRAME ON THE SPRITE SHEET (SQUARE SHAPED)
	
	Frame_Win_TL                 = 1,                  -- FRAME NUMBER ON THE SPRITE SHEET -PLEASE DO NOT CHANGE THIS UNLESS YOU HAVE A GOOD REASON TO DO SO.
	Frame_Win_T                  = 2,
	Frame_Win_TR                 = 3,
	Frame_Win_L                  = 13,
	Frame_Win_BG                 = 14,
	Frame_Win_R                  = 15,
	Frame_Win_BL                 = 25,
	Frame_Win_B                  = 26,
	Frame_Win_BR                 = 27,
	Frame_Win_ResizeButton       = 69,
	Frame_Win_CloseButton        = 67,
	Frame_Win_CloseButtonDown    = 68,
	Frame_Container_TL           = 4,
	Frame_Container_T            = 5,
	Frame_Container_TR           = 6,
	Frame_Container_L            = 16,
	Frame_Container_M            = 17,
	Frame_Container_R            = 18,
	Frame_Container_BL           = 28,
	Frame_Container_B            = 29,
	Frame_Container_BR           = 30,
	Frame_Container_Collapsed_TL = 7,
	Frame_Container_Collapsed_T  = 8,
	Frame_Container_Collapsed_TR = 9,
	Frame_Button_L               = 10,
	Frame_Button_M               = 11,
	Frame_Button_R               = 12,
	Frame_ButtonDown_L           = 22,
	Frame_ButtonDown_M           = 23,
	Frame_ButtonDown_R           = 24,
	Frame_ButtonToggled_L        = 34,
	Frame_ButtonToggled_M        = 35,
	Frame_ButtonToggled_R        = 36,
	Frame_SquareButton           = 19,
	Frame_SquareButtonDown       = 20,
	Frame_DragButton             = 53,
	Frame_DragButtonDown         = 54,
	Frame_SquareButtonToggled    = 21,
	Frame_CheckBox               = 31,
	Frame_CheckBoxChecked        = 32,
	Frame_RadioButton            = 43,
	Frame_RadioButtonChecked     = 44,
	Frame_Input_L                = 40,
	Frame_Input_M                = 41,
	Frame_Input_R                = 42,
	Frame_Input_Button           = 66,
	Frame_Slider_L               = 46,
	Frame_Slider_M               = 47,
	Frame_Slider_R               = 48,
	Frame_Slider_Button          = 45,
	Frame_Tooltip_L              = 58,
	Frame_Tooltip_M              = 59,
	Frame_Tooltip_R              = 60,
	Frame_Switch_L               = 55,
	Frame_Switch_R               = 56,
	Frame_Switch_Button          = 57,
	Frame_List_TL                = 37,
	Frame_List_T                 = 38,
	Frame_List_TR                = 39,
	Frame_List_L                 = 49,
	Frame_List_M                 = 50,
	Frame_List_ItemBG            = 89,
	Frame_List_R                 = 51,
	Frame_List_BL                = 61,
	Frame_List_B                 = 62,
	Frame_List_BR                = 63,
	Frame_List_BL2               = 73,
	Frame_List_B2                = 74,
	Frame_List_BR2               = 75,
	Frame_List_BL3               = 85,
	Frame_List_B3                = 86,
	Frame_List_BR3               = 87,
	Frame_List_BackButton        = 64,
	Frame_List_BackButtonDown    = 65,
	Frame_Progress_L             = 70,
	Frame_Progress_M             = 71,
	Frame_Progress_R             = 72,
	Frame_ProgressBar_L          = 82,
	Frame_ProgressBar_M          = 83,
	Frame_ProgressBar_R          = 84,
	}

return Theme
