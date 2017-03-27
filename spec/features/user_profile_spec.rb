feature 'User profile features' do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:admin_user) { create(:user, :admin) }
  let(:banned_user) { create(:user, :banned) }

  context 'checking with default user' do

    before do
      login_as(user)
    end

    scenario 'default user can edit his profile' do
      visit user_path(user)
      expect(page).to have_link('Редактировать профиль', href: edit_user_path(user))
    end

    scenario 'default user can not ban users' do
      visit user_path(user)
      expect(page).not_to have_link('Забанить', href: ban_user_path(user))
      visit user_path(user2)
      expect(page).not_to have_link('Забанить', href: ban_user_path(user2))
    end

    scenario 'default user can not edit profile of another user' do
      visit user_path(user2)
      expect(page).not_to have_link('Редактировать профиль', href: edit_user_path(user2))
    end


  end
#########################################################################
  context 'checking with admin' do

    before do
      login_as(admin_user)
    end

    scenario 'admin can edit profiles' do
      visit user_path(user)
      expect(page).to have_link('Редактировать профиль', href: edit_user_path(user))
    end

    scenario 'admin can ban users' do
      visit user_path(user)
      expect(page).to have_link('Забанить', href: ban_user_path(user))
    end


  end
  #########################################################################
  context 'checking with banned user' do

    before do
      login_as(banned_user)
    end

    scenario 'banned user can not edit any profiles' do
      visit user_path(banned_user)
      expect(page).to_not have_link('Редактировать профиль', href: edit_user_path(banned_user))
      visit user_path(user)
      expect(page).to_not have_link('Редактировать профиль', href: edit_user_path(user))
    end

  end
end
