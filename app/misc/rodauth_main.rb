require "sequel/core"

class RodauthMain < Rodauth::Rails::Auth
  configure do
    # List of authentication features that are loaded.
    enable :create_account, 
    # :verify_account,
    #  :verify_account_grace_period,
      :login, 
      :logout,
      :json,
      # :reset_password,
      :change_password,
      # :change_login,
      # :verify_login_change,
      :close_account

    # See the Rodauth documentation for the list of available config options:
    # http://rodauth.jeremyevans.net/documentation.html

    # ==> General
    # Initialize Sequel and have it reuse Active Record's database connection.
    db Sequel.postgres(extensions: :activerecord_connection, keep_reference: false)
    # Avoid DB query that checks accounts table schema at boot time.
    convert_token_id_to_integer? { User.columns_hash["id"].type == :integer }

    # Change prefix of table and foreign key column names from default "account"
    accounts_table :users
    # verify_account_table :user_verification_keys
    # verify_login_change_table :user_login_change_keys
    # reset_password_table :user_password_reset_keys

    # The secret key used for hashing public-facing tokens for various features.
    # Defaults to Rails `secret_key_base`, but you can use your own secret key.
    # hmac_secret "72294340a05f074e2fdab6fdff9aab9a277b764a48b1f3289303e19259ee35be15a0e23ebc37f29274e2f82f58ac9bc20fcfba7bc72c23e6a99f953cfb42377f"

    # Set JWT secret, which is used to cryptographically protect the token.
    # jwt_secret { hmac_secret }
    # jwt_secret { ::Rails.application.credentials.secret_jwt_encryption_key }

    # Accept only JSON requests.
    only_json? true

    # Handle login and password confirmation fields on the client side.
    require_password_confirmation? true
    require_login_confirmation? false

    # Use path prefix for all routes.
    prefix "/auth"

    # Specify the controller used for view rendering, CSRF, and callbacks.
    rails_controller { RodauthController }

    # Make built-in page titles accessible in your views via an instance variable.
    # title_instance_variable :@page_title

    # Store account status in an integer column without foreign key constraint.
    account_status_column :status

    # Store password hash in a column instead of a separate table.
    account_password_hash_column :password_hash

    # Set password when creating account instead of when verifying.
    # verify_account_set_password? false

    # Change some default param keys.
    login_param "email"
    login_confirm_param "email_confirm"
    password_confirm_param "password_confirmation"

    # Redirect back to originally requested location after authentication.
    # login_return_to_requested_location? true
    # two_factor_auth_return_to_requested_location? true # if using MFA

    # Autologin the user after they have reset their password.
    # reset_password_autologin? true

    # Delete the account record when the user has closed their account.
    # delete_account_on_close? true

    # Redirect to the app from login and registration pages if already logged in.
    # already_logged_in { redirect login_redirect }

    # ==> Emails
    # send_email do |email|
    #   # queue email delivery on the mailer after the transaction commits
    #   db.after_commit { email.deliver_later }
    # end

    # ==> Flash
    # Override default flash messages.
    # create_account_notice_flash "Your account has been created. Please verify your account by visiting the confirmation link sent to your email address."
    # require_login_error_flash "Login is required for accessing this page"
    # login_notice_flash nil

    # ==> Validation
    # Override default validation error messages.
    # no_matching_login_message "user with this email address doesn't exist"
    # already_an_account_with_this_login_message "user with this email address already exists"
    # password_too_short_message { "needs to have at least #{password_minimum_length} characters" }
    login_does_not_meet_requirements_message { login_requirement_message if login_requirement_message }

    # Passwords shorter than 8 characters are considered weak according to OWASP.
    password_minimum_length 8
    # bcrypt has a maximum input length of 72 bytes, truncating any extra bytes.
    password_maximum_bytes 72

    # Custom password complexity requirements (alternative to password_complexity feature).
    # password_meets_requirements? do |password|
    #   super(password) && password_complex_enough?(password)
    # end
    # auth_class_eval do
    #   def password_complex_enough?(password)
    #     return true if password.match?(/\d/) && password.match?(/[^a-zA-Z\d]/)
    #     set_password_requirement_error_message(:password_simple, "requires one number and one special character")
    #     false
    #   end
    # end

    # ==> Hooks
    # Validate custom fields in the create account form.
    before_create_account do
      current_time = Time.now
      account[:created_at] = current_time
      account[:updated_at] = current_time
      account[:client_id] =  ClientId.build_client_id
      account[:username] = param('username')
      if param("username").empty?
        throw_error_status(422, "username", "can't be blank") 
      elsif User.where(username: param("username")).any?
        throw_error_status(422, "username", "already taken")
      end
    end

    # Perform additional actions after the account is created.
    # after_create_account do
    #   Profile.create!(account_id: account_id, name: param("name"))
    # end

    # Do additional cleanup after the account is closed.
    # after_close_account do
    #   Profile.find_by!(account_id: account_id).destroy
    # end

    # ==> Deadlines
    # Change default deadlines for some actions.
    # verify_account_grace_period 3.days.to_i
    # reset_password_deadline_interval Hash[hours: 6]
    # verify_login_change_deadline_interval Hash[days: 2]
  end
end