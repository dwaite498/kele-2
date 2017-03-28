module Message
   def get_messages(page = 0)
       if page > 0
           request_url = "/message_threads?page=#{page}"
       else
           request_url = "/message_threads"
       end
       response = self.class.get( request_url, headers: { :authorization => @auth_token })
       @messages = JSON.parse(response.body)
   end
   
   def create_message(recipient, subject, message)
       
       values = {
           "recipient": recipient,
           "subject": subject,
           "message": message
       }
       response = self.class.post(base_api("messages"), values, headers: { :authorization => @auth_token })
       puts response
   end
end