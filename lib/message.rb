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
            "recipient_id": 592292,
            "token": nil,
            "subject": "API message test",
            "stripped-text": "This is a test message"
        },
        headers: {
             :authorization => @auth_token
       }
    }

       response = self.class.post 'https://www.bloc.io/api/v1/messages', options
    #   raise response.code unless response.code.between?(200, 299)
       puts response.code
   end
end