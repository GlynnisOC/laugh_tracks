require 'rails_helper'

RSpec.describe 'comedians index page', type: :feature do
  it "user can see comedians info" do
    @davec = Comedian.create(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")
    @chrisr = Comedian.create(name: "Chris Rock", age: 53, birthplace: "Andrews, SC", image_url: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/02/14/14/chris-rock-netflix.jpg?w968")
    @toms = Comedian.create(name: "Tom Segura", age: 39, birthplace: "Cincinnati, OH", image_url: "https://pixel.nymag.com/imgs/daily/vulture/2018/07/12/splitsider/879409292.w700.h467.2x.jpg")
    @davecspecial1 = Special.create(name: "Killin' Them Softly", runtime_mins: 57, comedian_id: 7, image_url: "https://m.media-amazon.com/images/M/MV5BMTcyOGMxN2MtYzUwYy00YzQxLTgwZTItZjAxZTIzYWM1YzEyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_.jpg")
    @davecspecial2 = Special.create(name: "Equaniminity", runtime_mins: 60, comedian_id: 7, image_url: "https://m.media-amazon.com/images/M/MV5BODJkMTAxNmYtZDg4OS00NzA2LTlmZTUtMDc2MjIwMzE4ZDMxXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")
    @chrisrspecial1 = Special.create(name: "Kill The Messanger", runtime_mins: 79, comedian_id: 8, image_url: "https://m.media-amazon.com/images/M/MV5BMjAwMjQxNDA5OF5BMl5BanBnXkFtZTcwNTE3MzM5MQ@@._V1_.jpg")
    @chrisrspecial2 = Special.create(name: "Bigger & Blacker", runtime_mins: 65, comedian_id: 8, image_url: "https://m.media-amazon.com/images/M/MV5BODQzOWExYjktZDQ2OC00YTA5LWI3YzctMDFjNjc3ZTM5NTA0XkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")
    @tomsspecial1 = Special.create(name: "Mostly Stories", runtime_mins: 73, comedian_id: 9, image_url: "https://m.media-amazon.com/images/M/MV5BZWE2Nzc5N2YtOWM0OS00ZWVmLThhOTctNjNlNGI0NTQzMTU5XkEyXkFqcGdeQXVyMzAzODY0NzE@._V1_.jpg")
    @tomsspecial2 = Special.create(name: "Completely Normal", runtime_mins: 74, comedian_id: 9, image_url: "https://m.media-amazon.com/images/M/MV5BMTcyODE0Mzk1Nl5BMl5BanBnXkFtZTgwMDk4ODE0NDE@._V1_.jpg")


    visit '/comedians'

    expect(page).to have_content("Name: #{@davec.name}")
    expect(page).to have_content("Name: #{@chrisr.name}")
    expect(page).to have_content("Age: #{@toms.age}")
  end
end


# User Story 2
#
# As a visitor
# When I visit `/comedians`
# Then I also see a list of each comedian's TV specials, including
#   * Name of the special
#   * Run Time of the special in minutes
#
# - You may find this information on IMDB.com and other related sites.
# - Your project does not need to include *every* special the comedian has ever made.
