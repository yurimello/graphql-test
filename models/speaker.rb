class Speaker < ActiveRecord::Base
  validates :name, presence: true
  has_many :sounds
end
