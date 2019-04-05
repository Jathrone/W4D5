require "bcrypt" #? ask TA after
class User < ApplicationRecord
    attr_reader :password


    validates :username, :session_token, :password_digest, presence: true
    validates :username, :session_token, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true}

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    has_many :goals,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Goal

    has_many :cheers,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Cheer
end
