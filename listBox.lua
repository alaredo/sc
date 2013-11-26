require ("data")
require ("util")

function ListBox(Name, X, Y, Width, Height, TableData, Descr )
    local self = { }
    
    local widget = require( "widget" )
    local tableView
    local list
    
    function self.onRowRender(event)
        local phase = event.phase
	local row = event.row
        
        local rowTitle = display.newText( row, "List item " .. row.index, 0, 0, native.systemFontBold, 16 )
	rowTitle.x = row.x - ( row.contentWidth * 0.5 ) + ( rowTitle.contentWidth * 0.5 ) + 5
	rowTitle.y = row.contentHeight * 0.5
        
    end
    
    function self.onRowTouch(event)
        local phase = event.phase
	local row = event.row
        
    end
    
    tableView = widget.newTableView
    {
        left = X,
	top = Y,
	width = Width, 
	height = Height,
	maskFile = "mask-320x448.png",
	onRowRender = self.onRowRender,
	onRowTouch = self.onRowTouch,
    }
    
    for i=1,#TableData do
        tableView:insertRow{
            height = 72,
        }
    end
    
    
    
end

