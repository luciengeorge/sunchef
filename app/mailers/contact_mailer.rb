class ContactMailer < ApplicationMailer
  def new_contact
    @contact = params[:contact]
    mail(to: @contact.email, subject: "Thank you for submitting your health form")
  end
end
