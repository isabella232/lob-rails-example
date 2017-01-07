class PostcardsController < ApplicationController
  # Replace with your API key
  LOB_API_KEY = "test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc"

  def index
  end

  def create
    lob_client = Lob::Client.new(api_key: LOB_API_KEY)

    template_file = ERB.new(File.open(File.join(Rails.root, 'app', 'views', 'postcards', 'postcard_front.html.erb')).read)
    custom_html = template_file.result(binding)

    @results = lob_client.postcards.create(
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
      front: custom_html,
      message: params[:postcards][:message]
    )
  end

end
