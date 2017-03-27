feature 'at posts#show page' do

  let(:post) { create(:post) }
  let(:logged_user) { FactoryGirl.create(:logged_user) }

  context 'checking with unlogged user' do

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

  context 'checking with logged in user' do

    before do
      login_as(logged_user, :scope => :user)
      visit post_path(post)
    end

    it "2 voting elements are shown for logged in user" do
      elements = page.all(".post-rate")
      expect(elements.length).to eq(2)
    end

    it "voting changes rating value on page", js: true do
      prev_post_rating = post.rating
      element = page.find(".post-like")
      element.click
      save_and_open_page
      expect(post.rating).to eq(prev_post_rating + 1)
    end
  end
end
