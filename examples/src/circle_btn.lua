function initCircleBtn()
	loveImg=love.graphics.newImage("assets/love-ball.png")
	local ball=lavis.imageButton(loveImg,500,200,"circle",30)

	-- you could also set image this way which is preferred if u wanna use it later
	ball:setImage(loveImg)  
	ball:setImageOrigin(32,32)

	-- ball.onEnter=function() ball:setImageSize(6,true) end -- or setImageSize(70,64)
	-- ball.onExit=function()  ball:setImageSize(64) end  -- or setImageSize(64,64)
	ball.whileHovered= function()
		ball:setSize(1,true)         --set size relatively
		if ball:getSize()==64 then
			ball:setFrozen(true)            --the widget would remain stationary
		end
	end
	ball.onMouseExit=function()
		ball:setFrozen(false)             --the widget can move freely
		ball:setSize(32)
		ball:setColor(1,1,1)        --in case user releases the LMB when the mouse is not over the widget
	end

	ball.onClick=function() ball:setColor(1,0,0) end
	ball.onRelease=function() ball:setColor(1,1,1) end

end

--[[
	Try this functions:-
	ball:disable(),ball:freeze(),ball:hide()
]]
