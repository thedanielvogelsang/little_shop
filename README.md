# little_shop

heroku-app link: https://radiant-scrubland-30391.herokuapp.com

# Name of the project
> Additional information or tagline

A brief description of your project, what it is used for and how does life get
awesome when someone starts to use it.

##NAME### is a pilot program exampling CRUD functionality from a fictional business "##NAME##", based on the real-world "Coursera". The app employs ActiveRecord, Ruby-on-Rails, and uses the MVC model as well as a postgres database. Users, with a default role of registered member upon account creation, may use the site to add desired courses to their cart, and may place their own 'orders' via our checkout-cart system. Unregistered users may add courses to cart, however cannot place an order until officially registered by creating an account. Logged in users may access their own user/dashboard, while admin users may access an admin/dashboard that allows the admin_user to view all orders to date, along with links to individual order pages. Admins may also add, delete, edit, and change the status of courses on the app. Only admins can edit their own user information.

## Installing / Getting started

A quick introduction of the minimal setup you need to get a hello world up &
running.

```shell
gem install bundle
bundle install
rake db:create
rake db:migrate
rake db:seed #prints seed file as users, courses, orders, etc are created.
```

after installing bundle and downloading the necessary gems, create the database, migrate the table migrations, and seed the database for functional use. Fire up the server and it should be ready to launch!

## Developing

Here's a brief intro about what a developer must do in order to start developing
the project further:

```shell
git clone git@github.com:thedanielvogelsang/little_shop.git
 (or)
git clone https://github.com/thedanielvogelsang/little_shop
cd little_shop
gem install bundle
bundle install
rake db:create
```

after cloning the repository, cd into little_shop directory and feel free to look around. As a postgres database, this app requires, after bundling, that the developer create the database. Therafter, return to the ##Installing section to review further steps.

### Building

If your project needs some additional steps for the developer to build the
project after some code changes, state them here:

```shell
./configure
make
make install
```

Here again you should state what actually happens when the code above gets
executed.

### Deploying / Publishing

In case there's some step you have to take that publishes this project to a
server, this is the right time to state it.

```shell
packagemanager deploy awesome-project -s server.com -u username -p password
```

And again you'd need to tell what the previous code actually does.

## Features

What's all the bells and whistles this project can perform?
* Users can checkout courses and place orders from their cart.
* Admins can checkout can also add, delete, and edit courses, as well as change course status.
* Admins also can visit an order index and review past orders.

## Configuration

Here you should write what are all of the configurations a user can enter when
using the project.

#### Argument 1
Type: `String`  
Default: `'default value'`

State what an argument does and how you can use it. If needed, you can provide
an example below.

Example:
```bash
awesome-project "Some other value"  # Prints "You're nailing this readme!"
```

#### Argument 2
Type: `Number|Boolean`  
Default: 100

Copy-paste as many of these as you need.

## Contributing

When you publish something open source, one of the greatest motivations is that
anyone can just jump in and start contributing to your project.

These paragraphs are meant to welcome those kind souls to feel that they are
needed. You should state something like:

"If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome."

If there's anything else the developer needs to know (e.g. the code style
guide), you should link it here. If there's a lot of things to take into
consideration, it is common to separate this section to its own file called
`CONTRIBUTING.md` (or similar). If so, you should say that it exists here.

## Licensing

One really important part: Give your project a proper license. Here you should
state what the license is and how to find the text version of the license.
Something like:

"The code in this project is licensed under MIT license."
