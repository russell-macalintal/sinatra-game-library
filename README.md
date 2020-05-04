# SINATRA GAME LIBRARY

This is a Sinatra Web Application that keeps track of User's Games and Consoles Libraries. Once a user has signed up, they have the ability to add games and consoles that other users have created and added to the database or create their own items to be included into their lists. All newly created items will be saved into an ActiveRecord database and will be made available to any logged in user.

Users only have permissions to add or remove items from their own lists and to create new objects to be added to the database. To avoid unauthorized manipulations of game and console details, which could impact the lists of other users, permissions to edit and delete specific game and console objects are restricted only to the ADMIN user.

## Installation

- Clone the repository
- Run 'bundle install' to install all required dependencies
- Run 'rake db:drop' and then 'rake db:migrate' to obtain a clean database
- (Optional) Run 'rake db:seed' to provide seed data for the program
- Run 'shotgun' or 'rackup config.ru' in the terminal
- Signup as a user and enjoy the app

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/russell-macalintal/sinatra-game-library. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sinatra Game Library project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the CODE OF CONDUCT.
