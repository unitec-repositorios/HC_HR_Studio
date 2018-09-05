require 'rails_helper'

describe 'shows home page' do
  it ' home page', js: true do
    visit 'http://localhost:3000/'
    page.should have_content('Ingresar')
  end
end

describe 'log-in with valid credentials' do
	it 'LogIn', js:true do
    	visit 'http://localhost:3000/session/login'
    	fill_in('email', :with => 'admin@admin.com')
    	fill_in('password', :with => 'admin1')
    	find_button('logIN').click
    	page.should have_content('Holaaaa')	
  	end
end

