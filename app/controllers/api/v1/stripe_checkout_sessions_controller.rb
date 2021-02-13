class Api::V1::StripeCheckoutSessionsController < Api::ApplicationController
  before_action :set_logger, only: [:create]

  def create
    article = Article.find_by(stripe_price_id: stripe_checkout_session_params[:stripe_price_id])

    Stripe.api_key = ENV["STRIPE_SECRET"]
    @stripe_public_key = ENV["STRIPE_PUBLIC_KEY"]

    session = Stripe::Checkout::Session.create(
      
    )
  end

  private
    def set_logger
      @logger = Logger.new 'log/stripe_subscription.log'
    end
end