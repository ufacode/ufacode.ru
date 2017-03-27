feature "Post Tags" do

  scenario "have tags on the page" do
    post_with_tags = create(:post_with_tags)
    visit post_path(post_with_tags)

    expect(page).to have_link('tag1', href: posts_path(tag: 'tag1'))
    expect(page).to have_link('tag2', href: posts_path(tag: 'tag2'))
    expect(page).to have_link('tag3', href: posts_path(tag: 'tag3'))
  end

end
