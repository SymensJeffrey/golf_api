require "rails_helper"

RSpec.describe ScoresController, :type => :controller do
    describe 'Score Routes' do
        it "routes /score to scores#create" do
            expect(post: "/scores").to route_to(
                controller: "scores",
                action: "create"
            )
        end

        it "routes /score/:id to scores#update" do
            expect(patch: "/scores/1").to route_to(
                controller: "scores",
                action: "update",
                id: "1"
            )
        end
    end
end