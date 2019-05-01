require 'rails_helper'

RSpec.describe 'comedians index page', type: :feature do
  it "user can see comedians info" do
    davec = Comedian.create(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")
    chrisr = Comedian.create(name: "Chris Rock", age: 53, birthplace: "Andrews, SC", image_url: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/02/14/14/chris-rock-netflix.jpg?w968")
    toms = Comedian.create(name: "Tom Segura", age: 39, birthplace: "Cincinnati, OH", image_url: "https://pixel.nymag.com/imgs/daily/vulture/2018/07/12/splitsider/879409292.w700.h467.2x.jpg")

    visit '/comedians'
    # save_and_open_page

    expect(page).to have_content("Name: #{davec.name}")
    expect(page).to have_content("Name: #{chrisr.name}")
    expect(page).to have_content("Age: #{toms.age}")
  end
end
# As a visitor
# When I visit `/comedians`
# Then I see a list of comedians with the following
# information for each comedian:
#   * Name
#   * Age
#   * City
#
# - Data does not have to be accurate to real life - you can make this up, or grab the information from the internet.
# - The city attribute can hold birthplace or current known hometown.
# - For testing, you should ensure that the name, age and city only appear on a
#   specific area of the page for that single comedian.
