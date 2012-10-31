def valid_signin(user)
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def signin(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def valid_signup(user)
  fill_in 'Name',        with: user.name
  fill_in 'Email',        with: user.email
  fill_in 'Password',     with: user.password
  fill_in 'Confirm Password', with: user.password
end
