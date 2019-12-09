# Rapt - An app dedicated for better managing your time


## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [How to Use](#how-to-use)
* [App Screenshots](#app-screenshots)
* [More to come](#more-to-come)


## General info
This is a self-motivating app that can help you set up a timer for a task, organize daily task.


## Technologies
* Languages: Python, Swift, HTML, CSS, JavaScript
* Framework: Flask
* File management: Docker



## How to use
* Timer: add timer by the upper right "plus" button; delete timer by clicking "Edit" at upper left, click on any Timer card want to delete, and finish editing by clicking "done".
* To-Do: add To-Do item into the text box at the bottom of the view; delete the item by swiping to the left.
* Setting: sign-up by clicking the sign-up cell; login by the login cell

## app features
![timer](https://github.com/yvesli/RAPT/blob/version_one/timerView.png)
![sign up](https://github.com/yvesli/RAPT/blob/version_one/signup.png)
![to do list](https://github.com/yvesli/RAPT/blob/version_one/todo_list.png)

### Web API components
* [List of API addresses](#api-address_list)
* [Authentification](#api-authentication)


## More to come
* Data uploading and cloud storage
* Data categorizing
* Download to local devices and analysis

---
#### API Address List
* `/api/signup`, Method `GET`
* `/api/login`, Method `POST, GET`
* `/api/logout`, Method `GET`
* `/api/`, Method `GET`, index route used for testing
* `/api/profile`, Method `GET`, can access after logged in

#### API Authentication
In order to use our web services, user has to login first to sync history from
and to the cloud.

##### Sign up
Requests to sign up should be post to `http://35.237.54.112/api/signup` in
`JSON` format containing information about `username`, `password` and `email`.
##### Login
After signing up as a user, you can make requests to `http://35.237.54.112/api/login` in `JSON`
with previously created `email`, `password` and `remember(boolean)`. One login session would be
remembered for half an hour and you are required to login again when the session
expires.
##### Logout
User can easily logout by filing a get request to `http://35.237.54.112/api/logout`
