class CustomersController < ApplicationController
  def index
  	@client = GoCardlessPro::Client.new(
      access_token: "sandbox_V4dCqR3LLwS2f1G5aCD9OPQeNuZC3RwvR8vK-H_k",
      environment: :sandbox
    )
  end

  def new
  	client = GoCardlessPro::Client.new(
    access_token: "sandbox_V4dCqR3LLwS2f1G5aCD9OPQeNuZC3RwvR8vK-H_k",
    environment: :sandbox
    )

    @redirect_flow = client.redirect_flows.create(
    params: {
    description: 'Bookings Plus Direct Debit', # This will be shown on the payment pages
    session_token: 'nyasha', # Not the access token
    success_redirect_url: "http://www.localhost:3000/customers/index" ,
    prefilled_customer: { # Optionally, prefill customer details on the payment page
      given_name: 'Tim',
      family_name: 'Rogers',
      email: 'tim@gocardless.com',
      address_line1: '338-346 Goswell Road',
      city: 'London',
      postal_code: 'EC1V 7LQ'
                        }
             }
    )
  end

  def show
  end
end
