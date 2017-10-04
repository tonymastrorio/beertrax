class Beer < ActiveRecord::Base
    has_many :user_beers
    has_many :users, through: :user_beers
    belongs_to :brewery
end
