class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
        :to => 'lynch@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def payment_confirmation(user, product)
    @user = user
    @product = product
    @appname = "Bike Berlin"
    mail( :to => user.email, :subject => "We appreciates your business #{@appname}.")
  end
  
end

