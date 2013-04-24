class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Sara Coding Donation',
      :currency    => 'usd'
    )
    
    if Stripe::Charge.create
      Payment.create!({ results: "success", customer_id: customer.id })
    else
      Payment.create!({ results: "failure", customer_id: customer.id })
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
