require 'rails_helper'

RSpec.describe "guest can view home page" do
  it "and see this stuff" do

    visit root_path

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Gear Track'r")
    expect(page).to have_link("How it works")
    expect(page).to have_content("Click the link above to get started tracking your gear and we'll let you know when you need to rotate shoes, rebuild your shock, or schedule a tune up on your road bike!")

    within('.header-content-inner') do
      expect(page).to have_css('.transbox')
    end
  end
end
