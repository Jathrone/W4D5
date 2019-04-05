class Goal < ApplicationRecord
    validates :title, :visibility, :is_finished, :user_id, presence: true

    has_many :cheers,
        primary_key: :id,
        foreign_key: :goal_id,
        class_name: :Cheer

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end
