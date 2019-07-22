require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
    describe "#new" do
        it 'renders the new page' do
            get :new
            expect(response).to render_template :new
        end

        it 'instatiates @idea variable' do
            get :new
            expect(assigns(:idea)).to be_a_new(Idea)
        end
    end

    describe "#create" do
        context 'with valid params' do
            it 'saves the idea in the db' do
                before_count = Idea.all.count
                post :create, params: {idea: FactoryBot.attributes_for(:idea)}
                after_count = Idea.all.count
                expect(after_count).to eq(before_count + 1)
            end

            it 'redirects to the idea show page' do
                post :create, params: {idea: FactoryBot.attributes_for(:idea)}
                expect(response).to redirect_to(Idea.last)
            end
        end

        context 'with invalid params' do 
            it 'redirects to the ideas index page' do
                post :create, params: {idea: FactoryBot.attributes_for(:idea, title:nil)}
                expect(response).to redirect_to(ideas_path)
            end

            it 'flashes an alert message' do
                post :create, params: {idea: FactoryBot.attributes_for(:idea, title:nil)}
                expect(flash[:alert]).to be
            end
        end
    end

end
