require 'rails_helper'
require_relative "../cancan_matchers"

RSpec.describe Ability, type: :model do

  it 'user can only destroy blogs which he owns' do
    user = create(:user, role: 'user')
    ability = Ability.new(user)
    expect(ability).to have_abilities(:destroy, create(:blog, author: user))
    expect(ability).to not_have_abilities(:destroy, create(:blog))
  end

  it 'user can only destroy posts which he owns' do
    user = create(:user, role: 'user')
    ability = Ability.new(user)
    expect(ability).to have_abilities(:destroy, create(:post, author: user))
    expect(ability).to not_have_abilities(:destroy, create(:post))
  end

  it 'admin can manage any resource' do
    user = create(:user, role: 'admin')
    ability = Ability.new(user)
    expect(ability).to have_abilities(:manage, create(:blog))
    expect(ability).to have_abilities(:manage, create(:post))
    expect(ability).to have_abilities(:manage, build(:user))
  end

  it 'user cannot manage users' do
    user = create(:user, role: 'user')
    ability = Ability.new(user)
    expect(ability).to not_have_abilities(:manage, build(:user))
  end

  it 'moderator cannot create and destroy users' do
    user = create(:user, role: 'moderator')
    ability = Ability.new(user)
    expect(ability).to have_abilities([:edit, :update], build(:user))
    expect(ability).to not_have_abilities([:create, :destroy], build(:user))
  end
  
  it 'moderator cannot destroy blogs & posts' do
    user = create(:user, role: 'moderator')
    ability = Ability.new(user)
    expect(ability).to have_abilities([:create, :edit, :update], build(:blog))
    expect(ability).to have_abilities([:create, :edit, :update], build(:post))
    expect(ability).to not_have_abilities( :destroy, build(:blog))
    expect(ability).to not_have_abilities( :destroy, build(:post))
  end
end