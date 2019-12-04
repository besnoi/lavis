lavis=require 'lavis'
lavis.override()
lavis.button=lavis.imageButton
require 'src'

function love.load()
	initBoxButton()
	initCircleBtn()
	initEllipticButton()
	lavis.setWireframe(true)   -- for debugging
end

function love.update(dt)
	lavis.update(dt)	
end

function love.draw()
	love.graphics.print(
		"Try pressing a button for some time\n"..
		"Note: WireFrame mode is on!!"
	)
	lavis.draw()
	love.graphics.draw(loveImg,200,400)
	love.graphics.print("This is just an image",170,469)
end

--[[
	Try this functions:-
	lavis.disableAll(), lavis.hideAll(), lavis.freezeAll()
]]
