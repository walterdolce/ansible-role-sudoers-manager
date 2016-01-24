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
Given(/^a user "([^"]*)" exists within the system$/) do |user|
    expect(user_exists(user)).to eq(true)
end

When(/^I provision the server$/) do
    # Placeholder step
end

Then(/^a sudoers profile will be set for the user "([^"]*)"$/) do |sudoers_profile|
    expect(
        File.exists? "/etc/sudoers.d/#{sudoers_profile}"
    ).to be(true)
end

def user_exists(user)
    `cat /etc/passwd | cut -d: -f1`.split("\n").include? user
end
