require 'rails_helper'

RSpec.describe 'comedians index page', type: :feature do
  it "user can see comedians info" do
    @davec = Comedian.create!(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg")
    @chrisr = Comedian.create!(name: "Chris Rock", age: 53, birthplace: "Andrews, SC", image_url: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/02/14/14/chris-rock-netflix.jpg?w968")
    @toms = Comedian.create!(name: "Tom Segura", age: 39, birthplace: "Cincinnati, OH", image_url: "https://pixel.nymag.com/imgs/daily/vulture/2018/07/12/splitsider/879409292.w700.h467.2x.jpg")
    @davecspecial1 = @davec.specials.create(name: "Killin' Them Softly", runtime_mins: 57, image_url: "https://m.media-amazon.com/images/M/MV5BMTcyOGMxN2MtYzUwYy00YzQxLTgwZTItZjAxZTIzYWM1YzEyXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_.jpg")
    @davecspecial2 = @davec.specials.create(name: "Equaniminity", runtime_mins: 60, image_url: "https://m.media-amazon.com/images/M/MV5BODJkMTAxNmYtZDg4OS00NzA2LTlmZTUtMDc2MjIwMzE4ZDMxXkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")
    @chrisrspecial1 = @chrisr.specials.create(name: "Kill The Messenger", runtime_mins: 79, image_url: "https://m.media-amazon.com/images/M/MV5BMjAwMjQxNDA5OF5BMl5BanBnXkFtZTcwNTE3MzM5MQ@@._V1_.jpg")
    @chrisrspecial2 = @chrisr.specials.create(name: "Bigger & Blacker", runtime_mins: 65, image_url: "https://m.media-amazon.com/images/M/MV5BODQzOWExYjktZDQ2OC00YTA5LWI3YzctMDFjNjc3ZTM5NTA0XkEyXkFqcGdeQXVyMTk3NDAwMzI@._V1_.jpg")
    @tomsspecial1 = @toms.specials.create(name: "Mostly Stories", runtime_mins: 73, image_url: "https://m.media-amazon.com/images/M/MV5BZWE2Nzc5N2YtOWM0OS00ZWVmLThhOTctNjNlNGI0NTQzMTU5XkEyXkFqcGdeQXVyMzAzODY0NzE@._V1_.jpg")
    @tomsspecial2 = @toms.specials.create(name: "Completely Normal", runtime_mins: 74, image_url: "https://m.media-amazon.com/images/M/MV5BMTcyODE0Mzk1Nl5BMl5BanBnXkFtZTgwMDk4ODE0NDE@._V1_.jpg")

    visit '/comedians'
    save_and_open_page

    expect(page).to have_content("Name: #{@davec.name}")
    expect(page).to have_content("Name: #{@chrisr.name}")
    expect(page).to have_content("Age: #{@toms.age}")
    expect(page).to have_content(@davecspecial1.name)
    expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTII3JGyHZiZx-tRsKYcDk8jotJ6kK6yGNiCof1mLfTw5DxekFZtg']")
    expect(page).to have_content("Specials Count: #{@davec.specials.count}")
    expect(page).to have_content("Statistics")
  end

  it "user can find comedians by age" do
    @chrisr = Comedian.create!(name: "Chris Rock", age: 53, birthplace: "Andrews, SC", image_url: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/02/14/14/chris-rock-netflix.jpg?w968")
    @toms = Comedian.create!(name: "Tom Segura", age: 34, birthplace: "Cincinnati, OH", image_url: "https://pixel.nymag.com/imgs/daily/vulture/2018/07/12/splitsider/879409292.w700.h467.2x.jpg")

    visit '/comedians?age=34'
    save_and_open_page

    expect(page).to have_content("Age: #{@toms.age}")
    expect(page).to have_no_content("Age: #{@chrisr.age}")
  end

  it "user can add a new comedian" do
    visit 'comedians/new'
    save_and_open_page

    expect(page).to have_content("Age")
    click_on('Create Comedian')
  end
end
