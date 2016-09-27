User Creation Feature Test and Automated Script for Populating Users in QA Database

  This project tests the functionality of logging on to the RBM Merchandising Cloud
  website, navigating to the new user page and creating one or several new users.  
  The test can also be used as an automated script for populating the QA Database
  with new users.

Getting Started

  Pull down the repo from github.com/mobremski/rbm_qa_create_users.
  Open the directory in your terminal and your preferred text editor.
  Install cucumber with `gem install cucumber` from that directory.
  Run `bundle install`.

Running the Test

  Populate the first line of the file `admin_data.csv` with the credentials of
    an RBM Admin.
  Populate the file `user_data.csv` with the user data you would like to add
    to the database.
  In the terminal, from the root directory, run `bundle exec cucumber`.
  Tests should all pass and when you search for the newly created users they
    should exist.

Built With

  Cucumber
  Rspec
  Capybara
  Capybara-webkit
  Atom

Version

  1.0.0

Authors

  Michael Obremski

License

  RBM Technologies
