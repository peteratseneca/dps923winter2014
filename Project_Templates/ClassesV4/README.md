**ClassesV4**

Posted on 2014-03-14.

This is a BETTER template than ClassesV3.

If you wish, you can use this as a "template" for a new project.

Features:
- components for on-device storage (based on Core Data)
- Model class init that covers all possibilities for initial data when the app launches
- web service requestor class

How to use this project as a "template" for your own...

In Finder, select this project's folder.  
Command+D to duplicate.

Then, rename the folder to your desired name.  
Open it, then open the project file in Xcode.

In the Project Navigator, select the project file (it has a blue icon).  
Press the tab key, and type your new name.  
You will be prompted through the rename procedure.

On the Product menu, choose Scheme > Manage Schemes...  
Click to select the (only) scheme, and press the tab key to highlight the (old) scheme name.  
Type the new scheme (project) name, and press Enter (then OK on the dialog box).

**Change log**

Added WebServiceRequest class  
Added notification support in EntityList class  
EntityList class includes row add and delete with smooth animations
Added a 'Snippets' group with text you can copy-paste

Study the new WebServiceRequest class - it encapsulates the web service request behaviour that we want. To use it:
* Create an instance (typically in the model object)
* Configure it (if you have to; the base init works with simple GET of JSON data)
* Execute it
