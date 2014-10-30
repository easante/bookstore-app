def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

def current_user
  User.find(session[:user_id])
end

def set_admin_user(admin=nil)
  session[:user_id] = (admin || Fabricate(:admin)).id
end

def clear_current_user
  session[:user_id] = nil
end

def sign_in_as(user)
  visit root_path
  click_link 'Sign in'
  fill_in "Email Address", with: user.email
  fill_in "Password", with: user.password
  click_button 'Sign in'
  expect(page).to have_content("Sign in successful.")
end
