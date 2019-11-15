# Rapt - An app dedicated for better managing your time


## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [How to Use](#how-to-use)
* [More to come](#more-to-come)


## General info
This is a self-motivating app that can help restrain usage of your smartphone.


## Technologies
* Languages: Python, Swift, HTML, CSS, JavaScript
* Framework: Flask
* File management: Docker


## How to use
To use api services via api requests, it has several essential components
### Web API components
* [Authentification](#api-authentification)


## More to come
* Data uploading and cloud storage
* Data categorizing
* Download to local devices and analysis

---
#### API Authentification
In order to use our web services, user has to login first to sync history from
and to the cloud.

##### Sign up
Requests to sign up should be post to 'domain/api/signup' in
JSON format containing information about 'username', 'password' and 'email'.
##### Login
After signing up as a user, you can make requests to 'domain/api/login' in JSON
with previously created 'email' and 'password'. One login session would be
remembered for half an hour and you are required to login again when the session
expires.
