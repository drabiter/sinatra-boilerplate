require_relative '../feature_helper'

feature 'Login' do
  background do
    @user = create :normal_user
  end

  feature 'visit login' do
    scenario 'lets me login' do
      login_as @user
      expect(page).to have_content 'Welcome'
    end

    scenario 'lets me auto login' do
      login_as @user

      visit('/login') # you have logged in
      expect(page).to have_content 'Welcome'
    end
  end

  feature 'auto reject' do
    scenario 'redirects me back on wrong user' do
      @user.username = 'not_exist_user'
      login_as @user
      expect(page).to have_button 'Log in'
    end

    scenario 'redirects me back on wrong password' do
      @user.password = 'not_exist_password'
      login_as @user
      expect(page).to have_button 'Log in'
    end
  end
end
