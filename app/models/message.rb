class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :content, presence: true

  def self.user_messages(sender, receiver)
    where(sender: sender, receiver: receiver)
    .or(where(sender: receiver, receiver: sender))
    .order(:created_at)
  end
end
