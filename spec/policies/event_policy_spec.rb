require 'spec_helper'
require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user_owner) { User.new }
  let(:user_not_owner) { User.new }
  let(:event) { user_owner.events.build }

  subject { EventPolicy }

  context "different policies for edit update destroy actions" do
    permissions :edit?, :update?, :destroy? do
      it "no access if user is anonimous" do
        expect(subject).not_to permit(false, event)
      end

      it "no access if user is authorized but not owner" do
        expect(subject).not_to permit(user_not_owner, event)
      end

      it "gives access if user is authorized and is event owner" do
        expect(subject).to permit(user_owner, event)
      end
    end
  end

  context "different policies for show action" do
    permissions :show? do
      it "gives access if user is anonimous" do
        expect(subject).to permit(true, event)
      end

      it "gives access if user is authorized but not owner" do
        expect(subject).to permit(user_not_owner, event)
      end

      it "gives access if user is authorized and event owner" do
        expect(subject).to permit(user_owner, event)
      end
    end
  end
end
