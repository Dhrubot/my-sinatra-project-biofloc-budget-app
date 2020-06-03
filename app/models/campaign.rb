class Campaign < ActiveRecord::Base
    belongs_to :organizer, :class_name => "User"
    has_many :donations
end