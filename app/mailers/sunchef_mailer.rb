class SunchefMailer < ApplicationMailer
  def new_contact
    @contact = params[:contact]
    mail(to: SUNCHEF_EMAIL, subject: "#{@contact.name} just submitted their health form")
  end
end
