**Tab Intro**

Tab Intro shows you how to create a tab-based app. 

Features:
- uses the Tabbed Application template
- adds a third view and controller
- app delegate pattern for passing the model object reference

You can start by choosing the Tabbed Application project template. That will provide you with an app delegate, and two view controllers, one for each tab.

This app includes a simple model class, with two string properties. Each view controller will read data from the model object. Notice the initialization of the model object, in the app delegate. Then, the app delegate gets references to the view controllers, and passes on a reference to the model object to each. 

A third view controller was then added to the project. See its storyboard scene for how-to instructions. 
