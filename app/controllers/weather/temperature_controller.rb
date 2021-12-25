class Weather::TemperatureController < ApplicationController
  before_action :set_locale, only: [:create]

  def create
    @temp =  temperature_params[:degrees].to_i
    if @temp > 0
      @text = I18n.t("temperature.above_zero", degrees: @temp)

    else
      @text = I18n.t("temperature.below_zero",degrees:@temp.abs)

    end

    render json: {description: @text} , status: :created
  end

  def temperature_params
    params.permit(:locale,:degrees).tap do |params|
      params.require(:degrees)
    end
  end

  def set_locale
    if temperature_params[:locale] == "es"
      I18n.locale = :es
    else
      I18n.locale = :en
    end

  end
end
