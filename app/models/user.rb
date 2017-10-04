class User < ActiveRecord::Base
    validates_presence_of :email, :password, :username
    validates_uniqueness_of :username
    has_many :user_beers
    has_many :beers, through: :user_beers
    has_many :breweries, through: :beers

    has_secure_password
end
