class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
    authorize @contact
  end
  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    if @contact.save
      redirect_to coaching_path, notice: "Thank you for filling the form! I'll be in touch shortly 😊"
    else
      render :new
    end
  end
end
