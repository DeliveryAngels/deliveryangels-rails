# frozen_string_literal: true

class PostcodesClient
  def locate(postcode)
    details = postcode_details(postcode)

    return [0, 0] if details["status"] != 200

    location = details["result"]
    [location["latitude"], location["longitude"]]
  end

  def postcode_details(postcode)
    response = Typhoeus.get("https://api.postcodes.io/postcodes/#{postcode}")
    JSON.parse(response.response_body)
  end
end
