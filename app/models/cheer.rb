class Cheer < ApplicationRecord
    validates :user_id, :goal_id, presence: true

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :goal
end
