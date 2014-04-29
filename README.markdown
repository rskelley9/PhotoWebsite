# About this App

This application is a photography website built with [Grokphoto.com](http://grokphoto.org/) and the [Devise](https://github.com/plataformatec/devise/tree/v3.2) engine. The user interface is designed with a customized Rails template.

## GrokPhoto

GrokPhoto is a professional photographer's client providing a CMS, and gallery solutions. Visit [Grokphoto.com](http://grokphoto.org/) for more information.

## Devise

Devise is a flexible authentication solution for Rails based on Warden. It is a Rack-based, complete MVC solution that employs a Rails engine. Devise allows you to have multiple models signed in at the same time and is focused on modularity.

For more information on Devise and documentation, visit the [Devise Wiki](https://github.com/plataformatec/devise/wiki).

## Software Requirements and Dependencies

* Rails 3.2+
* ImageMagick
* SQLite3 or MySQL or PostgreSQL

## Getting Started

Initialize the database by running the following commands in your terminal:

    rake db:create
    rake db:migrate
    rake db:seed

## Initial Configuration

1. Start your server: rails s
2. Login to the admin panel (/admin) using email: grok@grokphoto.org and password: password
3. Click on the Settings tab and enter your own information.


## Heroku Deployment

    heroku create --stack cedar
    git push heroku master

Before you seed the database you'll need to setup an amazon s3 account and bucket to have somewhere to store the files. Heroku has a temporary filesystem which is not an appropriate place to store images.

* Go to: https://console.aws.amazon.com/s3/home
* Create a bucket
* Go to: https://aws-portal.amazon.com/gp/aws/developer/account/index.html
* Click on the Security Credentials in the left nav, then the Access Credentials in the body.
* Copy your S3 key and your S3 secret key

Use your S3 information to fill in the config vars for heroku, then seed the database.

    heroku config:add S3_KEY=change_to_your_amazon_s3_key S3_SECRET=change_to_your_amazon_s3_secret S3_BUCKET=change_to_your_amazon_s3_bucket

You still need to specify a secret token and session store key:

    rake secret
    heroku config:add SESSION_KEY=_usually_your_app_name SECRET_TOKEN=_result_of_rake_secret

To specify the email address to use when the system sends emails:

    heroku config:add SENDER_EMAIL=_your_email_address

To specify the email host to use when the system sends emails:

    heroku config:add EMAIL_HOST=yourdomain.com

To specify an environment specific pepper to use when encrypting passwords:

    rake secret
    heroku config:add DEVISE_PEPPER=_result_of_rake_secret

You can check to make sure all of your heroku environment variables have been properly by listing them:

    heroko config

Once done, migrate and seed the database and launch the app.

    heroku run rake db:migrate
    heroku run rake db:seed

Make sure you also enable memcached on heroku with the below command.

	heroku addons:add memcache:5mb

Open up your shiny new GrokPhoto instance!

    heroku open

Don't forget to change your admin password using the "Forgot my password" feature.



## Tests

To run the tests:

    rspec spec


## Credits and Citations

Grokphoto application and Heroku deployment documentation by [GrokPhoto](https://github.com/rapind/grokphoto).

Sample photos were provided by and are copyright of Jaime Coyle Photography [http://jaimecoyle.com](http://jaimecoyle.com)
