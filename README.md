# Malcom

A library for sending push notifications through Malcom API from a Rails application.

## Installation

Add this line to your application's Gemfile:

    gem 'malcom-rails3', :git => 'https://github.com/mymalcom/malcom-rails3.git'

And then execute:

    $ bundle

## Usage

Create a malcom.yml configuration file with the same structure as database.yml and the following parameters:

* URI, user and password of the API
* UUID of the app

Example:

    development:
      uri: http://api.mymalcom.com:80/v3/notification/push
      user: devuser
      password: changeme
      uuid: bfcf9xx5-4d97-ead0-bOd3-818e76O82bdi

    production:
      uri: http://api.mymalcom.com:80/v3/notification/push
      user: prouser
      password: ultrasecret
      uuid: 18e79xx5-ead0-4d97-bOd3-bfcf86O82bdi

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
