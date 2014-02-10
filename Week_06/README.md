### Week 6 code samples

**NavTemplate**

Navigation based app, using the Xcode 5 template.

Features
- NOT! a best practice!
- no changes were made to the project
- comments explain what's going on

**NavBuild**

Two-level navigation-based app that we built ourselves.

Features:
- started with the Single View Application template
- added the components manually
- still not a best practice, but it does show you the pieces involved

**TVS Single**

Table view, select, single item selection.

Temporary view, custom view and controller, uses a table view as a user interface object. Supports selection of a single item.

Features:
- custom view and controller
- defines a protocol to be adopted by a host controller

**TVS Multi**

Table view, select, multiple item selection.

Temporary view, custom view and controller, uses a table view as a user interface object. Supports selection of multiple items.

Features:
- similar in many ways to TVS Single
- however, the user can tap-to-select many items on the table view list
- when a row is tapped, its selected state is toggled 
- a 'Done' button (on the top nav bar) processes the user's selections
- custom view and controller
- defines a protocol to be adopted by a host controller
- custom class that defines an object that can hold a "selected" state

**CD Simple**

The purpose is to show a BEST PRACTICE implementation of a Core Data stack.

Features:
- uses the simple "Event" entity that comes with a templated project
- Core Data objects are in a CDStack class
- Model class remains responsible for the app's data
- app delegate is clean

**CD Types**

The purpose of CD Types is to show how to work with the full range of data types that Core Data supports. 

Features:
- range of data types
- learn about a value transformer
