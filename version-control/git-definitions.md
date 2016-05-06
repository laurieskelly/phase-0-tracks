# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

>Version control is a system for documenting, organizing, and tracking the changes made to a collection of files, typically a codebase. It is useful for a number of reasons: so that multiple people can work on a project without having to checkout and lock the portions they are working on, so that people can work on distributed copies of the files (even offline) and submit changes to a common repository, so that changes that others have made can be easily integrated, so that features can be created in parallel and separately added to the main project in a logical manner to prevent issues with inconsistencies among different versions that have been created (conflicts).

* What is a branch and why would you use one?

>A branch is a piece of the repository that diverges from the master version of the code at a marked point. Changes can be made to the branch, which can be developed, debugged, and tested before integrating them with the main projects. You would use a branch to do something new to the project without endangering other people's work or the overall functionality, or if you are not a main contributor to the project you can create a feature or fix a bug that the owners of the repo can view and accept if it works and is acceptable to them in terms of style, quality, or the overall goals of the project.

* What is a commit? What makes a good commit message?

>A commit is similar to a save, as it triggers an update to the record of work. However in version control a commit has some extra features. It carries information about who you are and what you changed in which files, and when, and it serves as a point that can be returned to if it's desired to "undo" subsequent changes. A good commit message succinctly describes the changes that were made so that other people reading the log of the repository can understand what you were doing or trying to do.

* What is a merge conflict?

>A merge conflict occurs when certain changes to a file, which are trying to be committed to the repository, are incompatible with the existing state of the file. Also, this could happen at the level of entire files, when a branch is being merged into another branch. Git is pretty good at merging files that have been changed by one or more parties if the changes do not disagree with each other. However, if two people changed a file in a similar place, or if one person changed it and another person deleted it, this creates a conflict that must be resolved before the merge can be completed. 
