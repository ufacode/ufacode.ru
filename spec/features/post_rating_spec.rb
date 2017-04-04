feature 'at posts#show page' do

  let(:post) { FactoryGirl.create(:post) }
  let(:user) { FactoryGirl.create(:user) }

  context 'with guest' do
    it 'post rating on page equals post.rating value' do
      visit post_path(post)
      post_rating = page.find(".post-rating").text.to_i
      expect(post_rating).to eq(post.rating)
    end

    it 'voting buttons are not shown to unlogined user' do
      visit post_path(post)
      elements = page.all(".post-rate")
      expect(elements.length).to eq(0)
    end
  end

  context 'with logined user' do
    before do
      login_as(user, scope: :user, run_callbacks: false)
      visit post_path(post)
    end

    it "2 voting elements are shown for logged in user" do
      expect(page.all('.post-rating').length).to eq 1
      expect(page.all('.glyphicon-thumbs-up').length).to eq 1
      expect(page.all('.glyphicon-thumbs-down').length).to eq 1
    end

    it "voting changes rating value on page", js: true do
      prev_post_rating = post.rating
      page.execute_script('$(".link-like").click()')
      wait_for_ajax
      post.reload
      expect(post.rating).to eq(prev_post_rating + 1)
    end
  end
end
