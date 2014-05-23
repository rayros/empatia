# README


## TO CHANGE:
  
  * ENV['FB_APP_ID'] - your facebook app id.
  * ENV['FOG_DIRECTORY'] - your bucket in amazon S3.
  * ENV['FOG_PROVIDER'] - insert AWS
  * ENV['AWS_ACCESS_KEY_ID'] - your amazon aws access key id.
  * ENV['AWS_SECRET_ACCESS_KEY'] - your amazon aws secret access key.
  * ENV['HOST_NAME'] - host name (http://example.com/)
  * ENV['WEB_CONCURRENCY'] - numer of workers in unicorn
  * ENV['SECRET_TOKEN'] - your secret key
  * ENV['DEVISE_SECRET_KEY'] - your devise sercet key


## HOW TO CREATE ADMIN?
  
  1. ENV['ADMIN_EMAIL'] - your admin email
  2. ENV['ADMIN_PASSWD'] - your admin password
  3. rake db:add_admin

## DEMO:

http://empatia.herokuapp.com/

## Start?

### Installation

```
git clone https://github.com/rayros/kwejk.git
cd kwejk
bundle
```

### Development usage

Create file `.env`

``` touch .env ```

Add to `.env` develop vars

```
SECRET_TOKEN=
DEVISE_SECRET_KEY=
ADMIN_EMAIL=
ADMIN_PASSWD=
```

Migrate.

```
foreman run rake db:migrate
```

Create admin user.

```
foreman run rake db:add_admin
```


Run localhost server.

```
foreman start -f Procfile.dev
```

Open website.

```
127.0.0.1:3000
```

Go to admin panel.

```
127.0.0.1:3000/users
```

### Run on heroku server

```
git push heroku master
```
