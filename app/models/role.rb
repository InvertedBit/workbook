class Role < ActiveRecord::Base
  has_and_belongs_to_many :user
  def include?(role)
    user.role.each do |r|
      if role == r.name
        true
      end
    end
  end
end
