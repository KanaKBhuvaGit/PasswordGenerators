defmodule PasswordGenerator.Sms do
  # alias PasswordGenerator.Router.Helpers, as: Routes
  require Logger

  @doc """
  
  """

  # def send_sms_now_twilio(mobile_number, sms_text) do
  #   twilio_account_sid = Application.get_env(:homepie, :twilio_account_sid)
  #   twilio_auth_token = Application.get_env(:homepie, :twilio_auth_token)
  #   twillio_sms_from = Application.get_env(:homepie, :twillio_sms_from)

  #   url = "https://api.twilio.com/2010-04-01/Accounts/#{twilio_account_sid}/Messages.json"

  #   headers = [
  #     {"Content-Type", "application/x-www-form-urlencoded"},
  #     {"Authorization", "Basic " <> Base.encode64("#{twilio_account_sid}:#{twilio_auth_token}")}
  #   ]

  #   payload = %{
  #     "From" => twillio_sms_from,
  #     "To" => mobile_number,
  #     "Body" => sms_text
  #   }

  #   body = URI.encode_query(payload)

  #   case HTTPoison.post(url, body, headers) do
  #     {:ok, _response} ->
  #       Logger.info("SMS Sent")

  #     {:error, %{reason: _reason}} ->
  #       :error
  #   end
  # end

  # def user_signup_sms(user) do
  #   mobile_number = user.phone
  #   home_url = Routes.home_page_url(HomepieWeb.Endpoint, :home_page)
  #   view_req_url = Routes.userdash_url(HomepieWeb.Endpoint, :home_page)
  #   # search_url = Routes.listing_url(HomepieWeb.Endpoint, :search_page)

  #   sms_text =
  #     "Thanks for signing up for Homepie! Selling a home? Visit your dashboard (#{view_req_url}) to start a free listing and discover our marketing tools. Buying a home? Visit #{home_url} to start your search."

  #   # check user Notification Preferences
  #   userinfo = Homepie.Accounts.get_user!(user.id)

  #   if userinfo.sms_prefs_all do
  #     send_sms_now(mobile_number, sms_text)
  #   end
  # end

  # def send_sms_now_text_local(mobile_number, sms_text) do
  #   text_local_api_key = "NWE0ZDYxNzY3YTUwNWEzNDZjNzE3MTcyNTg0MjUyNTI="
  #   sender = "Kanak"

  #   headers = [
  #     {"Content-Type", "application/x-www-form-urlencoded"}
  #   ]

  #   url = "https://api.textlocal.in/send/?"

  #   payload = %{
  #     "apikey" => text_local_api_key,
  #     "numbers" => mobile_number,
  #     "message" => sms_text,
  #     "sender" => sender
  #   }

  #   body = URI.encode_query(payload)

  #   case HTTPoison.post(url, body, headers) do
  #     {:ok, response} ->
  #       Logger.info("SMS Sent")
  #       Logger.info(response)

  #     {:error, %{reason: reason}} ->
  #       reason
  #   end
  # end

  # def tets_user_sms() do
  #   mobile_number = "918980781194"

  #   sms_text =
  #     "Your sms account has been archived. If this was an error, please contact us through the chat button on \n https://homepie.com"

  #   send_sms_now_text_local(mobile_number, sms_text)
  # end
end
