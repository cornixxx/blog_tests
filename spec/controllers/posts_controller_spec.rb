require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:user) { create(:user) }

  subject { response }

  before :each do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe '#index' do
    let(:post) { create(:post) }

    context 'params are present' do
      before { get :index }

      it { is_expected.to render_template(:index) }
      it { expect(assigns(:posts)).to be }
      it { is_expected.to have_http_status(:success) }
    end
  end

  describe '#show' do
    let(:post) { create(:post) }

    before { get :show, id: post.id }

    it { is_expected.to render_template(:show) }
    it { expect(assigns(:post)).to be }
    it { is_expected.to have_http_status(:success) }
  end

  describe '#new' do
    before { get :new }

    it { is_expected.to render_template(:new) }
    it { expect(assigns(:post)).to be }
    it { is_expected.to have_http_status(:success) }
  end

  describe '#create' do
    subject { -> { post :create, post: params} }

    context 'valid params' do
      let(:params) { attributes_for(:post) }

      it { is_expected.to change(Post, :count).by(+1) }
    end

    context 'not valid params' do
      let(:params) { { title: '' } }

      it { is_expected.to_not change(Post, :count) }
    end
  end

  describe '#edit' do
    let(:post) { create(:post) }

    before { get :edit, id: post }

    it { is_expected.to render_template(:edit) }
    it { is_expected.to have_http_status(:success) }
    it { expect(assigns(:post)).to be }
  end

  describe '#update' do
    let(:post) { create(:post) }

    before { patch :update, id: post, post: params }

    context 'valid params' do
      let(:params) { attributes_for(:post) }

      it { is_expected.to redirect_to(post_path(assigns(:post))) }
    end

    context 'not valid params' do
      let(:params) { attributes_for(:post, title: '') }

      it { is_expected.to render_template(:edit) }
    end
  end

  describe '#destroy' do
    let!(:post) { create(:post) }

    subject { -> { delete :destroy, id: post } }

    it { is_expected.to change(Post, :count).by(-1) }
  end

end