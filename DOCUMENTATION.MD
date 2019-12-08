# Table of Contents

- [Immediate-Model of Lavis](#immediate-model-of-lavis)
    + [`lavis.drawImageButton`](#lavisdrawimagebutton)
  * [Callbacks for Immediate Widgets](#callbacks-for-immediate-widgets)
- [Retained Model of Lavis](#retained-model-of-lavis)
  * [WidgetClass](#widgetclass)
  * [Methods of Widget](#methods-of-widget)
    + [`Widget:init(...)`](#-widget-init---)
    + [`Widget:initWidget(x,y,shape,...)`](#-widget-initwidget-x-y-shape---)
    + [`Widget:setShape(shape,...)`](#-widget-setshape-shape---)
    + [`Widget:setSize(shape,...)`](#-widget-setsize-shape---)
    + [`Widget:getSize()`](#-widget-getsize---)
    + [`Widget:updateSize()`](#-widget-updatesize---)
    + [`Widget:setPosition([x,[y,[ignore_responsive]]])`](#-widget-setposition--x--y--ignore-responsive-----)
    + [`Widget:setWireframe(b)`](#-widget-setwireframe-b--)
    + [`Widget:setFrozen(b)`](#-widget-setfrozen-b--)
    + [`Widget:isFrozen()`](#-widget-isfrozen---)
    + [`Widget:setResponsive(b)`](#-widget-setresponsive-b--)
    + [`Widget:isResponsive()`](#-widget-isresponsive---)
    + [`Widget:setColor(r,g,b,a)`](#-widget-setcolor-r-g-b-a--)
    + [`Widget:setOpacity(a)`](#-widget-setopacity-a--)
    + [`Widget:getColor()`](#-widget-getcolor---)
    + [`Widget:getOpacity()`](#-widget-getopacity---)
    + [`Widget:setImage(path/reference)`](#-widget-setimage-path-reference--)
    + [`Widget:setImagePosition([x,[y]])`](#-widget-setimageposition--x--y----)
    + [`Widget:getImagePosition()`](#-widget-getimageposition---)
    + [`Widget:setImageRotation(r)`](#-widget-setimagerotation-r--)
    + [`Widget:setImageSize(w,[h/relative,[relative]])`](#-widget-setimagesize-w--h-relative--relative----)
    + [`Widget:getImageSize()`](#-widget-getimagesize---)
    + [`Widget:getImageWidth()`](#-widget-getimagewidth---)
    + [`Widget:getImageHeight()`](#-widget-getimageheight---)
    + [`Widget:getActualImageSize()`](#-widget-getactualimagesize---)
    + [`Widget:setImageOrigin(ox,oy)`](#-widget-setimageorigin-ox-oy--)
    + [`Widget:setHotButton(btn,remove)`](#-widget-sethotbutton-btn-remove--)
    + [`Widget:setEscapeButton(btn,remove)`](#-widget-setescapebutton-btn-remove--)
    + [`Widget:removeEscapeButtons()`](#-widget-removeescapebuttons---)
    + [`Widget:setDepth(z)`](#-widget-setdepth-z--)
    + [`Widget:setName(name)`](#-widget-setname-name--)
    + [`Widget:getName()`](#-widget-getname---)
    + [`Widget:setValue(val)`](#-widget-setvalue-val--)
    + [`Widget:getValue(val)`](#-widget-getvalue-val--)
    + [`Widget:setVisible(b)`](#-widget-setvisible-b--)
    + [`Widget:toggleVisibility()`](#-widget-togglevisibility---)
    + [`Widget:isVisible()`](#-widget-isvisible---)
    + [`Widget:setEnabled(b)`](#-widget-setenabled-b--)
    + [`Widget:isEnabled()`](#-widget-isenabled---)
    + [`Widget:isHovered([x,y])`](#-widget-ishovered--x-y---)
    + [`Widget:isFocused()`](#-widget-isfocused---)
    + [`Widget:setFocus(val,...)`](#-widget-setfocus-val---)
    + [`Widget:connectSignal(signal,handler)`](#-widget-connectsignal-signal-handler--)
    + [`Widget:addEventListener(event,listener)`](#-widget-addeventlistener-event-listener--)
    + [`Widget:destroy()`](#-widget-destroy---)
    + [`Widget:update(dt)`](#-widget-update-dt--)
    + [`Widget:mousepressed(x,y,button,...)`](#-widget-mousepressed-x-y-button---)
    + [`Widget:keypressed(key,...)`](#-widget-keypressed-key---)
    + [`Widget:wheelmoved(x,y,...)`](#-widget-wheelmoved-x-y---)
    + [`Widget:mousemoved(x,y,...)`](#-widget-mousemoved-x-y---)
    + [`Widget:mousereleased(x,y,...)`](#-widget-mousereleased-x-y---)
    + [`Widget:render(x,y,...)`](#-widget-render-x-y---)
  * [Widget Handlers](#widget-handlers)
    + [`Widget:onResize(...)`](#widget-onresize--)
    + [`Widget:onValueChange(new,prev)`](#widget-onvaluechange-new-prev-)
    + [`Widget:onMove(...)`](#widget-onmove--)
    + [`Widget:onMouseEnter()`](#widget-onmouseenter--)
    + [`Widget:onMouseExit()`](#widget-onmouseexit--)
    + [`Widget:onMouseMove(x, y, dx, dy, isTouch)`](#widget-onmousemove-x--y--dx--dy--istouch-)
    + [`Widget:onWheelMove(x, y)`](#widget-onwheelmove-x--y-)
    + [`Widget:onKeyPress(...)`](#widget-onkeypress--)
    + [`Widget:onClick(btn,x,y,isTouch)`](#widget-onclick-btn-x-y-istouch-)
    + [`Widget:onRelease(btn,x,y,isTouch)`](#widget-onrelease-btn-x-y-istouch-)
    + [`Widget:onDrag(btn...)`](#widget-ondrag-btn-)
    + [`Widget:onFocusGained(...)`](#widget-onfocusgained--)
    + [`Widget:onFocusLost(...)`](#widget-onfocuslost--)
    + [`Widget:whileFocused()`](#widget-whilefocused--)
    + [`Widget:whilePressed()`](#widget-whilepressed--)
    + [`Widget:whileKeyPressed()`](#widget-whilekeypressed--)
    + [`Widget:whileHovered()`](#widget-whilehovered--)
    + [`Widget:onDraw()`](#widget-ondraw--)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>


# Immediate-Model of Lavis

Since Lavis (or atleast the minimal version of Lavis) has limited support for Immediate-Mode GUI I think we should talk about that first!

The Immediate-model of Lavis currently supports only button clicks, so you can do this if you want to use only the immediate-model

```lua
local imgui=lavis.imgui
function love.update(dt) imgui.update(dt) end
function love.mousepressed(...) imgui.mousepressed(...) end
function love.mousereleased(...) imgui.mousereleased(...) end
```

Though not mandatory since `lavis.update` will automatically call `lavis.imgui.update` and so on...

So the only function that you wan't to be familiar with is `lavis.drawImageButton` (since the minimal version only supports image buttons by default and custom widgets need to be constructed from the widgetclass that it provides)

### lavis.drawImageButton

```lua
lavis.drawImageButton(id,img,x,y,[w,h,[ox,[oy,[r]]]])    --Overload #1
lavis.drawImageButton(img,x,y,[w,h,[ox,[oy,[r]]]])       --Overload #2
```

The prototype may look complicated but it's nothing when you give it a close hard-look!

- Parameters
	- *`<number>`* `id`: The ID of the image-button (1 by default)
	- *`<string/userdata>`* `img`: The path or reference to the image
	- *`<numbers>`* `x,y`: The position of the image-button
	- *`<numbers>`* `w,h`: The dimension of the image-button (defaults to image dimension if nil)
	- *`<numbers>`* `ox,oy`: The origin of the image
	- *`<number>`* `r`: The rotation for the image (0 by default)


- Notes
	- Don't shy to give path of the image! The function won't create an image at every single frame since Lavis maintains a cache of all the images and only creates the image *once*.
	- In case origin is given, Lavis automatically shifts the image so that the original position of the image is retained

## Callbacks for Immediate Widgets

Unlike Retained-Mode the callbacks are not specific to a widget! You'll know just in a moment what I mean by that

Currently there are 6 functions for immediate-mode,
(Pardon me for being lazy here)

```lua
	local eF=function() end
	whileHovered=eF;   --what to do while mouse is hovered over widget
	whilePressed=eF;   --what to do while a widget is pressed
	onMouseEnter=eF;   --what to do when mouse enters a widget
	onMouseExit=eF;    --what to do when mouse exits a widget
	onClick=eF;        --what to do when a widget is pressed
	onRelease=eF;      --what to do when a widget is released
```

In any case the first argument of a callback function is the `id` of the widget!! And other arguments are `x,y,w,h` denoting the mask of the widget (useless) You can do different stuff depending on what the `id` is!! Let me give a short example:-

```lua
lavis.imgui.onMouseEnter=function(id,...)
	print('Mouse Entered a Widget whose id is '..id)
end
lavis.imgui.onMouseExit=function(id,...)
	print('Mouse Exited a Widget whose id is '..id)
end
```

That's all there's to it!!!

# Retained Model of Lavis

The Retained Model has many advantages over the immediate model! Number one being performance! Though Retained-Mode GUIs tend to consume more memory yet on performance basis they are better and are often more featureful!


## WidgetClass
---------------------

**What is a widget?**

> If you don't already know then widget is *any* GUI element, a button is a widget, a slider is a widget and everything that talks and walks is a widget!

WidgetClass is the basic framework of a widget! Every widget *inherits* from this class. So instead of documenting the same propereties. It makes sense to study the master class and then when we get to each widget we'll only talk about what is extended or reduced. Here we'll mainly talk about the features of a WidgetClass and at the end we'll also talk about how one can create his own widget!

## Methods of Widget
---------------------

A widget has the following methods

<a name="init"> </a>

### `Widget:init(...)`

- Parameters
	- *`<varargs>`* `...`: Information needed to initialise a widget
- Returns
	- A brand new Widget
- Notes
	- **This is a constructor function**, you don't need to say `lavis.widget:init(...)`, you could simply say `lavis.widget(...)` to create a brand new widget!

<a name="initWidget"> </a>

### `Widget:initWidget(x,y,shape,...)`

- Parameters
	- *`<numbers>`* `x,y`: The position of the widget
	- *`<string>`* `shape`: The shape of the widget
	- *`<varargs>`* `...`: The size of the widget (depending on given shape)
- Notes
	- A supposedly internal function which is called by the [`Widget:init`](#Widgetinit) function. It sets the position, shape and size of the widget. It calls [`Widget:setShape(shape,...)`](#setShape) to set the shape and size of the object. 
- Caveat
	The size that is set the first time is the size of the widget and the image size is unaffected. If you want the image size to be the same then you'd have to set the widget's size *again* (make sure you didn't turn off the responsiveness with [`Widget:setResponsive`](#setResponsive)). Also note the position of the image is automatically set to the widget position.

<a name="setShape"> </a>

### `Widget:setShape(shape,...)`

- Parameters
	- *`<string>`* `shape`: The shape of the widget
	- *`<varargs>`* `...`: The size of the widget (depending on given shape)
- Notes
	- Sets the shape and size of the widget. The `shape` is the shape which best describes the widget. It can be 'box','circle' or 'ellipse'. It doesn't set the size on its own rather it calls [`Widget:setSize(...)`](#setSize) to do the job

<a name="setSize"> </a>

### `Widget:setSize(shape,...)`

- Parameters
	- *`<varargs>`* `...`: The size of the widget (depending on current shape)
- Notes
	- Sets the size of the widget. The varargs depend on the current shape of the widget - it could be  ``width,height`` for ``'box'``, ``radius`` for ``'circle'`` and ``radiusa,radiusb`` for ``'ellipse'``.
	- In any case the last argument is always ``relative`` a boolean parameter asking you if the size be set relatively. This is important if you simply want to increase or decrease the size by some number. 
	- If the widget is in *responsive-mode* then it'll also affect the size of the image
	-  This function has *no effect* if the widget is *frozen*

<a name="getSize"> </a>

### `Widget:getSize()`

- Returns
	- The *size* of the widget

<a name="updateSize"> </a>

### `Widget:updateSize()`

- Notes
	- A really handy function which you will use *a lot* when tweening. Let's say you tweened the widget's `sx`,`sy` (scale for the image!). So the image would scale but the mask won't follow. (since image position/dimension and mask position/dimension are seperate) So all you need to do is call ``updateSize`` (in the `onupdate` callback function for the tween) and it would automatically take the changed `sx,sy` values into account and *update* the size of the widget based on that!

<a name="setPosition"> </a>

### `Widget:setPosition([x,[y,[ignore_responsive]]])`

- Parameters
	- *`<numbers>`* `shape`:  The new co-ordinates of the widget
	- *`<ignore_responsive>`* `shape`: Whether or not to ignore the widget's responsiveness (ignore it for now!!)
	- *`<varargs>`* `...`: The size of the widget (depending on given shape)
- Notes
	- Sets position of the widget to ``(x,y)``.
	- If any component is nil then it's defaulted to the original component. I don't know where I said this before but a widget's position can be different to the background image's position (for mask-related reasons).
	- If a widget is responsive (which by default it is) then the image position is also changed when mask position is changed. Now you don't want to turn off responsiveness and then turn it on back again for this so you could pass *true* in the third parameter ``ignore_responsive`` which will only set the widget position and not the image position.
	- To set the image position you may use [`Widget:setImagePosition`](#setImagePosition)!

	-  This function has *no effect* if the widget is *frozen*

<a name="setWireframe"> </a>

### `Widget:setWireframe(b)`

- Parameters
	- *`<boolean>`* `b`: Whether or not to draw the widget's masks' border and origin as well as that for the image!
- Notes
	- Turning wireframe mode on will allow you to see the widget mask along with the origin of the image and the widget.
	- Image's origin is green whereas widget's origin is rendered as blue.
	- For an example use of the function see [examples](examples)

<a name="setFrozen"> </a>

### `Widget:setFrozen(b)`

- Parameters
	- *`<boolean>`* `b`: Whether or not to *freeze* the widget
- Notes
	- When a widget is *frozen* you *cannot* move/scale the widget meaning calls to [`Widget:setPosition`](#setPosition) and [`Widget:setSize`](#setSize) will be useless!
	- However note that *can* change the position of the image by calling [`Widget:setImagePosition`](#setImagePosition)

<a name="isFrozen"> </a>

### `Widget:isFrozen()`

- Returns
	- *`<boolean>`* `b`: Whether the widget is frozen or not

<a name="setResponsive"> </a>

### `Widget:setResponsive(b)`

- Parameters
	- *`<boolean>`* `b`: Whether or not to set *responsive* mode
- Notes
	- A widget has two positions and two dimensions!! One for the widget-mask and second for the image! While this may sound stupid at first it helps in complicated cases such as when one only has to set mask for a part of the image
	- Because the widget has two positions (and two dimensions) it can create a lot of problems! And since Lavis supports elliptic widget masks it can create even more problems and also a lot of typing (such as setting the image position whenever widget position has to be set)
	- So this part is done by Lavis and it does it good making it super-easy to recreate simple UIs that one sees in casual games! This again may create problem since the user may only want to set the widget position or dimension! So for this reason you'd want to turn on or off the responsive-mode
	- The responsive-mode is on by default! But note that in the beginning (when just creating widget) it has absolutely no effect! (Since the user may want to remove responsive-mode immediately after he creates the widget)

<a name="isResponsive"> </a>

### `Widget:isResponsive()`

- Returns
	- *`<boolean>`* : Whether the widget is in responsive mode

<a name="setColor"> </a>

### `Widget:setColor(r,g,b,a)`

- Parameters
	- *`<numbers>`* `r,g,b,a` : The RGBA components
- Notes
	- The given color will be set before rendering the widget
	- The alpha-value `a` can be nil

### `Widget:setOpacity(a)`

- Parameters
	- *`<number>`* `a` : The alpha value for the widget
- Notes
	- This function *doesn't* require to to [`setColor`](#setColor) first

<a name="getColor"> </a>

### `Widget:getColor()`

- Returns
	- *`<numbers>`* `r,g,b,a` : The RGBA components
- Notes
	- Returns the widget's custom color (if any)
	- The alpha-value `a` may be nil
	- Try not to call this function when you didn't set any custom color to the widget! Doing so may produce bugs that are difficult to spot!

<a name="getOpacity"> </a>

### `Widget:getOpacity()`

- Returns
	- *`<number>`* `r,g,b,a` : The widget's opacity (if previously set)

<a name="setImage"> </a>

### `Widget:setImage(path/reference)`

- Parameters
	- *`<string/userdata>`* `path/reference` : The image's URL or a reference to a Image object
- Notes
	- Set's the widget's image
	- In case `path` is passed, then an image is created *the first time*!
	- Lavis maintains a cache such that second time this function is called with the same `path` then it doesn't create any new image but returns the same image that was created!!
	- In general it doesn't matter whether you pass `path` or `reference` of the image! They are both (nearly) same as far as performance is concerned

<a name="setImagePosition"> </a>

### `Widget:setImagePosition([x,[y]])`

- Parameters
	- *`<numbers>`* `x,y` : The new co-ordinates of the widget image!
- Notes
	- This function *will work* even if the widget is *frozen*!
	- If any component is nil then it's defaulted to the original component. Please note that setting the image position has absolutely no effect on the Widget's position, even if *responsive -mode* was enabled.

<a name="getImagePosition"> </a>

### `Widget:getImagePosition()`

- Returns
	- *`<numbers>`* `x,y` : The position of the widget image!

<a name="setImageRotation"> </a>

### `Widget:setImageRotation(r)`

- Parameters
	- *`<number>`* `r` : The rotation of the image (in radians)
- Notes
	- Sets the image's rotation to given value. Note that there's no concept of widget rotation (as of now)
	- This function has no effect on the widget-mask

<a name="setImageSize"> </a>

### `Widget:setImageSize(w,[h/relative,[relative]])`

- Parameters
	- *`<numbers>`* `w,h` : The new size of the image (in pixels)
	- *`<boolean>`* `relative` : Whether to set image size *relatively*
- Notes
	- Sets the image size. Note that you enter the *dimensions* and *not* the *factor*!!
	- So if you want to double the image size you'd pass twice the image size as parameter rather than 2.
	- Now the overloading is pretty confusing. The last parameter is always ``relative`` which if set to true (or any non-falsy value) sets the size relatively rather than absolutely. If your width and height are the same then you simply pass in one of them as the first parameter and ``relative`` as the second (and last) parameter!


<a name="getImageSize"> </a>

### `Widget:getImageSize()`

- Returns
	- *`<numbers>`* `w,h` : The size of the widget's image (in pixels)
- Notes
	- This is *not* the same as saying ``Widget.image:getDimensions()``. The latter returns to you the dimensions of the *original* image, whereas this one returns you the size that was set to it after that! And btw the same is true for the next two functions!

<a name="getImageWidth"> </a>

### `Widget:getImageWidth()`

- Returns
	- *`<number>`* `w` : The width of the widget's image (in pixels)

<a name="getImageHeight"> </a>

### `Widget:getImageHeight()`

- Returns
	- *`<number>`* `h` : The height of the widget's image (in pixels)

<a name="getActualImageSize"> </a>

### `Widget:getActualImageSize()`

- Returns
	- *`<numbers>`* `w,h` : The size of the widget's image (in pixels)
- Notes
	- This is *exactly* the same as saying ``Widget.image:getDimensions()``.

<a name="setImageOrigin"> </a>

### `Widget:setImageOrigin(ox,oy)`

- Parameters
	- *`<numbers>`* `ox,oy` : The origin of the image
- Notes
	- Sets the image's origin. It automatically shifts the image so that it's original position is retained!
	- Note that when you use Circle as a collision mask it is recommended that you immediately set the origin to half of the image size. It's not done by default because sometimes you may not want that behaviour and some may see this as a bug.

<a name="setHotButton"> </a>

### `Widget:setHotButton(btn,remove)`

- Parameters
	- *`<number>`* `btn` : The mouse button number (1-LMB,2-RMB, so on)
	- *`<boolean>`* `remove` : Whether to remove the existing hot button
- Notes
	- A short example may do good here::
	```lua
		widget.onFocusGained=function(...) print("focused",...) end
		widget:setHotButton(2)
		widget:setHotButton(1,true)
	```
	Now when you click LMB on the widget, it won't be focused but when you press RMB you get that "focused" message in the console
	- By default LMB Is the "hot-button" for a widget! So when you LMB-click a widget then it is focused

<a name="setEscapeButton"></a>

### `Widget:setEscapeButton(btn,remove)`

- Parameters
	- *`<number>`* `btn` : The mouse button number (1-LMB,2-RMB, so on)
	- *`<boolean>`* `remove` : Whether to remove the existing escape button
- Notes
	- Unlike hot-buttons, escape-buttons "un-focus" a widget! A widget is focused, when you press MMB on some other thing the widget would still be focused cause MMB is not an escape button (by default)!
	- By default LMB and RMB are escape buttons but you could ofcourse remove that with this function

<a name="removeEscapeButtons"></a>

### `Widget:removeEscapeButtons()`

- Notes
	- Removes all the existing escape buttons
	- Useful if your buttons are not clickable but are rather focused, unfocused with keyboard-presses if you get the idea!

<a name="setDepth"></a>

### `Widget:setDepth(z)`

- Parameters
	- *`<number>`* `depth` : The depth of the widget
- Notes
	- Many a times you may want a widget to appear on top of another widget or below every other widget or something like that!
	- With Lavis this is very easy to do, just set the depth of the widget
	- The higher depth means the widget would be rendered on top of the widgets with lower depth!


<a name="setName"></a>

### `Widget:setName(name)`

- Parameters
	- *`<string>`* `name` : The new name of the widget
- Notes
	- Sets the name of the widget to new value
	- The name of the widget is useful when you want to identify a particular widget, other than that it's useless

<a name="getName"></a>

### `Widget:getName()`

- Returns
	- *`<string>`* `name` : The name of the widget

<a name="setValue"></a>

### `Widget:setValue(val)`

- Parameters
	- *`<string>`* `name` : The new value of the widget
- Notes
	- Sets the value of the widget
	- You can very easily implement image-buttons, buttons, toggle buttons, radio buttons and checkboxes with Lavis's WidgetClass all thanks to this trivial function!

<a name="getValue"></a>

### `Widget:getValue(val)`

- Parameters
	- *`<string>`* `name` : The current value of the widget
- Notes
	- This function would prove useful for widgets like sliders, for eg- you want a label next to a slider which displays - in percentage - the value of the slider.

<a name="setVisible"></a>

### `Widget:setVisible(b)`

- Parameters
	- *`<boolean>`* `b` : Whether or not to draw the widget
- Notes
	- Sometimes you simply don't want to draw a widget! So just make it invisible!

<a name="toggleVisibility"></a>

### `Widget:toggleVisibility()`

- Notes
	- Toggles visibility of the widget

<a name="isVisible"></a>

### `Widget:isVisible()`

- Returns
	- *`<string>`* `name` : Whether or not is the widget visible

<a name="setEnabled"></a>

### `Widget:setEnabled(b)`

- Parameters
	- *`<boolean>`* `b` : Whether or not to process the widget (check for input,etc)
- Notes
	- Even if you make the widget invisible yet it would respond to all the events and this may give rise to buggy situations! Hence you must disable a widget if you don't want it respond to any event

<a name="isEnabled"></a>

### `Widget:isEnabled()`

- Returns
	- *`<string>`* `name` : Whether or not is the widget enabled

<a name="isHovered"></a>

### `Widget:isHovered([x,y])`

- Parameters
	- *`<numbers>`* `x,y` : The position of the widget
- Returns
	- *`<boolean>`* `hovered` : Whether or not given point is in the widget!
- Notes
	- If you don't give a position then it's defaulted to the cursor's position meaning whether the cursor is in the widget's mask or not.
	- *But why custom point?* In some games you'd control a custom cursor (an image) with keys and then you'd have to check if the point is in the widget or not. There are several more reasons why you'd want to add a custom point to it.

<a name="isFocused"></a>

### `Widget:isFocused()`

- Returns
	- *`<string>`* `focused` : Whether or not is the widget focused

<a name="setFocus"></a>

### `Widget:setFocus(val,...)`

- Parameters
	- *`<string>`* `val` : Whether or not to set the widget focused 
	- *`<varargs>`* `...` : Additional arguments to pass in the callback functions
- Notes
	- Focuses or blurs a widget depending on ``val``.
	- This is actually an internal function but you can use it on a higher level without any problems. Just note the varargs that you pass will reflect on [`Widget.onFocusLost`](#onFocusLost)and [`Widget.onFocusGained`](#onFocusGained) callback functions!

<a name="connectSignal"></a>

### `Widget:connectSignal(signal,handler)`

- Parameters
	- *`<string>`* `signal` : The signal
	- *`<function>`* `handler` : The callback function
- Returns
	- *`<table>`* `Widget` : The Widget itself (for chaining)

- Notes
	- Some people may not like the way you add callback functions so this function is just for those who like chaining!
	- Signal are a string such as 'click','release','hovered',etc which are mapped to the handler! These strings are also called *event keywords*.
	- There can be more than one keyword which maps to the same handler. See [`Handlers`](#Handlers) for more information!
	- Users from GTK+ (or Qt) are maybe more comfortable with the idea of signals than the idea of callback functions.
	- For now just think of it as *syntactic sugar*

<a name="connectSignal"></a>

### `Widget:addEventListener(event,listener)`

Again *syntactic sugar*! Just an alias of [`connectSignal`](#connectSignal)

<a name="destroy"></a>

### `Widget:destroy()`

- It'll not exactly destroy the widget like one might expect but it creates garbage basically! Lavis complely dissociates the widget and unless you have a reference to the widget it'd die a slow death!

- To completely destroy the widget you must *nilify* the widget after calling this function and make sure there are no more references to the widget!

- After calling this function the widget would no longer be processed and rendered even if it might still remain on memory (gc's to blame not Lavis!)

<a name="update"></a>

### `Widget:update(dt)`

Processes the widget individually

- Notes
	- Only call (this and other functions like ['mousepressed'](#mousepressed),etc when you know what you are doing!
	- You might use this for state but I prefer using [`lavis.update`](#lavis.update), etc and then destroying the widget afer the state is exitted! Though some may not like this approach hence this function!!

<a name="mousepressed"></a>

### `Widget:mousepressed(x,y,button,...)`

An individual version of `lavis.mousepressed`

<a name="keypressed"></a>

### `Widget:keypressed(key,...)`

An individual version of `lavis.keypressed`

<a name="wheelmoved"></a>

### `Widget:wheelmoved(x,y,...)`

An individual version of `lavis.wheelmoved`

<a name="mousemoved"></a>

### `Widget:mousemoved(x,y,...)`

An individual version of `lavis.mousemoved`

<a name="mousereleased"></a>

### `Widget:mousereleased(x,y,...)`

An individual version of `lavis.mousereleased`

<a name="render"></a>

### `Widget:render(x,y,...)`

An individual version of `lavis.render`

- Notes
	- Draws the widget individually. You shouldn't use `lavis.draw` if you are using this function otherwise you'd draw the same widget twice.
	- An other way around this is removing the widget from widgetlist using [`lavis.removeWidget`](#removeWidget) or even [`Widget:destroy`](#destroy).


## Widget Handlers
---------------------

What should happen when you click LMB/RMB on a widget while it's hovered! What should happen when you scroll a widget while it's focused or while it's *not* focused! What should happen when a key is pressed while a widget is both hovered and focused! Crazy, right? How can someone generalize all the events that could possibly happen for a given widget? Well I have attempted to genericise as much as I could without making things complicated - using callback functions. Callback functions are the stepping stones of modularity. So rather than having all your widget logic in a single update function they are divided into what's called handlers. Below are the callback functions that every widget supports and that's just how you can create your own widget on a higher level.

> Note that all widget handlers take it the widget as the first parameter! So that one can easily create what's called a *template widget*!

<a name="onResize"></a>

### Widget:onResize(...)

> **Caution:** Not to be confused with `lavis.resize` which needs to be called at `love.resize()`

- Parameters
	- *`<varargs>`* `...`: The parameters are basically what the parameters were passed to [`setSize`](#setSize)!
- Event Keywords
	- ``'resize'``

This callback function is triggered whenever the widget is resized - more technically whenever [`setSize`](#setSize) is called to set the widget size! 

<a name="onValueChange"></a>

### Widget:onValueChange(new,prev)

- Parameters
	- *`<numbers>`* `new, prev`: The new and previous value of the widget
- Event Keywords
	- ``'valuechanged'``

This callback function is triggered whenever the value of a widget is changed (with [`setValue`](#setValue)! And to be precise *after* the value has been changed so you could revert the change if you want with this handler!

<a name="onMove"></a>

### Widget:onMove(...)

> **Caution:** Not to be confused with [`onMouseMove`](#onMouseMove)

- Parameters
	- *`<varargs>`* `...`: Needless to say that the parameters are same as that passed in :func:`setPosition <Widget:setPosition>`!

- Event Keywords
	- ``'move'``

This function is called whenever the position of the widget is changed!

<a name="onMouseEnter"></a>

### Widget:onMouseEnter()

> **Caution:** Not to be confused with [`whileHovered`](#whileHovered)

- Event Keywords
	- ``'mouseentered'``

This callback function is triggered when the mouse *just enters* the widget area!

<a name="onMouseExit"></a>

### Widget:onMouseExit()

- Event Keywords
	- ``'mouseexited'``

This callback function is triggered when the mouse *just exits* the widget area!

### Widget:onMouseMove(x, y, dx, dy, isTouch)

- Parameters
	- *`<numbers>`* `x,y`: The current mouse position
	- *`<numbers>`* `dx,dy`: The relative change in mouse position since the previous call
	- *`<string>`* `isTouch`: Whether the button press originated from a touchscreen touch-press.

- Event Keywords
	- ``'mousemoved'``

This callback function is triggered when the mouse is moved *while* <u>still focused</u>!

### Widget:onWheelMove(x, y)

- Parameters
	- *`<numbers>`* `x,y`: The amount the wheel moved
- Event Keywords
	- ``'wheelmoved'``,``'scroll'``

This callback function is triggered when the mousewheel is moved *while the widget is focused*

### Widget:onKeyPress(...)

- Parameters
	- *`<varargs>`* `...`: Same as `love.keypressed`'s args
- Event Keywords
	- ``'keypressed'``,``'keyhit'``

This callback function is triggered when a key is pressed *while the widget is focused*!

### Widget:onClick(btn,x,y,isTouch)

- Parameters
	- *`<number>`* `btn`: The button that was clicked
	- *`<numbers>`* `x,y`: The position where the mouse clicked on the button
	- *`<boolean>`* `isTouch`: Whether the mouse-click originated from a touchscreen touch-press.
- Event Keywords
	- ``'move'``,``'hit'``

This callback function is invoked *once* when the mouse is clicked *on the button*! If you want real-time check then use :func:`whilePressed <Widget.whilePressed>` handler. Now I want to very clear about this that the ``x,y`` are wrt the window and not the button - in other words there's nothing weird about them.

### Widget:onRelease(btn,x,y,isTouch)

- Parameters
	- *`<number>`* `btn`: The button that was clicked
	- *`<numbers>`* `x,y`: The position where the mouse clicked on the button
	- *`<boolean>`* `isTouch`: Whether the mouse-click originated from a touchscreen touch-press.
- Event Keywords
	- ``'move'``,``'hit'``

This callback function is invoked *once* when the mouse is released *on the button*!

### Widget:onDrag(btn...)

- Parameters
	- *`<number>`* `btn`: The button that was used for dragging
	- *`<varargs>`* `...`: Same as `love.mousemoved`'s args
- Event Keywords
	- ``'drag'``

This callback function is invoked *while* the widget is being dragged!

<a name="onFocusGained"></a>

### Widget:onFocusGained(...)

- Parameters
	- *`<varargs>`* `...`: Parameters passed by the calling function
	:func:`setPosition <Widget:setPosition>`!

- Event Keywords
	- ``'focusgained'``, ``'focus'``

This callback function is triggered when the widget *gains* focus! Meaning if it's already focused then this callback function will not be invoked. If you don't know what means when focus is gained or lost then please read about [hot buttons](#setHotButton) [escape buttons](#setEscapeButton)

### Widget:onFocusLost(...)

- Parameters
	- *`<varargs>`* `...`: Parameters passed by the calling function
	:func:`setPosition <Widget:setPosition>`!

- Event Keywords
	- ``'focuslost'``, ``'blur'``

This callback function is triggered when the widget *loset* focus! Meaning if it's already blurred then this function won't be called!

### Widget:whileFocused()

- Event Keywords
	- ``'focused'``

This callback function is triggered *as long as the widget is focused!*! 

### Widget:whilePressed()

- Event Keywords
	- ``'pressed'``, ``'clicked'``

This callback function is triggered *as long as the widget is clicked!*! 

### Widget:whileKeyPressed()

- Event Keywords
	- ``'keypressed'``

This callback function is triggered *as long* as a key is pressed *while* the widget is focused! 

### Widget:whileHovered()

- Event Keywords
	- ``'hovered'``

This callback function is triggered *as long as the widget is hovered!*! 

### Widget:onDraw()

- Event Keywords
	- ``'draw'``

This function is called *after* the widget is drawn!
