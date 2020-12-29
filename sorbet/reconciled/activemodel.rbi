# typed: strict
module ActiveModel::SecurePassword
  sig {params(unencrypted_password: T.nilable(String)).returns(T.any(T::Boolean, self))}
  def authenticate(unencrypted_password = nil); end
end
