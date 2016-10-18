RSpec.feature "User edits an artist" do
  scenario "they enter data to edit an artist" do
    artist = Artist.create(name: "Bob Marley", image_path: "askdfjhagdsj")
    new_artist_name = "Tom Petty"
    new_image_path = "image path"

    visit artist_path(artist)

    click_on "Edit Artist"


    fill_in "artist_name", with: new_artist_name
    click_on "Update Artist"

    expect(page).to have_content new_artist_name
    expect(page).to have_css "img[src*='#{artist.image_path}']"
    expect(current_path).to eq artist_path(artist)

  end
end
