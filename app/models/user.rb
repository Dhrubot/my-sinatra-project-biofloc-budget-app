class User < ActiveRecord::Base
    has_secure_password

    has_many :organized_campaigns, :class_name => "Campaign", foreign_key: "organizer_id"
    has_many :donations, foreign_key: "donor_id"
    has_many :donated_campaigns, through: :donations, source: :campaign
end