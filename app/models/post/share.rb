# require 'koala'
# require 'fb_graph'

class Post::Share < ActiveRecord::Base
  belongs_to :post

  enum social: [:twitter, :facebook, :google_plus, :vkontakte]

  def google_plus; end

  def self.rupor(post, social)
    social = social.to_sym
    return false if Post::Share.where(social: socials[social], post: post).exists?
    send(social, post)
    create(social: social, post: post)
  end

  private

  def self.prepare(post)
    [post.name, ActionController::Base.helpers.strip_tags(post.content_cut), Rails.application.routes.url_helpers.post_url(post, host: 'http://ufacode.ru')]
  end

  def self.facebook(post)
    name, message, link = prepare(post)
    graph = Koala::Facebook::API.new(Settings.rupor.facebook.access_token)
    graph.put_object(Settings.rupor.facebook.page_id, 'feed', { message: "#{name}\n\n#{message}\n#{link}" })
  end

  def self.twitter(post)
    name, message, link = prepare(post)

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Settings.rupor.twitter.consumer_key
      config.consumer_secret     = Settings.rupor.twitter.consumer_secret
      config.access_token        = Settings.rupor.twitter.access_token
      config.access_token_secret = Settings.rupor.twitter.access_token_secret
    end

    client.update("#{name}\n#{link}")
  end
end

# == Schema Information
#
# Table name: post_shares
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  social     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_post_shares_on_post_id  (post_id)
#
