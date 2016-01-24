#
#   Copyright 2016 Walter Dolce
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
Feature: Sudoers profiles
  In order to easily and securely manage system users on a server
  As a sysadmin
  I want to provide and manage sudoers profiles for system users

  Scenario: A sudoers profile is set for an existing user
    Given a user "john" exists within the system
    When I provision the server
    Then a sudoers profile will be set for the user "john"

  Scenario: A sudoers profile is set for multiple existing users
    Given a user "john" exists within the system
    And a user "alan" exists within the system
    When I provision the server
    Then a sudoers profile will be set for the user "john"
    And a sudoers profile will be set for the user "alan"
