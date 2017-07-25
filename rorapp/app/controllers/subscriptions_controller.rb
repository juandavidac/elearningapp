class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    user= current_user
    token= params[:stripeToken]
    customer= Stripe::Customer.create(
      card: token,
      plan: 1,
      email: user.email
    )
    user.subscribed= "pro"
    user.stripeid= customer.id
    user.save
    render json: user
  end

  def destroy
    user= current_user
    customer= Stripe::Customer.retrieve(user.stripeid)
    subscription_id= customer.subscriptions.first.id
    subscription= customer.subscriptions.retrieve(subscription_id).delete
    user.subscribed= "basic"
    user.save
    render json: user
  end
end
