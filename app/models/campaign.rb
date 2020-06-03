class Campaign < ActiveRecord::Base
    belongs_to :organizer, :class_name => "User"
    has_many :donations
    has_many :donors, through: :donations, source: :donor
end