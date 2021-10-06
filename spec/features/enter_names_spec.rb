feature 'Enters names' do
  scenario 'submitting names' do
    sign_in_and_play

    expect(page).to have_content 'Charlie vs. Matt'
  end
end
