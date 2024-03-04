class GeocoderController < ApplicationController
  protect_from_forgery with: :null_session

  def geocode
    result = Geocoder.search(params[:cep]).first

    render json: {
      city: result.sub_state,
      street: result.route,
      state: result.state_code,
      neighborhood: result.city
    }
  end
end
