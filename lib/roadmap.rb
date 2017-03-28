
module Roadmap
   def get_roadmap(id)
      response = self.class.get base_api("roadmaps/#{id}"), headers: { :authorization => @auth_token }
      raise "An error has occured" unless response.code.between?(200, 299)
      @roadmap = JSON.parse(response.body)
   end
   
   def get_checkpoint(checkpoint_id)
      response = self.class.get base_api("checkpoints/#{checkpoint_id}"), headers: { :authorization => @auth_token }
      # raise "An error has occured" unless response.code.between?(200, 299)
      @checkpoint = JSON.parse(response.body)
   end
end