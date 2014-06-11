# module Devise
#   module Models
#     # Confirmable is responsible to verify if an account is already confirmed to
#     # sign in, and to send emails with confirmation instructions.
#     # Confirmation instructions are sent to the user email after creating a
#     # record and when manually requested by a new confirmation instruction request.
#     #
#     # == Options
#     #
#     # Confirmable adds the following options to +devise+:
#     #
#     #   * +allow_unconfirmed_access_for+: the time you want to allow the user to access their account
#     #     before confirming it. After this period, the user access is denied. You can
#     #     use this to let your user access some features of your application without
#     #     confirming the account, but blocking it after a certain period (ie 7 days).
#     #     By default allow_unconfirmed_access_for is zero, it means users always have to confirm to sign in.
#     #   * +reconfirmable+: requires any email changes to be confirmed (exactly the same way as
#     #     initial account confirmation) to be applied. Requires additional unconfirmed_email
#     #     db field to be setup (t.reconfirmable in migrations). Until confirmed new email is
#     #     stored in unconfirmed email column, and copied to email column on successful
#     #     confirmation.
#     #   * +confirm_within+: the time before a sent confirmation token becomes invalid.
#     #     You can use this to force the user to confirm within a set period of time.
#     #
#     # == Examples
#     #
#     #   User.find(1).confirm!      # returns true unless it's already confirmed
#     #   User.find(1).confirmed?    # true/false
#     #   User.find(1).send_confirmation_instructions # manually send instructions
#     #
#     module Confirmable

#       module ClassMethods

#         # Find a user by its confirmation token and try to confirm it.
#         # If no user is found, returns a new user with an error.
#         # If the user is already confirmed, create an error for the user
#         # Options must have the confirmation_token
#         def confirm_by_token(confirmation_token)
#           original_token     = confirmation_token
#           #confirmation_token = Devise.token_generator.digest(self, :confirmation_token, confirmation_token)

#           confirmable = find_or_initialize_with_error_by(:confirmation_token, confirmation_token)
#           confirmable.confirm! if confirmable.persisted?
#           confirmable.confirmation_token = original_token
#           confirmable
#         end
#       end
#     end
#   end
# end
