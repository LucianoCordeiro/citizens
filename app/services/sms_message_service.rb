class SmsMessageService
  attr_reader :to, :message

  def initialize(args = {})
    @to =  args[:to].gsub(/[[:space:]]/, '')
    @message = args[:message]
  end

  def send!
    client = Twilio::REST::Client.new(
      twilio_credentials[:account_sid],
      twilio_credentials[:auth_token]
    )

    client.messages.create(
      body: message,
      to: to,
      from: "+19292389877"
    )
  end

  def twilio_credentials
    @credentials ||= Rails.application.credentials.twilio
  end

end
