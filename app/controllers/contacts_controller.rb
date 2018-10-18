class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(name: params[:contact][:name],
                                email: params[:contact][:email],
                                tel: params[:contact][:tel],
                                content: params[:contact][:content])
        if @contact.save
            InquiryMailer.inquiry_email(@contact).deliver_now
            redirect_to("/thanks")
        else
            render action: 'new'
        end

    end
    
    def thanks
    end
end
