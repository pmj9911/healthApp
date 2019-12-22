# healthapp

A new Flutter project.

## Getting Started
1. clone the master branch into any folder.
clone the django branch in the same folder.
2.OPTIONAL:    ngrok would have to be setup in the system. Steps: https://ngrok.com/download in step 4 ,enter the command : ngrok http 8000
in the resulting screen, copy the last url (eg: forwarding   https://123455.ngrok.io ->  "other link here" ) copy the first one .
in the flutter project, update the url in the files : 

doing step 2 is optional since server side rendering is not used in the current version due to REST api issues.

3. ensure flutter is there in the system steps: https://flutter.dev/docs/get-started/install/windows run all steps till the command " flutter doctor " does not give any warnings and errors.
enable developer options in your mobile device and go to usb debugging option. start usb debugging.
if running "flutter devices " on your terminal gives your device name as output then the android phone is ready.
run the command "flutter run" and wait for the app to build.

4. the logic for the app is stored in the django project. we created a REST api system, as can be seen in healthapp/views.py 
