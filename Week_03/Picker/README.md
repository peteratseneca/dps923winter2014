**Picker**

A UIPickerView is a user interface control that has one or more spinning wheel components. If you're comparing UI controls to a browser, a picker's typical use is to replace a drop-down list or a listbox. 

Features:
- picker view requires a data source
- picker view requires a delegate

The picker view requires a source of data, and it raises some events. 

Therefore, your view controller must be configured as the picker view's data source and delegate.

When the picker view is initially created, the Cocoa runtime calls methods in your view controller.

These methods determine the number of components, the number of rows in each component, and the visible text displayed in the row.

The data source for a picker view is an array. This app defines and uses a model object to hold the data for the app. The picker view data source is an array of strings; communities in Ontario.
