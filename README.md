# README


## To change:

```
ENV['FB_APP_ID'] - your facebook app id.
ENV['FOG_DIRECTORY'] - your bucket in amazon S3.
ENV['FOG_PROVIDER'] - insert AWS
ENV['AWS_ACCESS_KEY_ID'] - your amazon aws access key id.
ENV['AWS_SECRET_ACCESS_KEY'] - your amazon aws secret access key.
ENV['HOST_NAME'] - host name (http://example.com/)
ENV['WEB_CONCURRENCY'] - numer of workers in unicorn
ENV['SECRET_TOKEN'] - your secret key
ENV['DEVISE_SECRET_KEY'] - your devise sercet key
```

## How to create admin?
  
```
ENV['ADMIN_EMAIL'] - your admin email
ENV['ADMIN_PASSWD'] - your admin password
rake db:add_admin
```

## Demo:

http://empatia.herokuapp.com/

## Start?

### Installation

```
git clone https://github.com/rayros/empatia.git
cd empatia
bundle --without production
```
### Development usage

Migrate.

```
rake db:migrate
```

Create admin user. (login and password in `.env` file)

```
rake db:add_admin
```


Run localhost server.

```
rails s
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
