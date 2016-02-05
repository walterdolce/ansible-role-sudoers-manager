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
def travis?
    ENV['TRAVIS'] == 'true'
end

desc 'Run Test Kitchen integration tests'
namespace :integration do

    desc 'Run integration tests with kitchen-docker'
    task :docker do
        require 'kitchen'
        Kitchen.logger = Kitchen.default_file_logger(:debug)
        @loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.docker.yml')
        Kitchen::Config.new(loader: @loader).instances.each do |instance|
            instance.test(:always)
        end
    end

    desc 'Run all tests'
    task :test => [:acceptance]

    desc 'Run integration tests with default kitchen provider'
    task :acceptance do
        sh "bundle exec kitchen verify #{ENV['INSTANCE']} -l debug"
    end

    desc 'Creates kitchen instances'
    task :create do
        sh "bundle exec kitchen create #{ENV['INSTANCE']} -l debug"
    end

    desc 'Converges kitchen instances'
    task :converge do
        sh "bundle exec kitchen converge #{ENV['INSTANCE']} -l debug"
    end

    desc 'Default task'
    task :default => [:test]
end


desc 'Run Test Kitchen integration tests'
task integration: travis? ? %w(integration:docker) : %w(integration:default)
