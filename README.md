TABTeamViewer Test Application

Shows the team members of The App Business

DEVICE FAMILY: iPhone
OPERATING SYSTEMS SUPPORTED : iOS 7+


THINGS TO NOTE:

- Total Dev time spent: 5hrs  (2.5 hrs html, 2.5hrs iOS)

Following features were not completed due to time constraints..

- App does not have any persistence storage as it should. 
  It should store the team member details so it does not read website each time app is opened. 
  A call to the website to check how many profiles available to read would determine if a full profile pull was necessary.
  
- Downloading the images in the background uses third party code and not my own (SDWebImage)
  It should be using new iOS7 NSURLSession and NSDownloadTasks.
  