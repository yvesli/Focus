# Rapt - An app dedicated for better managing your time


## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [How to Use](#how-to-use)
* [More to come](#more-to-come)


## General info
This is a self-motivating app that can help you set up a timer for a task, organize daily task.


## Technologies
* Languages: Python, Swift, HTML, CSS, JavaScript
* Framework: Flask
* File management: Docker


## How to use
* TImer: 
** add timer by the upper left "plus" button
### Web API components
* [Authentification](#api-authentication)


## More to come
* Data uploading and cloud storage
* Data categorizing
* Download to local devices and analysis

---
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
