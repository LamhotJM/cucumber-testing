Then(/^buyer buy product from SS$/) do
  user_register
  sleep 2
  visit '/products/category/new-arrivals'
  @Count = 1
  sleep 1
  while @Count < 10
    add_to_cart
    @Count += 1
  end
  visit '/cart'
  if page.has_css?(' #main>div>div>div>div>div>p')
    user_register
  else
    register_step_one
    register_step_two
  end
end

def add_to_cart
  first('#main>div>div>div>div>div>div>div>div>div>div>button').click
  sleep 2
  first(:xpath,'.//*[@id]/div/div[2]/div[1]/a').click
  sleep 1
end

def user_register
  visit '/account/register'
  @phoneNumber=rand.to_s[2..15]
  find('#phoneNumber').set("0823#{@phoneNumber}")
  find('#email').set(@email=create_email.to_s)
  find('#password').set(SecureRandom.hex(10))
  find('.col.col--12>button').click
end

def register_step_one
  find('#main>div>div>div>div>div>button').click
  @alamat_buyer="Jl Pilar Mas Raya Kav. A-D, Kedoya - Kebon Jeruk Jakarta 11520 - Indonesia"
  find('#billing_name').set(@full_name)
  find('#billing_streetAddress').set(@alamat_buyer)
  sleep 1
  #select 'DKI Jakarta', from: 'billing_province',visible: false
  find('#billing_province').click
  sleep 1
  expect(page).to have_selector(:xpath, ".//*[@id='billing_province']/option[7]", wait: 5)
  find(:xpath,".//*[@id='billing_province']/option[7]",visible: false).click
  expect(page).to have_selector(:css, "#billing_city", wait: 5)
  find('#billing_city').click
  sleep 1
  find(:xpath,".//*[@id='billing_city']/option[2]").click
  expect(page).to have_selector(:css, "#billing_district", wait: 5)
  find('#billing_district').click
  sleep 1
  find(:xpath,".//*[@id='billing_district']/option[5]").click
  expect(page).to have_selector(:css, "#billing_subDistrict", wait: 5)
  find('#billing_subDistrict').click
  sleep 1
  find(:xpath,".//*[@id='billing_subDistrict']/option[3]").click
  sleep 1
  find('.SwipeView>div>div>div>div>div>form>div>button').click
  sleep 10
end

def register_step_two
  first('.SwipeView>div>div>div>div>div>form>div>div>div>div>div>label>span').click
  find('.SwipeView>div>div>div>div>div>form>div>div>button').click
  find('.SwipeView>div>div>div>div>div>button').click
  sleep 1
end

def create_email
  data_fake
  @provider = ['yhoo','gmbukanmail','asal','gmail'].sample
  @email=@firstname+"_"+@lastname+@number.to_s+"@"+@provider+".com"
end

def create_name
  data_fake
  @full_name=@firstname+"_"+@lastname+@number.to_s
end

def data_fake
  @firstname = ['Harun','Nani','Komuja','Devita','Purna','Delete','Iam Tri'].sample
  @lastname = ['nana','nano','lolo','hal','buana','devina','hdr'].sample
  @number = SecureRandom.hex(7)
end
