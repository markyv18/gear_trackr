require 'rails_helper'

RSpec.describe Gear, type: :model do

  it 'has a valid factory' do
    expect(build(:gear)).to be_valid
  end

  let(:gear) { build(:gear) }
  let(:user) { build(:user) }

  describe 'ActiveModel validations' do
    it { expect(gear).to validate_presence_of(:name) }
    it { expect(gear).to validate_presence_of(:total_distance_in_meters) }
    it { expect(gear).to validate_presence_of(:total_time_in_seconds) }
  end

  describe 'Attributes' do
    it { expect(gear).to respond_to(:name) }
    it { expect(gear).to respond_to(:total_time_in_seconds) }
    it { expect(gear).to respond_to(:total_distance_in_meters) }
  end

  describe "ActiveRecord associations" do
    xit { should belong_to(:user) }
  end

end
