### Week 3 code samples

**First iOS App**

- round-trip user input
- text field, button, label
- outlet and action

**UI Controls**

- common user interface objects
- segmented control 
- slider 
- switch 
- stepper 
- image view

**Move View**

- move a view to prevent the keyboard from covering a text field
- in this example, we use a text field delegate

**TextView View**

- text view
- display only, NOT editable
- scrollable, multi-line, for lots of text

**TextView Edit**

- text view, editable
- requires a delegate object

**Picker**

A UIPickerView is a user interface control that has one or more spinning wheel components. 

Features:
- picker view requires a data source
- picker view requires a delegate

**Picker Date**

This app uses a special picker view that's designed to work with dates.

Features:
- does not need a data source or delegate.
- can be configured in the Attributes Inspector.

**Picker Multi**

In this example app, we use a multi-component picker to choose a pizza.

Features:
- there are three components
- each component's data is provided by a separate array
- the arrays are initialized in a model object
