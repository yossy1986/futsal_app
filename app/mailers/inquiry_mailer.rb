class InquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.inquiry_mailer.inquiry_email.subject
  #
  def inquiry_email(contact)
    @contact = contact
    mail to: 'yossy1986512@yahoo.co.jp', subject: 'お問い合わせ'
  end
end
