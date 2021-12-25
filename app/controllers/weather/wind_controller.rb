class Weather::WindController < ApplicationController
  before_action :set_locale, only: [:create]

  def create
    @wind_speed = wind_params[:wind_speed].to_i.abs
    case @wind_speed
    when 0..2
      @text = I18n.t("wind.none")
    when 3..7
      @text = I18n.t("wind.weak")
    when 8..19
      @text = I18n.t("wind.medium")
    else
      @text = I18n.t("wind.strong")
    end

    render json: {description: @text} , status: :created
  end

  def wind_params
    params.permit(:locale,:wind_speed).tap do |params|
        params.require(:wind_speed)
      end
  end
   def set_locale
      if wind_params[:locale] == "es"
      I18n.locale = :es
      else
        I18n.locale = :en
      end
      end
end
