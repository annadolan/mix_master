RSpec.feature "User edits a playlist" do
  scenario "they enter data to edit a playlist" do
    song_one, song_two, song_three = create_list(:song, 3)
    playlist = create(:playlist, song_ids: [song_one.id, song_two.id])

    new_playlist_name = "Slow Jamz"

    visit playlist_path(playlist)

    expect(page).to have_content song_one.title
    expect(page).to have_content playlist.name

    click_on "Edit"

    fill_in "playlist_name", with: new_playlist_name
    uncheck("song-#{song_one.id}")
    check("song-#{song_three.id}")
    click_on "Update Playlist"

    expect(page).to have_content new_playlist_name
    expect(page).to_not have_content song_one.title
    expect(page).to have_content song_three.title

  end
end
