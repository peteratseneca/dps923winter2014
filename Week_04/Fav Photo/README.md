**Fav Photo**

The app enables the user to display their favourite photo. It displays full-screen temporary views that are system/framework-provided. One is an image picker, the other is a mail composer.

Features:
- image picker created in code
- mail composer created in code
- these objects require a delegate - your controller

The Resources group/folder has four photos. All were 320px wide, and 480px tall, but were scaled to fit the UIImageView (160px wide and 240px tall). They were created by three digital artists (SteveJohn, PatricioVillarroel, and TomPhone) in 2009, and are intended for use as iPhone background wallpaper.

An easy way to get them into your iPhone Simulator's photo library is to:
1. Start/run the iOS Simulator
2. Open the Supporting Files > photos group/folder in Finder
3. For each image... Drag it from Finder to the iOS Simulator; it will open in Safari; and then click/tap and hold; an action sheet will appear; click the Save Image button

This app has one more new feature... "category":
http://developer.apple.com/iphone/library/documentation/General/Conceptual/DevPedia-CocoaCore/Category.html

The UIImage class does not have a method that will re-size an image. The category in this app will do that. (You can use this category in your other apps in the future.) 
