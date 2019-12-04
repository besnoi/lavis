MainMenuState=State()
function MainMenuState:enter()
	self.btns={}	
	
	for i=1,3 do
		self.btns[i]=lavis.imageButton(gAssets['unHovered'],246,150+(i-1)*120)
		self.btns[i]:setImageOrigin(153,74)		
		self.btns[i]:setSize(300,100)
		self.btns[i]:setHotButton(1,true)
		self.btns[i]:removeEscapeButtons()
		self.btns[i].onKeyPress=function(...) self:navigate(i,...) end
		self.btns[i].onKeyRelease=self.keyReleased
		self.btns[i]:setColor(1,1,1,opacity.value)	
		self.btns[i]:setWireframe(WIREFRAME_MODE)
	end
	self.btns[1]:setImage(gAssets['Hovered'])
	self.btns[3]:setImage(gAssets['Disabled'])
	self.btns[1]:setFocused(true)
	-- self.coolbtn:setImageSize(209,70)
end

function MainMenuState:navigate(i,key)
	if self.exiting then return end
	if key=='return' or key=='enter' then
		self.btns[i]:setImage(gAssets['Pressed'])
		self.exiting=true
		return
	end
	if key~='down' and key~='up' then return end
	gAssets['press']:stop()
	gAssets['press']:play()
	self.btns[i]:setFocused(false)
	--we don't do this immediately we might run into an possible infinite loop
	--also this will give us a smooth effect of transitioning
	Timer.after(0.1,function()
		self.btns[i]:setImage(gAssets['unHovered'])			
		local index=euler.cycle(i+(key=='down' and 1 or -1),1,3)
		self.btns[index]:setFocused(true)
		self.btns[index]:setImage(gAssets['Hovered'])
	end)
end

--[[
	for now we'll make this simple - if enter is released for any widget
 	then go to the StartState
]]--
function MainMenuState.keyReleased(key)
	if key=='return' or key=='enter' then
		Chain(
			flux.Tween(opacity,2,{value=0},'quadout'),
			gStateMachine:change('start')		
		)()
	end
end

function MainMenuState:update()
	for i=1,#self.btns do
		self.btns[i]:setColor(1,1,1,opacity.value)
	end
end

function MainMenuState:render()
	love.graphics.print("Use the Arrow Keys to move up and down the list")
end

function MainMenuState:exit()
	for i=1,#self.btns do
		lavis.removeWidget(self.btns[i])
	end
end