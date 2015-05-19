require 'rails_helper'

# а так как обычно, модели и их методы покрываются, можно связи проверить
# интеграционный, типа лайкает-дизлайкает человек и счетчик меняется

feature 'at posts#show page' do

  let(:post) { create(:post) }

  it 'voting buttons are not shown to unlogined user' do
    # post = create(:post)

    visit post_path(post)
    elements = page.all(".post-rate")
    expect(elements.length).to eq(0)
  end

  it 'post rating on page equals post.rating value' do
    # post = create(:post)
    visit post_path(post)
    post_rating = page.find(".post-rating").text.to_i
    expect(post_rating).to eq(post.rating)
  end

  it "voting changes rating on page" do

    visit user_session_path

    fill_in 'Email', with: 'andoidxx@gmail.com'
    fill_in 'Password', with: '1111'
    click_on 'Log in'
    visit post_path(post)

    prev_post_raing = post.rating
    p "post.author = #{post.author.name}"
    p current_user.email
    # page.find(".post-up").click
    # expect(post.rating).to eq(prev_post_raing + 1)

    expect(page).to have_content post.name

  end

end
  # scenario 'can be visited by authenticated admin' do
  #   visit rails_admin_path

  #   fill_in 'Email', with: admin.email
  #   fill_in 'Password', with: admin.password

  #   click_on 'Log in'

  #   expect(page).to have_content 'All the Books Dashboard'
  # end
