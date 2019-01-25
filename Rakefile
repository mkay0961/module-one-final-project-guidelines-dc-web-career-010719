require_relative 'config/environment.rb'
require "sinatra/activerecord/rake"

namespace :db do

  desc "Migrate the db"
  task :migrate do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate("db/migrate/")
  end

  desc "drop and recreate the db"
  task :reset => [:drop, :migrate]

  desc "drop the db"
  task :drop do
    connection_details = YAML::load(File.open('config/database.yml'))
    File.delete(connection_details.fetch('database')) if File.exist?(connection_details.fetch('database'))
  end

  desc "start console"
  task :console do
    Pry.start
  end

  desc "INFO"
  task :start do
    puts "enter 'rake db:seed1'"
  end

  desc "destroy database"
  task :destory_database do
    system "ruby db/destroy.rb"
  end

  desc "seed1"
  task :seed1 do
    system "ruby db/seed1.rb"
  end
  desc "seed2"
  task :seed2 do
    system "ruby db/seed2.rb"
  end
  desc "seed3"
  task :seed3 do
    system "ruby db/seed3.rb"
  end
end
