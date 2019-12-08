lavis=require 'lavis'
-- lavis.setWireframe(true)

--You could also use CURRENT_BUTTON_IMAGE but it doesn't matter!
CURRENT_BUTTON_STATE='normal'
local imgui=lavis.imgui

--You don't need to enter this yet I'm showing you!
--By default imgui is processed automatically when lavis is processed
--Meaning lavis.update will call imgui.update!!
function love.update(dt) imgui.update(dt) end
function love.mousepressed(...) imgui.mousepressed(...) end
function love.mousereleased(...) imgui.mousereleased(...) end

function love.draw()
	lavis.drawImageButton(
		CURRENT_BUTTON_STATE..'.png',400,300,WIDTH,HEIGHT,427/2,190/2
	)
end

imgui.onMouseEnter=function(id,...) CURRENT_BUTTON_STATE='hover' end
imgui.onMouseExit=function(id,...) CURRENT_BUTTON_STATE='normal' end
imgui.onClick=function(id,...)
	CURRENT_BUTTON_STATE='pressed'
	WIDTH,HEIGHT=511,228
end
imgui.onRelease=function(id,...)
	CURRENT_BUTTON_STATE='normal'
	WIDTH,HEIGHT=nil  --will default the button size to image size!
end