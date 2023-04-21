class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_i18n_locale_from_params
  before_action :set_tmbd_language

  protected

    def set_tmbd_language
      Tmdb::Api.language(I18n.locale.to_s)
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname email])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[nickname email])
    end
end
