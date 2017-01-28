 if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_nzd1MzWN2u7Sg07gHnX4uwN4',
    :secret_key => 'sk_test_mOCzQuDVL7FkjmCMwzUu78YN'
  }
end