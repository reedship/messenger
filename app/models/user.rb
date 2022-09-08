class User < ApplicationRecord
  validate :name

  has_many :conversations, :foreign_key => :sender_id

end
