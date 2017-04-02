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
        body: {
            "sender": "dwaite498@gmail.com",
            "recipient_id": 592292,
            "token": nil,
            "subject": "API message test",
            "stripped-text": "This is a test message"
        }.to_json,
        headers: {
             "Content-Type" => 'application/json',
             :authorization => @auth_token
       }
    }

       response = self.class.post 'https://www.bloc.io/api/v1/messages', options
    #   raise response.code unless response.code.between?(200, 299)
     puts response.body
       puts response.code
   end
end