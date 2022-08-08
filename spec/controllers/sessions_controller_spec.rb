require "rails_helper"

RSpec.describe SessionsController, :type => :controller do
    describe 'Session Routes' do
        it "routes /session to sessions#create" do
            expect(post: "/sessions").to route_to(
            controller: "sessions",
            action: "create"
            )
        end
    end
end