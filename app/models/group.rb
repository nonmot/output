class Group < ApplicationRecord
    has_many :group_users, dependent: :destroy
    has_many :users, through: :group_users
    has_many :messages, dependent: :destroy
    has_one :book
    accepts_nested_attributes_for :group_users

    validates :title, presence: true
    validates :user_id, presence: true
end