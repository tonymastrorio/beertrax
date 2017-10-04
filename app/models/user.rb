class User < ActiveRecord::Base
    validates_presence_of :email, :password, :username
    validates_uniqueness_of :username
    has_many :beers

    has_secure_password
end
