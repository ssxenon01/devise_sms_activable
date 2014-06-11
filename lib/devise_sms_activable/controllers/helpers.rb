module DeviseSmsActivable::Controllers::Helpers
  
  
  # Path for entering token send via sms. Can be redefined in ApplicationController
  def activation_path
    insert_user_sms_activation_path
  end
  
  protected
  
  # Convenience helper to check if user has confirmed the token (and the phone) or not.
  def require_sms_activated!
    if(send(:"authenticate_#{resource_name}!"))
      res=send(:"current_#{resource_name}")
      redirect_to activation_path if (!res) || (!res.confirmed_sms?)
    end
  end
end
ActionController::Base.send :include, DeviseSmsActivable::Controllers::Helpers