class User < ActiveRecord::Base
    has_secure_password
    
    validates :username, :email, :password, :firstname, :lastname, presence: true
    validates_uniqueness_of :username, :email, :case_sensitive => false
    validates_length_of :username, minimum: 3
    validates_length_of :password, in: 5..20

    has_many :organized_campaigns, :class_name => "Campaign", foreign_key: "organizer_id"
    has_many :donations, foreign_key: "donor_id"
    has_many :donated_campaigns, through: :donations, source: :campaign


end