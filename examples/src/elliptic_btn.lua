function initEllipticButton()
	
	local ball=lavis.imageButton("assets/play.png",240,240,"ellipse",82,51)
	--please note that in the constructor change in widget size doesn't affect the image size
	--[this is because there is no background image set to it as of now. BTW this property
	-- is important since you may not want responsiveness in the first place]
	--hence the next step.
	
	ball:setSize(82,51)
	
	-- ball:setPosition(100,100)
	ball:setImageOrigin(102,64)
	
	ball.onMouseEnter        = function()  ball:setSize(102,64)  end
	ball.onMouseExit         = function()  ball:setSize(64,40)   end
	ball.onClick        = function()  ball:setSize(50,58) end
	ball.onRelease      = function()  ball:setSize(82,51)   end
end

--[[
	This is a note on responsiveness: See, it is assumed (by me) that the end-user
	will set the origin of the background image to center when you use ellipse.
	So for ellipse (and circle as well), the widget's position doesn't change with
	the change in size. That *only* happens in case of box. This is not the same
	as saying ellipse doesn't support responsiveness. It does - but not as much as
	box.
]]
