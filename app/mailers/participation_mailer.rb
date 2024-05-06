class ParticipationMailer < ApplicationMailer
  default from: ENV['MAILJET.DEFAULT_FROM']

  def participation_email(event_creator, participant)
    @event_creator = event_creator
    @participant = participant
    @url  = 'http://monsite.fr/login'
    mail(to: @event_creator.email, subject: 'Nouvelle participation à votre événement !')
  end
end
