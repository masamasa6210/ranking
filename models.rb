require 'bundler/setup'

Bundler.require
ActiveRecord::Base.establish_connection("sqlite3:db/development.db")

class User < ActiveRecord::Base
    
end