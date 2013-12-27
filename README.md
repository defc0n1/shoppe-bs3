This is a template for the [Shoppe](http://github.com/tryshoppe/core) engine (Rails 4) built on the Bootstrap 3 framework. Still **very early stages** but provides the basis for future dev.

## See it in action
http://shoppe-bs3.herokuapp.com

The Bootstrap frontend framework was used to provide a base template that fits in with our own development. The template closely mimics Adam Cooke's excellent example-store template.

This is a Rails application which has been built using
[Shoppe](http://github.com/tryshoppe/core) developed by Adam Cooke (aTechMedia). It features a lovely design to fully demonstrate the functionality provided by the Shoppe platform and how well it works
with a Rails application.

![Example UI](http://s.adamcooke.io/OlRNo.png)

## Getting Started

To get started using the example store provided here is simple. Just follow the instructions
below and you'll be up and running in minutes with a demo store with demo data.

```
$ git clone git://github.com/oceanshq/shoppe-bs3.git
$ cd shoppe-bs3

$ cp config/database.example.yml config/database.yml
# -> Add the appropriate database configuration to database.yml

$ bundle
$ rake db:schema:load shoppe:setup shoppe:seed
$ rails server
```

A few notes about this demo store:

* The store does not currently implement any payment integration. It will ask
  for card details during checkout but these will not be checked (or submitted).

* The original design (https://github.com/tryshoppe/example-store) is copyright Niftyware Limited, hence one of the primary reasons for creating the Bootstrap 3 version. Feel free to fork and amend as you see fit.

* Once up and running, you can access the Shoppe interface at `/shoppe` and use 
  **admin@example.com** and **password** to login.
