class Citizen < ApplicationRecord
  has_one :address


  def active?
    @active ||= status == "active"
  end
end
