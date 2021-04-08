1. use bundler to create the skeleton of the cli application
  bundle gem stock-recommender

2. added notes re the project to the README

3. added the stock-recommender to the bin folder

4. set up the executable file. in bin, added "stock-recommender". included shebang #!/usr/bin/env ruby to ensure that the file uses ruby  
- added executable function using chmod
- cd bin/
- ls -lah
  * -rw-r--r--   1 ragahi  staff    41B Apr  7 19:32 stock-recommender
- chmod +x stock-recommender
  * this adds the executable function to this file.
  * -rwxr-xr-x   1 ragahi  staff    41B Apr  7 19:32 stock-recommender
  --> allows the computer permissions to execute the file through the ruby interpreter on my behalf.

5. in the executable file added a reference to call a new instance of the cli class.
* need to require the cli class file in the executable file.

### to run the app, be in the stock-recommender, run "./bin/stock-recommender"
