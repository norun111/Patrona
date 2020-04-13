Rails.configuration.stripe = {
  publishable_key: Rails.application.credentials.stripe[:publishable_key],
  secret_key: Rails.application.credentials.stripe[:secret_key],
  connect_client_id: Rails.application.credentials.stripe[:client_id]
}

Stripe.api_key = Rails.application.credentials.stripe[:secret_key]