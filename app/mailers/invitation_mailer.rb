class InvitationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.email.subject
  #
  def email(invitation)
    @invitation = invitation

    mail to: invitation.email, from: 'no-reply@fate.re'
  end
end
