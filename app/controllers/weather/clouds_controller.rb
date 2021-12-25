class Weather::CloudsController < ApplicationController
  before_action :set_locale, only: [:create]
  def create
    p cloud_params[:clouds]
    case cloud_params[:clouds].to_i
    when 0..10
      @text = I18n.t("clouds.none")

    when 11..70
      @text = I18n.t("clouds.partial")

    else
      @text = I18n.t("clouds.full")

    end

    render json: {description: @text} , status: :ok
  end

  def cloud_params
    params.permit(:locale,:clouds).tap do |params|
      params.require(:clouds)
    end
  end

  def set_locale
    if cloud_params[:locale] == "es"
    I18n.locale = :es
    else
      I18n.locale = :en
    end

  end
end
