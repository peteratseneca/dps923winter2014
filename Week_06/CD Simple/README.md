**CD Simple**

The purpose is to show a BEST PRACTICE implementation of a Core Data stack.

Features:
- uses the simple "Event" entity that comes with a templated project
- Core Data objects are in a CDStack class
- Model class remains responsible for the app's data
- app delegate is clean

High-level design philosophy:
- a model object will manage the app's state
- the Core Data "stack" will be managed by a dedicated object (CDStack)

This app replicates the functionality of the Xcode template project, but does it the "right" way. 

Here's how this app was built:

We started with an Empty Application, named "Classes".

We did NOT check/mark the "Use Core Data" checkbox. 
We will add the Core Data components manually...
In the Project navigator, click to select your project file. In the details panel, the "Summary" info should appear.
Click the "Build Phases" tab, and spin open the "Link Library With Libraries" section. 
Add the CoreData.framework. Click-and-drag it to the bottom of the list of libraries. 
Finally, in the app's pch file, add: #import <CoreData/CoreData.h>

In the "Classes" folder/group, add a Core Data "Data Model" object, and call it "ObjectModel" (it will add the xcdatamodeld extension).

Create a Model class (later we'll save one as a template and copy that in).
Add it (i.e. #import...) to the app's pch file.

Copy in the CDStack class (from this app; "Add Files to <projectname>...").

Add (create) Main.storyboard. On the project's "General" settings panel, set the "Main Interface" dropdown to this just-added storyboard. Finally, in the app delegate's application:didFinishLaunchingWithOptions: method, return the code on lines 15 through 18. In other words, simply return YES from the method.

Now you can add/create controllers to manage the scenes (one per "view controller" scene).
A best practice is to use names in the form <Entity><VCtype>.
<Entity> is a data entity, or a business logic operation. 
<VCstyle> is the style of view controller (e.g. List, Detail, Edit). 
So, for this app, the names are...
EventList - a list of "event" objects 
EventDetail - the details for a specific "event" object

First, a navigation controller is added, which creates a table view with it.
Its table view cell settings get updated (Basic, identifier is "Cell"). 
Then, a view controller is added. Next, a segue gets added, from the table view cell to the view controller. 
Finally, the navigation controller is marked as the initial scene. 

For each view controller scene, set its identity on the Identity inspector.

Then, design the entity (or entities) for the app, by using either the table-mode or graphical-mode designer. 
Click/select the Core Data "ObjectModel" item, and work with it. 

See the remaining code for best practices.
