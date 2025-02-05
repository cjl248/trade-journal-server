require 'rails_helper'

RSpec.describe "Routes", type: :routing do
  it "ensures application can route to graphql layer" do
    expect(post: "/graphql").to be_routable
  end

  it "ensures there are no direct trade routes" do
    # common_routes = %i[options get post put patch delete]

    # @TODO: check actions in a loop instead of each at a time.
    # More actions can be added/removed in the future easily to common_routes
    # if there's a use case for the trades_controller
    # and we need to restrict routes

    expect(options: "/trade").not_to be_routable
    expect(get: "/trade").not_to be_routable
    expect(post: "/trade").not_to be_routable
    expect(patch: "/trade").not_to be_routable
    expect(put: "/trade").not_to be_routable
    expect(delete: "/trade").not_to be_routable
  end
end
