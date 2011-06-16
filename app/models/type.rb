class Type < ActiveRecord::Base
	validates :name, :presence => true
	has_one :page
end
