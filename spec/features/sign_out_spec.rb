feature 'Sign out', :devise do

  scenario 'user signs out successfully' do
    user = create(:user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
    click_link 'Sair'
    expect(page).to have_content I18n.t 'devise.failure.unauthenticated'
  end

end


