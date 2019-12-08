# Lavis Minimal

Lavis is a *cross-mode* GUI library for Love2D which is *kinda like loveframes but for games*. That's its punchline and remember LoveFrames can't create immediate widgets!

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

3. **Lavis is fast and robust:** Developers of Lavis (i.e. me) will always strive to make Lavis as better as possible. The current model of Lavis uses sprite-batches,text-objects and canvases!

4. **Lavis is cross-mode:** Lavis supports both Retained and Immediate-Mode!! What do I mean by that? See if for yourself:-

5. **Lavis is responsive:**  Well what do I mean by that? Have a look at it yourself:

### About the name

Lavis doesn't come from the Jeans brand "Levi's". Lavis actually comes from 'lavish' meaning 'generous.' (BTW the pronunciation of Lavis is - Laaavish but you can also say 'levis', doesn't matter) Unlike other retained GUI library Lavis doesn't punish you by consuming a lot of memory also it work very nicely with all kinds of state machines (something that LoveFrames can't boast of)

### Why retained-mode?

ImGUIs are gaining a lot of popularity nowadays because of the ease of creating them and also because they are much faster to create then the `retained-mode` GUIs. But retained-mode has their own advantages even in context of game-development first one being the learning curve- ImGUIs can sometimes be confusing whereas retained-mode are crystal-clear - like the button is not showing itself because you had hidden it before rendering compared to *the button there is not showing because it shares the same GEN_ID with a invisible widget*! **Also retained-mode GUIs are lightning fast when compared to imguis!**

And believe it or not but retained-mode GUIs are preffered over ImGUIs in context of casual-game development. Cause casual game developers are mostly web-developers and are more comfortable with the `addEventListener` sort of paradigm than they are with those GEN_IDs or whatever.

Note that I'm not advocating you shouldn't use ImGUIs. I'm only saying retained-mode GUIs has their own advantages and ImGUIs can be super-useful to perhaps create a prototype quickly or maybe for very dynamic games! But for casual games I believe retained-mode GUIs are better solution!

### Lavis is responsive

Lavis is a responsive retained-mode GUI! Well what do I mean by that! See for yourself

<p align='center'>
<a href="screens/responsive.gif" title="Click to view the Image in Full Resolution">
<img src="screens/responsive.gif" width=640 height=480/><br/>
</a>


## Documentation

~~The documentation can be found [here](). Alternatively you can also *build* the docs in the [docs]() branch!~~
Sorry the documentation will take some time (I'm working on it and will upload it soon)
