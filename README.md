# whaletunes

Whaletunes is the app to go with the remote hydrophone system being built as a capstone project at BCIT.

Flutter was chosen for this project as it is able to compile to many platforms without needing to write more code.

The app will play audio that is stored on an AWS S3 storage bucket. The app will list out all available whale noises that are stored and allow any user to click on and hear the captured sounds. 

Currently the app is able to play audio given a static URL. Next steps are to have the app properly fetch the information from AWS.
