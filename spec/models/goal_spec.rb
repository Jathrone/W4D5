require 'rails_helper'

RSpec.describe Goal, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:visibility) }
    it { should validate_presence_of(:is_finished) }
    it { should validate_presence_of(:user_id) }
  end

  describe "associations" do
    it { should have_many(:cheers) }
    it { should belong_to(:user) }
  end
end
