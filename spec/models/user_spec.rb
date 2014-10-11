require_relative '../spec_helper'

describe User do
  before do
    @user = create :normal_user
  end

  it 'can find by username' do
    user = User.find_by :username => @user.username

    expect(user).to_not be_nil
    expect(user[:username]).to eq(@user.username)
    expect(user[:password]).to eq(@user.password)
    expect(user[:is_admin]).to eq(@user.is_admin)
  end
end
