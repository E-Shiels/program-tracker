require './config/environment'

use Rack::MethodOverride
use ProgramsController
use UsersController
use CategoriesController
run ApplicationController
