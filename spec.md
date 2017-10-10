# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    Built an app using the Sinatra gem
- [x] Use ActiveRecord for storing information in a database
    Used the ActiveRecord gem to help create the associations between my models and my database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
    User, Beer, Brewery
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
    Brewery has many beers
    User has many beers
    User has many breweries, through beers.
- [x] Include user accounts
    Included signup and login/logout functionality, authentication, etc.
- [x] Ensure that users can't modify content created by other users
    Only allowed users who created a new beer to edit/delete that beer.
- [x] Include user input validations
    Used flash messages to provide errors to users as well as some HTML form validation.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
    Used flash messages to display errors if user doesn't enter required information on signup, tries a username that has already been taken, or enters an incorrect password.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    Created README.md

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
    
