class Ripple < ApplicationRecord
  validates :name, :message, presence: true
  
  before_update :stop_update_delete
  before_destroy :stop_update_delete

  # stops the deletion or update of any ripples
  def stop_update_delete
    if true
      throw(:abort)
    end
  end
end
