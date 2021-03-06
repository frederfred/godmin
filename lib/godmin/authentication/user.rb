module Godmin
  module Authentication
    module User
      extend ActiveSupport::Concern

      included do
        has_secure_password

        validates :password, length: { minimum: 8 }, allow_nil: true
      end

      def login
        send(self.class.login_column)
      end

      module ClassMethods
        def find_by_login(login)
          find_by(login_column => login)
        end

        def login_column
          raise NotImplementedError, "Must define the admin user login column"
        end
      end
    end
  end
end
