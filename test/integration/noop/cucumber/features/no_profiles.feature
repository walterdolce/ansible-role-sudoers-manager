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
Feature: No sudoers profiles
  In order to easily and securely manage system users on a server
  As a sysadmin
  I want to provide and manage sudoers profiles for system users

  Scenario: Sudoers profile don't get set when role vars are missing
    Given a user "john" exists within the system
    But the "profile_dir" parameter is not set in the role's config
    And a user "alan" exists within the system
    But the "template_path" parameter is not set in the role's config
    And a user "ben" exists within the system
    But the "profile_name" parameter is not set in the role's config
    When I provision the server
    Then a sudoers profile will not be set for the user "john"
    And a sudoers profile will not be set for the user "alan"
    And a sudoers profile will not be set for the user "ben"
