class SmsMessageService
  attr_reader :to, :message

  def initialize(args = {})
    @to =  args[:to].gsub(/[[:space:]]/, '')
    @message = args[:message]
  end

  def send!
    account_sid = "AC0b345dd5e283ea7d3ca5dea05b1dc7ea"
    auth_token = "fa548426c24db2923ded3e46a13c1255"

    client = Twilio::REST::Client.new account_sid, auth_token
    mes = client.messages.create(
      body: message,
      to: to,
      from: "+19292389877"
    )
  end


end
