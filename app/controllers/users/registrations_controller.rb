class Users::RegistrationsController < Devise::RegistrationsController
	def after_sign_up_path_for(resource)
      new_total_path
	end
end