class ParticipationMailer < ApplicationMailer
  default from: ENV['MAILJET.DEFAULT_FROM']

    def participation_email(event_creator, participant)
      @event_creator = event_creator
      @participant = participant
      mail(to: @event_creator.email, subject: "Confirmation de participation à l'événement")
    end
  end
