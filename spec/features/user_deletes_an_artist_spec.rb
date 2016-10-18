RSpec.feature "User edits an artist" do
  scenario "they click delete on an artist's page" do
    artist = Artist.create(name: "Bob Marley", image_path: "askdfjhagdsj")

    visit artists_path

    expect(page).to have_content artist.name

    click_on artist.name
    click_on "Delete"

    expect(current_path).to eq artists_path
    expect(page).to_not have_content artist.name

  end
end
