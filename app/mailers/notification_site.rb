class NotificationSite < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_site.notify_invitation.subject
  #
  default from: 'informacion@grupoaltegra.com.mx'
  def notify_invitation(user,pass)
  	@user = user
    @pass = pass
    @greeting = "Hi"
    #@url  = 'http://Site.com'
    @url  = 'http://localhost:3000'
    mail to: @user.email, subject: "Bienvenido a Site"
  end
end
