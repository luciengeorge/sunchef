class SunchefMailer < ApplicationMailer
  RECIPIENTS = [SUNCHEF_EMAIL, "by.sunchef@gmail.com"].freeze

  def new_contact
    @contact = params[:contact]
    mail(to: params.fetch(:to, SUNCHEF_EMAIL), subject: "#{@contact.name} just submitted their health form")
  end
end
