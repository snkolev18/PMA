# SFA Java - Mid term exam 1
## Project Management application  (1 week)


## 1. Assignment Goals
The Project Management application manages the operations of an IT company. It brings visibility to an organization of multiple teams, working on multiple projects. 


## 2. Assignment Description
The Project Management application is a platform for project management and time tracking. 

The system orchestrates the activities of multiple teams, each working on different projects. 

The system works with registered users. Each user is represented by a username, password, first name, last name and whether they have administrator access (Boolean value that is true when the user is an administrator). 

A team is represented by a team name and team members (list of users). 

Each team can be assigned to a project. 

A project is represented by a name, description, owner and tasks (a list of tasks that need to be completed within the project scope). A project’s owner is the user that created the project. Although the project can have only one owner, it can have multiple teams assigned to it. 

A task is represented by a title, description, project (the project this task belongs to), assignee (the user that this task is assigned to), status (pending or completed) and a list of work logs (records, describing hours spent by users, working on the task). 

A work log is represented by a user (the user that worked on the task), time spent (the amount of hours spent working on the task for that day), date (the date when these hours were spent working on the task) and task (the task that these hours were spent on). 

### 2.1 Required Tasks
**Authentication** 

**Story 1:** As a User I need to be able to log into the Project Management application with my username and password. 
If this is the first execution of the application and there are no users in the data store, I need to be able to log-in with the following user: 

Username: admin 

Password: adminpass 

**Story 2:**As a User without administrative privileges my access to the Users Management View needs to be restricted. 


**Users Management**

**Story 3:** As a User with administrative privileges I need to be able to access the Users Management View where I can list all users, create, edit and delete a user. 

**Story 4:** As a User with administrative privileges I need to be able to create a user and persist the following information: 
Id 
Username 
Password 
First Name 
Last Name 
Date of creation 
Id of the creator 
Date of last change 
Id of the user that did the last change 

**Story 5:** As a User with administrative privileges I need to be able to delete a user by Id 

**Story 6:** As a User with administrative privileges I need to be able to edit a user by Id by providing the following information: 
Username 
Password 
First Name 
Last Name 
Date of creation and Id of the creator remain unchanged 
Date of last change and Id of the user that did the last change are updated automatically


**Teams Management** 

**Story 7:** As a User with administrative privileges I need to be able to access the Teams Management View where I can list all teams, create, edit and delete a team. 

**Story 8:** As a User with administrative privileges I need to be able to create a team and persist the following information: 
Id 
Title 
Date of creation 
Id of the creator 
Date of last change 
Id of the user that did the last change 

**Story 9:** As a User with administrative privileges I need to be able to delete a team by Id 

**Story 10:** As a User with administrative privileges I need to be able to edit a team by Id by providing the following information: 
Title 
Date of creation and Id of the creator remain unchanged 
Date of last change and Id of the user that did the last change are updated automatically 

**Story 11:** As a User with administrative privileges I need to be able to assign users to a team. 

**Projects Management** 

**Story 12:** As a User I need to be able to access the Project Management View where I can access all Projects that are created by me or are assigned to teams where I’m a member - list all Projects, create, edit and delete a Project. 

**Story 13:** As a User in the Project Management View I should not be able to edit or delete projects that are not created by me, instead I should be able to access a detailed view of those projects where I’m able to browse through their tasks. 

**Story 14:** As a User I need to be able to create a Project and persist the following information: 
Title 
Description 
Date of creation 
Id of the creator 
Date of last change 
Id of the user that did the last change 

**Story 15:** As a User I need to be able to delete a Project which I have created by Id. 

**Story 16:** As a User I need to be able to edit a Project which I have created by Id by providing the following information: 
Title 
Description 
Date of creation and Id of the creator remain unchanged 
Date of last change and Id of the user that did the last change are updated automatically 

**Story 17:** As a User I need to be able to assign Teams to Projects that I own. 


**Task Management**

**Story 18:** As a User I need to be able to access the Tasks Management View where I can access all Tasks from a single Project that is either created by me or is assigned to a Team that I’m a member of. 

**Story 19:** As a User in the Tasks Management View I should be able to create, edit and delete Tasks in the Projects that I have created. 

**Story 20:** As a User I need to be able to create a Task in a Project that I have created, and persist the following information: 
Id 
Id of the Project (the Id of the Project that the Task belongs to) 
Id of the Assignee (the Id of the User that this Task has been assigned to) 
Title 
Description 
Status (pending/inProgress/completed) 
Date of creation 
Id of the creator 
Date of last change 
Id of the user that did the last change 

**Story 21:** As a User I need to be able to delete a Task by Id in the Projects that I have created. 

**Story 22:** As a User I need to be able to edit a Task by Id, in the Projects that I have created, by providing the following information: 
Id of the Assignee (the Id of the User that this Task has been assigned to) 
Title 
Description 
Status (pending/inProgress/completed) 
Date of creation and Id of the creator remain unchanged 
Date of last change and Id of the user that did the last change are updated automatically 

