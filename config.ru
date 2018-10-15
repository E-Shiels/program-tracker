require './config/environment'

use Rack::MethodOverride
use ProgramsController
use UsersController
run ApplicationController
