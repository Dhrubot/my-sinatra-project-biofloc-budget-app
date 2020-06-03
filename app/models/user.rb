class User < ActiveRecord::Base
    has_many :organized_campaigns, :class_name => "Campaign", foreign_key: "organizer_id"
    has_many :donations
end