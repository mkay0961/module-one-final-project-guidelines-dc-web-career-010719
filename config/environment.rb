# require 'bundler'
# Bundler.require
#
# ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
# require_all 'lib'

require "bundler/setup"
require "sinatra/activerecord"
require 'require_all'
require 'colorize'
require 'launchy'
require 'net/http'
require 'open-uri'
require 'json'
require 'pry'
require 'tty-font'
require 'tty-prompt'
require "table_print"
require 'terminal-table'

require_rel "../app/UI"

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)

ActiveRecord::Base.logger = nil
