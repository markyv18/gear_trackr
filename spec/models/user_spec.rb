require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }
  let(:gear) { build(:gear) }

  describe 'ActiveModel validations' do
    it { expect(user).to validate_presence_of(:first_name) }
    it { expect(user).to validate_presence_of(:last_name) }
    it { expect(user).to validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'Attributes' do
    it { expect(user).to respond_to(:first_name) }
    it { expect(user).to respond_to(:last_name) }
    it { expect(user).to respond_to(:email) }
  end

  describe "ActiveRecord associations" do
    xit { should have_many(:gear) }
  end


end
