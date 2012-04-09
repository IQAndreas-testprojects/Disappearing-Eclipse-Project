I noticed a "problem" with using Git and Eclipse workspaces.
http://twitter.com/IQAndreas/status/52053104027385856

If you don't include the hidden project files (`.project`, `.settings` etc) with the commit, switching to another branch will cause the project to "implode"; as the required project files disappear, Eclipse realizes this is no longer a valid project and closes it.

### Instructions
* Using the command line, checkout the project starting on the `branch` branch (make sure the `.project` and `.settings` files are still there)
* Switch to the `master` branch from inside of Eclipse (I used EGit). The project should close when the `.project` and `.settings` disappear.
