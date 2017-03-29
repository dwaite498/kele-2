module Message
   def get_messages(page = 0)
       if page > 0
           request_url = "/message_threads?page=#{page}"
       else
           request_url = "/message_threads"
       end
       response = self.class.get( base_api(request_url), headers: { :authorization => @auth_token })
       @messages = JSON.parse(response.body)
   end
   
   def create_message(recipient, subject, message)
       
       values = {
           "recipient": recipient,
           "subject": subject,
           "message": message
       }
       
    #   values = '{
#   "sender": "strong.bad@strongbadia.gov",
#   "recipient_id": 2,
#   "token": "abcd",
#   "subject": "Royale with cheese",
#   "stripped-text": "That's what they call a quarter pounder in France."
# }'
       response = self.class.post(base_api("messages"), values, headers: { :authorization => @auth_token })
       puts response
   end
end