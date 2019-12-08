lavis=require 'lavis'
lavis.setWireframe(true)
--[[
	Note that for ImGUI you need to pass lavis.imgui.update, etc
	functions but since Lavis already does that in lavis.update,etc
	which note are overrided to love.update by default! So we don't
	have to don't anything here excepet calling lavis.drawImageButton!
]]--

function love.draw()
	love.graphics.setColor(1,1,1)
	--[[
		If you don't provide an id then id will default to 1!!
		You can give size to an image button
	]]--
	lavis.drawImageButton('button.png',50,50,406/2,160/2)
	lavis.drawImageButton(2,'button.png',500,500,406/2,160/2)
	love.graphics.setColor(.8,1,1)
	--[[
		If you don't give width and height then it'll default
		to image's original size! You can also give origin to
		an image button!
	]]--
	lavis.drawImageButton(3,'button.png',400,300,_,_,406/2,160/2)
end

--[[
	These are some callback functions! Lavis's ImGUI method is really
	unique when it comes to this (See how love.graphics.setColor will
	reflect in the color of the widget!!)
]]

local imgui=lavis.imgui

imgui.whileHovered=function(id,...)
	--can do some conditional logic like if id==1,etc!!
	love.graphics.setColor(.8,.8,.8)
end
imgui.whilePressed=function(id,...)
	--can do some conditional logic like if id==1,etc!!
	love.graphics.setColor(.4,.4,.4)
end
imgui.onMouseEnter=function(id,...)
	print('Mouse Entered a Widget whose id is '..id)
end
imgui.onMouseExit=function(id,...)
	print('Mouse Exited a Widget whose id is '..id)
end
imgui.onClick=function(id,...)
	print('Mouse Pressed on a Widget whose id is '..id)
end
imgui.onRelease=function(id,...)
	print('Mouse Released on a Widget whose id is '..id)
end