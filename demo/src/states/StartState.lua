StartState=State()
function StartState:enter(params)

	self.coolbtn=lavis.imageButton(gAssets['sexyButton'],400,300,'ellipse',100,32)
	self.coolbtn:setImageOrigin(209,70)
	self.coolbtn:setImageSize(209,70)
	self.coolbtn:setWireframe(WIREFRAME_MODE)
	
	self.coolbtn.onClick=function()
		gAssets['click']:play()
		Chain(
			flux.Tween(self.coolbtn,0.2,{sx=0.7,sy=0.7},'quadout'),
			flux.Tween(self.coolbtn,0.1,{sx=0.67,sy=0.67},'quadout'),
			flux.Tween(self.coolbtn,0.1,{sx=0.7,sy=0.7},'quadin')
		)()
	end
	self.coolbtn.onRelease=function()
			
		--if the user made a short click
		Timer.after(0.5,function()
		Chain(
			flux.Tween(self.coolbtn,0.2,{sx=0.48,sy=0.48},'quadout'),
			flux.Tween(self.coolbtn,0.1,{sx=0.52,sy=0.52},'quadin'),
			flux.Tween(self.coolbtn,0.2,{sx=0.5,sy=0.5},'quadout'),
			function()
				if self.coolbtn:isHovered() then
					gStateMachine:change('menu')			
				end
			end
			
		)()end)
	end
end

function StartState:update()
	self.coolbtn:updateSize()
end

function StartState:exit()
	Chain(
		flux.Tween(opacity,2,{value=1},'linear')
	)()
	self.coolbtn:destroy() --kinda mandatory
	Timer.clear() --optional but what's the harm
end
