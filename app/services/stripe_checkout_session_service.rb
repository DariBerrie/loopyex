class StripeCheckoutSessionService
  def call(event)
    order = Order.find(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
  end
end
