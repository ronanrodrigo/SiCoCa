# Load the rails application
require File.expand_path('../application', __FILE__)


# Initialize the rails application
Sicoca::Application.initialize!
#config.i18n.default_locale = "pt-BR"
#config.gem "brazilian-rails"
require "will_paginate"