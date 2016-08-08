class PostcardsController < ApplicationController

  def index
  end

  def create
    puts params[:postcards]

    lob = Lob.load(api_key: "test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc")

    @results = lob.postcards.create(
      description: "Demo Postcard",
      to: {
        name: params[:postcards][:to_name],
        address_line1: params[:postcards][:to_address_line1],
        address_city: params[:postcards][:to_city],
        address_state: params[:postcards][:to_state],
        address_zip: params[:postcards][:to_zip],
        address_country: "US",
      },
      from: {
        name: params[:postcards][:from_name],
        address_line1: params[:postcards][:from_address_line1],
        address_city: params[:postcards][:from_city],
        address_state: params[:postcards][:from_state],
        address_zip: params[:postcards][:from_zip],
        address_country: "US",
      },
      front: "<html>test</html>",
      message: params[:postcards][:message],
    )
  end

end
