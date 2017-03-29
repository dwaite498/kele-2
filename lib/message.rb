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
   
   def create_message
    options = {
        values: {
           "sender": "dwaite498@gmail.com",
           "token": nil,
           "recipient_id": 592292,
           "subject": "API message test",
           "stripped-text": "This is a test message"
        },
       headers: {
           :authorization => @auth_token
       }
    }
    
       response = self.class.post(base_api("messages"), options)
    #   raise "An error has occured" unless response.code.between?(200, 299)
       puts response
   end
end