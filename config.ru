require_relative './config/environment'
if ActiveRecord::Base.connection.migration_context.needs_migration?
    raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
  end
  
require_relative './app/controllers/application_controller'
require_relative './app/controllers/puppies_controller'

use PuppiesController 
run ApplicationController
