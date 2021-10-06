feature 'Enters names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player_1_name, with: 'Charlie'
    fill_in :player_2_name, with: 'Matt'
    click_button 'Submit'

    save_and_open_page

    expect(page).to have_content 'Charlie vs. Matt'
  end
end
