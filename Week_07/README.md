### Week 7 code samples

**CD 1**

One entity, objects created in code, two-level navigation.

Features:
- one entity, custom class was generated
- objects were created in code
- two-level navigation

**CD 1 +**

Based on "CD 1"; has the add-edit pattern implemented.

Features:
- based on "CD 1"
- custom modal view to add a new object
- notice the smooth animation option when a new row is added

**CD 1 +-**

Based on "CD 1 _+"; has the delete pattern implemented.

Features:
- based on "CD 1 +"
- uses code that you saw first in the “Master-Detail Application" template

In ProfessorList, in its viewDidLoad method, look for the statement that adds the "Edit" button to the nav bar.

Then, look for the method named tableView:commitEditingStyle:forRowAtIndexPath:. It does the deletion in that method, but you could also write a method in the Model class to do this.

Finally, look at the method named controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:, It adds a switch-case block to handle the animated row delete task.
