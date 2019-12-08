# Lavis Minimal

Lavis is a *cross-mode* GUI library for Love2D which is *kinda like loveframes but for games*. That's its punchline! This is the minimal version of Lavis with which you can create image buttons and custom widgets!!

<p align='center'>
<a href="screens/minimal demo.gif" title="Click to view the Image in Full Resolution">
<img src="screens/minimal demo.gif" width=640 height=480/><br/>
</a>

## Table of Contents

- [How to use?](#how-to-use)
- [Create your game's GUI within minutes](#create-your-games-gui-within-minutes)
- About Lavis
  - [What Lavis is about?](#what-lavis-is-about)
  - [About the name](#about-the-name)
  - [Why retained-mode?](#why-retained-mode)
  - [Lavis is responsive](#lavis-is-responsive)
- [Documentation](#documentation)



### How to use?

To use Lavis, you would simply copy the folder lavis to some other folder in your game - let's say 'lib' - which should be in the same directory as main.lua and then you'd simply say:-

```lua
lavis=require 'lavis'
```

### Create your game's GUI within minutes

There are two approaches to creating your GUI - first one retained and another immediate!!
For example both the following programs do the same thing, print a message when an image-button is clicked:-

```lua
lavis.imageButton('button.png',400,300):addEventListener('click',function()
  print('button clicked')
end)
```

```lua
function love.draw()
  lavis.drawImageButton(1,'button.png',400,300)  --id for this button is 1
end
lavis.imgui.onClick=function(id)
  if id==1 then print('button clicked') end
end
```
Now some may prefer retained-mode others may prefer immediate-mode, it's upto them and their needs. Retained-mode uses a canvas (by default) for rendering and is arguably faster than immediate-mode but it also uses more memory!

There are *several* examples to get you started using Lavis!!

### What Lavis is about?

Before you actually do anything with Lavis, i think you should know what Lavis is about? what it can do and what it can't!

1. **Lavis is all about making highly customizable guis with less code:** Lavis cannot create all types of GUI, no library in the earth could do that! But it can very easily mimick the GUIs that you see in most games (casual games so-to-speak)!

2. **Lavis is about games not apps:** No matter what function changes, Lavis will always and *always* be about games! That's not to say you can't use it in apps! You could- The Horizontal and Vertical layout mimicks the (now deprecated) HBox and VBox of GTK+3 and with it you can create highly responsive GUIs that adapt to the screen resizing!

3. **Lavis is fast and robust:** Developers of Lavis (i.e. me) will always strive to make Lavis as better as possible. The current model of Lavis uses sprite-batches,text-objects and canvases! (though the Minimal Version uses only canvases)

4. **Lavis is cross-mode:** Lavis supports both Retained and Immediate-Mode!! What do I mean by that? [See if for yourself!](#create-your-games-gui-within-minutes)

5. **Lavis is responsive:**  Well what do I mean by that? Have a look at it yourself(#lavis-is-responsive)

### About the name

Lavis doesn't come from the Jeans brand "Levi's". Lavis actually comes from 'lavish' meaning 'generous.' (BTW the pronunciation of Lavis is - Laaavish but you can also say 'levis', doesn't matter) Unlike other retained GUI library Lavis doesn't punish you by consuming a lot of memory also it work very nicely with all kinds of state machines (something that LoveFrames can't boast of)

### Lavis is responsive

Lavis is a responsive retained-mode GUI! (the responsiveness don't apply to Lavis's immediate model) Well what do I mean by that! See for yourself

<p align='center'>
<a href="screens/responsive.gif" title="Click to view the Image in Full Resolution">
<img src="screens/responsive.gif" width=640 height=480/><br/>
</a>


## Documentation

You can read the documentation for the minimal version [here](DOCUMENTATION.MD)
We mainly talk about WidgetClass (so you could create your own custom widgets) but all of that applies to `lavis.imageButton` as well! The only thing in which `lavis.imageButton` differs from `lavis.widget` is the constructor function (imageButton takes in an image as first paramter)
