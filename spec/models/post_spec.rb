RSpec.describe Post, type: :model do
  it 'is valid factory for :post' do
    expect(create(:post)).to be_valid
  end

  it 'is fill content_cut automatically' do
    post = create(:post)
    expect(post.content).not_to be_empty
    expect(post.content_cut).not_to be_empty
  end
end
