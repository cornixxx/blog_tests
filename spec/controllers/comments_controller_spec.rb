
require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) } 
  let(:post) { create(:post) }

  subject { response }

  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe '#destroy' do
    let!(:comment) { create(:comment, post: post) }

    subject { -> { delete :destroy, post_id: post, id: comment } }

    it { is_expected.to change(Comment, :count).by(-1) }
  end
end
