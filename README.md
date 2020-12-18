## BBQ

An application to invite friends to events
You can create events, subscribe to events, write comments, add photos.

    Ruby version 2.6.3
    Rails version 5.2.3
   

* Authentication with gem pundit
* Uploading photo with gems carrierwave, rmagick. 
* Lightbox js gallery gem
* Subscribers receive emails with the help of sendgrid api
* Event locations are displayed on Yandex maps
* AWS with bucket S3 is used for image storing
    
**Before running**

`bundle install`

`bundle exec rake db:migrate`

**For production environment**

You need set up environment variables

Amazon S3 Storage:

* S3_BUCKET_REGION
* S3_ACCESS_KEY
* S3_SECRET_KEY
* S3_BUCKET_NAME

SendGrid:

* SENDGRID_USERNAME
* SENDGRID_PASSWORD
