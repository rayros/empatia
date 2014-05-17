README
======

TO CHANGE:
---------
  
  * ENV['FB_APP_ID'] - your facebook app id.
  * ENV['S3_BUCKET_NAME'] - your bucket in amazon S3.
  * ENV['AWS_ACCESS_KEY_ID'] - your amazon aws access key id.
  * ENV['AWS_SECRET_ACCESS_KEY'] - your amazon aws secret access key.
  * ENV['HOST_NAME'] - host name (http://example.com/)

HOW TO CREATE ADMIN?
----------------
  
  1. ENV['ADMIN_EMAIL'] - your admin email
  2. ENV['ADMIN_PASSWD'] - your admin password
  3. rake db:add_admin

DEMO:
-----

http://empatia.herokuapp.com/
