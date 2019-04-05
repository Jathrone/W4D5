require "rails_helper"


RSpec.describe User do 
    #validations
    describe 'validations' do
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:password_digest) }
        it { should validate_presence_of(:session_token) }
        it { should validate_length_of(:password).is_at_least(6) }
        # it { should validate_uniqueness_of(:username) }
        # it { should validate_uniqueness_of(:session_token) }
    end
    #associations
    describe 'associations' do 
        it { should have_many :goals }
        it { should have_many :cheers }
    end

        #method

    # it "should have find_by_credentials"
end