   def get_roadmap(id)
      response = self.class.get base_api("roadmaps/#{target}"), headers: { :authorization => @auth_token }
      raise "An error has occured" if response != 200
      @roadmap = JSON.parse(response.roadmap)
   end