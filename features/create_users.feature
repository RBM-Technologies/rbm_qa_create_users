
Feature: Create users from CSV file
  As an RBM Admin
  I can create new users
  So that I can quickly authorize the necessary people

Background:
  Given I am logged in as an admin

Scenario:
  Given I have a CSV file of user data
  When I go to the new user form page
  And I fill in the new user form
  And I go to the users page
  Then those users should exist
