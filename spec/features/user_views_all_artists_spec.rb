require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they visit the artists index" do
    artist1 = Artist.create(name: "Bob Marley", image_path: "askdfjhagdsj")
    artist2 = Artist.create(name: "Bono", image_path: "ksjhgkjgfjsh")
    visit artists_path

    expect(page).to have_link artist1.name
    expect(page).to have_link artist2.name

    click_on artist1.name
    expect(current_path).to eq artist_path(artist1)
  end
end
