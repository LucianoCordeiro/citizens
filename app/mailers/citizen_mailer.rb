class CitizenMailer < ApplicationMailer

  default from: 'Governo Municipal <register@gov.br>'

  def new_message(citizen:, message:)
    @email = citizen.email
    @name = citizen.name
    @message = message

    send_email
  end

  def send_email
    mail(to: @email, subject: "Cadastro do Munícipe")
  end

end
