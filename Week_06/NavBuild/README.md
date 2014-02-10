**NavBuild**

Two-level navigation-based app that we built ourselves.

Features:
- started with the Single View Application template
- added the components manually
- still not a best practice, but it does show you the pieces involved

Here's how to rebuild this app:

Create a new project, using the Single View Application template.

Delete the existing "ViewController" class.

Add a new item (Command+N), subclass of UITableViewController, named "ColourList".

Add another new item, subclass of UIViewController, named "ColourDetail".

On the storyboard, delete the existing scene.

Then, click-drag-drop a Navigation Controller. That action creates a table view scene (which will be used for the list), and its enclosing navigation controller.

Next, click-drag-drop a View Controller, which will be used for the detail.

Table view controller scene configuration actions:
1. Set its identity to ColourList
2. Set its title (on the nav bar) 
3. Click/select the table view cell prototype; in the Attributes Inspector, Style=Basic, Identifier=Cell
4. Control+click-drag to the details scene to create a Selection Segue > push; in the segue's Attributes inspector, set its Identifier=toColourDetail

View controller scene configuration actions:
1. Set its identity to ColourDetail
2. Add user interface object(s) that will render content (e.g. a Label)
3. Create outlet(s) to the ColourDetail.h code file

ColourList controller actions:
1. In a "class extension", define an array property to hold data
2. In the viewDidLoad method, initialize the array with data
3. In the table view delegate and data source methods, return data as specified
4. Add an #import "ColourDetail.h" statement to the source code
5. Add a prepareForSegue:sender method, to prepare and configure the destination view controller
