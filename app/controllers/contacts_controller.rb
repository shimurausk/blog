class ContactsController < ApplicationController
  def index
  	@contact = Contact.new
  end

  def confirm
  	@contact = Contact.new(contact_params)

		if @contact.valid?
			render :action => 'confirm'
		else
			render :action => 'index'
		end
  end

  def create
  	@contact = Contact.new(contact_params)
		NoticeMailer.contact_mail(@contact).deliver
		render :action => 'create'
  end

  private
		def contact_params
			params.require(:contact).permit(:name,:email,:message)
		end
end
