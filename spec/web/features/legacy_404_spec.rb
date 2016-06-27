require 'features_helper'

describe "rendering the different legacy 404 pages" do
  it "renders the default template" do
    visit '/bogus'

    expect(page.body).to include('Default 404')
  end

  it "renders the correct 'other' template" do
    visit '/bogus/other'

    expect(page.body).to include('Other 404')
  end
end
