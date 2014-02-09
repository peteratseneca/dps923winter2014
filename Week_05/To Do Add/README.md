**To Do Add**

Temporary view, full-screen custom view and controller. 

Features:
- started as a single-view app
- custom controller implements the 'add item' pattern
- defines a protocol
- the app's "ViewController" becomes its delegate

Your first task is to look at the storyboard. Notice the following:
- a navigation controller is the entry point for the app's screen set
- it has a relationship to a scene managed by a standard view controller
- its "add" button ( + ) causes a "modal" segue to another scene
- that scene is managed by a standard view controller

Delegate review:

You started learning about the delegate pattern by using a simple user interface control, a UITextField.

Then, you used it again with (data driven) user interface controls, specifically a UIPickerView, and a UITableView. 

Next, you used it again with framework-provided view controllers, specifically the photo picker, the alert view, and the action sheet. 

In this app, YOU will create a custom controller that needs a delegate, and thereby learn the delegate coding pattern.

This is an important pattern. It will be used any time you are working with multiple scenes (view controllers), and have the need to communicate back to the "parent"/presenting view controller. 

How to build this app:
1. Start with the single-view app template
2. Add a new view controller to your app; call it something like xxxxEdit (e.g. "ItemEdit") 
3. In storyboard, embed the template-provided scene (which is managed by your ViewController class) in a navigation controller (Editor > Embed > ...) 
4. Add a button to the right side of the nav bar; configure it as an "Add" button 
5. Add a View Controller to the storyboard; it will appear as a new scene 
6. In Identity Inspector, configure its class to the new view controller class (e.g. "ItemEdit") 
7. Embed this new view controller in a navigation controller
8. From the "Add" button, Ctrl+Click-drag-drop on the new nav controller - this will create a new segue - select "modal" 
9. Configure the segue's name (e.g. "toItemEdit") 

Suggestion for naming segues: Use the format "to<ViewController>", where <ViewController> is the name of your class. 
This way, its name will suggest the destination of the segue.

FYI - This app re-uses some of the "Array To Do" code.