**Story 23:** As a User I need to be able to open the Task Details View for a given Task by providing its Id. 
**Story 24:** As a User I need to be able to access the Task Details View where I can log work to a Task, change its assignee or change its status. 

**Work Log Management**

**Story 25:** As a User I need to be able to access the Task Details View where I can access all Work Logs for this Task. 

**Story 26:** As a User in the Task Details View, I should be able to create Work Logs and edit and delete only Work Logs that I have created. 

**Story 27:** As a User I need to be able to change the status of a Task by Id through a fast access menu in the Task Management View. 

**Story 28:** As a User I need to be able to change the assignee of a Task by Id through a fast access menu in the Task Management View. 

**Story 29:** As a User I need to be able to create a Work Log in a Task that is assigned to me, and persist the following information: 

Id 
Id of the Task (the Id of the Task that we’re logging work for) 
Id of the User (the Id of the User that is logging work) 
Time (the number of hours spent working on the Task for that day), 
Date (the date when the time was spent on the Task) 

**Story 30:** As a User I need to be able to delete a Work Log that I have created, by its Id. 

**Story 31:** As a User I need to be able to edit a Work Log that I have created, by its Id, by providing the following information: 
Id of the Task (the Id of the Task that we’re logging work for) 
Id of the User (the Id of the User that is logging work) 
Time (the number of hours spent working on the Task for that day), 
Date (the date when the time was spent on the Task) 


### 2.2. Extra Credit
No extra credit is preserved.


## 3. Assignment Grading
In all the assignments, writing quality code that builds without warnings or errors, and then testing the resulting application and iterating until it functions properly is the goal.Here are the most common reasons assignments receive low points:•Project does not build.
- One or more items in the Required functionalities section was not satisfied.
- A fundamental concept was not understood.
- Project does not build without warnings.
- Code Quality -Your solution is difficult (or impossible) for someone reading the code to understand due to: 
	- Code is visually sloppy and hard to read (e.g. indentation is not consistent, etc.).
	- No meaningful variable, method and class namesoNot following Java code styleguidesoOver/under used methods, classes, variables, data structures or code comments.
    - Assignment is not submitted as per Assignment Submission section below.


## 4. Assignment Submission

You already have access to your personal ScaleFocus Academy repos in GitLab. Every Assignment is submitted in a separate folderin that repo, on your masterbranch. Every folder is named by the assignment name and number -ex: Final Exam.

Here is a sample structure of how your masterbranch of your repo should look like towards the end of your SFA training:
```
.
├── Assignment 1
├── Assignment 2  
├── Assignment 3
├── Assignment 4
├── Midterm 1
├── Assignment 5
├── Midterm 2
├── Assignemtn 6
├──  └── Workforce-management
├──          └── src
├──              └── academy.sclaefocus.views
├──                  └── AdministrationView.java
...
```
Assignments that have not been submitted to the masterbranch or have incorrect folder structure will not be graded.

<small>How to use Git to submit your assignments for review?<small>

> ⚠️ Make sure you have read the GitLab Reading Materials first, available here.

Let's imagine that the first required task from your assignment is to create a Login View in your project:

1. Make sure you have the latest version of your code;

2. Open a bash terminal (CMD for Windows) in your Assignment folder or navigate there with cd Assignmnet-1/

3. Create a new branch for the feature you're developing git checkout -b loginView, where loginViewis the name of your new branch.

4. Now you need to add all the file you have changed. You can use git add .when you want to add all files in the current folder. Or use git add file.txtyou can define specific files you want to push to yor remote repo.

5. Your next step is to commit the changes you have made. You need to use git commit -m "add README"where the message must be meaningful and is describe the exact reason for change;

6. The last step you need to perform is to push your changes to the remote repo by git push -u origin loginView. Pay close attention that master is your main branch and you are not commiting to it directly. Pushes are done ONLY against feature branches(branches other than master)!

7. Create a Merge Request and assign your Tutor to it -Open GitLab and navigate to Merge Requests> Create new Merge Requestand select your feature branch loginViewas source and masteras target/destination.

8. Your Tutor/Mentor will now review your code. If you have merge request comments, you will need to resolve them before proceeding: 
		
  * Up vote or write something under the comment, acknowledging that you agree with the comment. If there is something you don't understand, now is your time to discuss it by writing under this comment.
  * If everything is clear with the comment, go back to your source code. Make sure you're on your branch, by calling git checkout loginView
  * Do work here that resolves comments
  * Commit as usual(check above).
  * The merge request will be updated with the new code, so your Tutor/Mentor will see your new changes. If there are additional Merge Request comments repeat step 
	
9. When done with all changes you will be allowed to merge your branch with the master branch. Do not forget to mark the branch to be deleted after the merge. Keep in mind that all versions of your code are kept in git and you don't need the branches in your repo.
