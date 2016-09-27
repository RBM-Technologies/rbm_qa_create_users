
Feature: Create users from CSV file
  As an RBM Admin
  I can create new users
  So that I can quickly authorize the necessary people

Scenario:
  Given I have a CSV file of user data
  And I have a CSV of RBM Admin credentials
  And I am logged in as an admin
  When I go to the new user form page
  And I fill in the new user form
  And I go to the users page
  Then those users should exist
