class NoticeMailer < ActionMailer::Base
  default from: ""

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.contact_mail.subject
  #
  def contact_mail(contact)
    @greeting = "Blogからお問い合わせ"
    @contact = contact

    mail to: '', subject: "Blogからお問い合わせがありました"
  end
end
