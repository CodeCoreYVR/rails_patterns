class Barter < ActiveRecord::Base
  belongs_to :barter
  has_many :responses, class_name: 'Barter'

  validates :email, presence: true

  def is_a_response?
    barter_id.present?
  end

end
