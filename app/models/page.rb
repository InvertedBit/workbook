class Page < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	validates :text, :presence => true
	validates :sorting, :numericality => true
	belongs_to :type
end
