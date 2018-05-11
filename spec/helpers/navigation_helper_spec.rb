require 'rails_helper'

RSpec.describe NavigationHelper, :type => :helper do

  context 'signed in user' do
    before(:each) { helper.stub(:user_signed_in?).and_return(true) }

    context '#collaps_links_partial_path' do
      it "returns signed_in_links partial's path" do
        expect(helper.collaps_links_partial_path).to (
          eq 'layouts/navigation/collaps_bar/signed_in_links'
        )
      end
    end
  end

  context 'no-sign in user' do
    before(:each) { helper.stub(:user_signed_in?).and_return(false) }
    
    context '#collaps_links_partial_path' do
      it "returns no_sign_in_links partial's path" do
        expect(helper.collaps_links_partial_path).to (
          eq 'layouts/navigation/collaps_bar/no_sign_in_links'
        )
      end
    end
  end

end