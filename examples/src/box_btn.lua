function initBoxButton()

	local btn=lavis.imageButton("assets/gradient.png",400-32,300-32,"box",64,64)

	btn:setImageOrigin(32,32)                   -- set its origin

	btn.onEnter       = function() btn:setSize(180,90)   end
	btn.onExit        = function() btn:setSize(90,64)    end
	btn.whilePressed  = function() btn:setSize(1,1,true) end  -- increase size relatively
	btn.onRelease     = function() btn:setSize(64,64)    end
	
end


