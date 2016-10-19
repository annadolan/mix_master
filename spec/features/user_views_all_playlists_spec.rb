require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they visit the playlists index" do
    playlist1 = Playlist.create(name: "Playlist1")

    visit playlists_path

    expect(page).to have_link playlist1.name, href: playlist_path(playlist1)
  end
end
