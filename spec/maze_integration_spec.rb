require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the maze', {:type => :feature}) do
  it('take one right to an uneventful room') do
    visit('/')
    fill_in('which_way', :with => 'right')
    click_button('GO!')
    expect(page).to have_content("Welcome to the next room. You have the same choice.")
  end
  it('takes two lefts to win the game') do
    visit('/')
    fill_in('which_way', :with => 'left')
    click_button('GO!')
    fill_in('which_way', :with => 'left')
    click_button('GO!')
    expect(page).to have_content("You see a door with a key hole. Pulling the key from your pocket, you insert it in the door. The door creaks open. Welcome to Atlantis. Play again!")
  end
  it ('takes a left, right left to win the game') do
    visit('/')
    fill_in('which_way', :with => 'left')
    click_button('GO!')
    fill_in('which_way', :with => 'right')
    click_button('GO!')
    fill_in('which_way', :with => 'left')
    click_button('GO!')
    expect(page).to have_content("You see a door with a key hole. Pulling the key from your pocket, you insert it in the door. The door creaks open. Welcome to Atlantis. Play again!")
  end
end
