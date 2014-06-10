# RailsAdmin config file. Generated on June 10, 2014 06:52
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Gagoit Documents', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  config.authorize_with :cancan

  # If you want to track changes on your models:
  # config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['BetScore', 'Comment', 'Event', 'Friendship', 'Group', 'Match', 'MatchPhoto', 'Photo', 'Post', 'PostCategory', 'Provider', 'SocialFriend', 'Standing', 'Team', 'TeamPhoto', 'Tournament', 'TournamentPhoto', 'User']

  # Include specific models (exclude the others):
  # config.included_models = ['BetScore', 'Comment', 'Event', 'Friendship', 'Group', 'Match', 'MatchPhoto', 'Photo', 'Post', 'PostCategory', 'Provider', 'SocialFriend', 'Standing', 'Team', 'TeamPhoto', 'Tournament', 'TournamentPhoto', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  BetScore  ###

  # config.model 'BetScore' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your bet_score.rb model definition

  #   # Found associations:

  #     configure :match, :belongs_to_association 
  #     configure :user, :belongs_to_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :scorea, :integer 
  #     configure :scoreb, :integer 
  #     configure :money, :integer 
  #     configure :score, :text 
  #     configure :match_id, :bson_object_id         # Hidden 
  #     configure :user_id, :bson_object_id         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Comment  ###

  # config.model 'Comment' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your comment.rb model definition

  #   # Found associations:

  #     configure :post, :belongs_to_association 
  #     configure :created_by, :belongs_to_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :body, :text 
  #     configure :_keywords, :serialized 
  #     configure :post_id, :bson_object_id         # Hidden 
  #     configure :created_by_id, :bson_object_id         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Event  ###

  # config.model 'Event' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your event.rb model definition

  #   # Found associations:

  #     configure :user, :belongs_to_association 
  #     configure :photos, :has_many_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :user_id, :bson_object_id         # Hidden 
  #     configure :date, :date 
  #     configure :description, :text 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Friendship  ###

  # config.model 'Friendship' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your friendship.rb model definition

  #   # Found associations:

  #     configure :inviter, :belongs_to_association 
  #     configure :invitee, :belongs_to_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :inviter_id, :bson_object_id         # Hidden 
  #     configure :invitee_id, :bson_object_id         # Hidden 
  #     configure :complete, :boolean 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Group  ###

  # config.model 'Group' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your group.rb model definition

  #   # Found associations:

  #     configure :tournament, :belongs_to_association 
  #     configure :teams, :has_and_belongs_to_many_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :name, :string 
  #     configure :tournament_id, :bson_object_id         # Hidden 
  #     configure :team_ids, :serialized         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Match  ###

  # config.model 'Match' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your match.rb model definition

  #   # Found associations:

  #     configure :playera, :belongs_to_association 
  #     configure :playerb, :belongs_to_association 
  #     configure :tournament, :belongs_to_association 
  #     configure :match_photos, :has_many_association 
  #     configure :bet_scores, :has_many_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :description, :text 
  #     configure :name, :string 
  #     configure :result, :text 
  #     configure :start_time, :datetime 
  #     configure :time, :integer 
  #     configure :number, :integer 
  #     configure :group, :text 
  #     configure :short_description, :text 
  #     configure :playera_id, :bson_object_id         # Hidden 
  #     configure :playerb_id, :bson_object_id         # Hidden 
  #     configure :tournament_id, :bson_object_id         # Hidden 
  #     configure :_keywords, :serialized 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  MatchPhoto  ###

  # config.model 'MatchPhoto' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your match_photo.rb model definition

  #   # Found associations:

  #     configure :match, :belongs_to_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :image_file_name, :text         # Hidden 
  #     configure :image_content_type, :text         # Hidden 
  #     configure :image_file_size, :integer         # Hidden 
  #     configure :image_updated_at, :datetime         # Hidden 
  #     configure :image, :paperclip 
  #     configure :image_fingerprint, :text 
  #     configure :_type, :text         # Hidden 
  #     configure :main_image, :boolean 
  #     configure :match_id, :bson_object_id         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Photo  ###

  # config.model 'Photo' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your photo.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :image_file_name, :text         # Hidden 
  #     configure :image_content_type, :text         # Hidden 
  #     configure :image_file_size, :integer         # Hidden 
  #     configure :image_updated_at, :datetime         # Hidden 
  #     configure :image, :paperclip 
  #     configure :image_fingerprint, :text 
  #     configure :_type, :text         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Post  ###

  # config.model 'Post' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your post.rb model definition

  #   # Found associations:

  #     configure :created_by, :belongs_to_association 
  #     configure :comments, :has_many_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :title, :string 
  #     configure :body, :text 
  #     configure :category, :text 
  #     configure :main_image_file_name, :text         # Hidden 
  #     configure :main_image_content_type, :text         # Hidden 
  #     configure :main_image_file_size, :integer         # Hidden 
  #     configure :main_image_updated_at, :datetime         # Hidden 
  #     configure :main_image, :paperclip 
  #     configure :main_image_fingerprint, :text 
  #     configure :_keywords, :serialized 
  #     configure :created_by_id, :bson_object_id         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  PostCategory  ###

  # config.model 'PostCategory' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your post_category.rb model definition

  #   # Found associations:



  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Provider  ###

  # config.model 'Provider' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your provider.rb model definition

  #   # Found associations:

  #     configure :user, :belongs_to_association 
  #     configure :social_friends, :has_many_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :provider, :text 
  #     configure :uid, :text 
  #     configure :name, :string 
  #     configure :email, :text 
  #     configure :provider_user_name, :text 
  #     configure :url_provider, :text 
  #     configure :image_url, :text 
  #     configure :access_token, :text 
  #     configure :secret, :text 
  #     configure :user_id, :bson_object_id         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  SocialFriend  ###

  # config.model 'SocialFriend' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your social_friend.rb model definition

  #   # Found associations:

  #     configure :provider, :belongs_to_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :provider_id, :bson_object_id         # Hidden 
  #     configure :uid, :text 
  #     configure :name, :string 
  #     configure :image_url, :text 
  #     configure :email, :text 
  #     configure :provider_name, :text 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Standing  ###

  # config.model 'Standing' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your standing.rb model definition

  #   # Found associations:

  #     configure :tournament, :belongs_to_association 
  #     configure :team, :belongs_to_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :position, :integer 
  #     configure :point, :integer 
  #     configure :played, :integer 
  #     configure :win, :integer 
  #     configure :lose, :integer 
  #     configure :draw, :integer 
  #     configure :tournament_id, :bson_object_id         # Hidden 
  #     configure :team_id, :bson_object_id         # Hidden 
  #     configure :_keywords, :serialized 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Team  ###

  # config.model 'Team' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your team.rb model definition

  #   # Found associations:

  #     configure :tournaments, :has_and_belongs_to_many_association 
  #     configure :groups, :has_and_belongs_to_many_association 
  #     configure :team_photos, :has_many_association 
  #     configure :home_matches, :has_many_association 
  #     configure :guest_matches, :has_many_association 
  #     configure :standings, :has_many_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :name, :string 
  #     configure :players, :text 
  #     configure :description, :text 
  #     configure :short_name, :text 
  #     configure :short_description, :text 
  #     configure :tournament_ids, :serialized         # Hidden 
  #     configure :group_ids, :serialized         # Hidden 
  #     configure :main_image_file_name, :text         # Hidden 
  #     configure :main_image_content_type, :text         # Hidden 
  #     configure :main_image_file_size, :integer         # Hidden 
  #     configure :main_image_updated_at, :datetime         # Hidden 
  #     configure :main_image, :paperclip 
  #     configure :main_image_fingerprint, :text 
  #     configure :_keywords, :serialized 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  TeamPhoto  ###

  # config.model 'TeamPhoto' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your team_photo.rb model definition

  #   # Found associations:

  #     configure :team, :belongs_to_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :image_file_name, :text         # Hidden 
  #     configure :image_content_type, :text         # Hidden 
  #     configure :image_file_size, :integer         # Hidden 
  #     configure :image_updated_at, :datetime         # Hidden 
  #     configure :image, :paperclip 
  #     configure :image_fingerprint, :text 
  #     configure :_type, :text         # Hidden 
  #     configure :main_image, :boolean 
  #     configure :team_id, :bson_object_id         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Tournament  ###

  # config.model 'Tournament' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your tournament.rb model definition

  #   # Found associations:

  #     configure :teams, :has_and_belongs_to_many_association 
  #     configure :matches, :has_many_association 
  #     configure :standings, :has_many_association 
  #     configure :tournament_photos, :has_many_association 
  #     configure :groups, :has_many_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :name, :string 
  #     configure :description, :text 
  #     configure :start_time, :datetime 
  #     configure :end_time, :datetime 
  #     configure :short_description, :text 
  #     configure :team_ids, :serialized         # Hidden 
  #     configure :_keywords, :serialized 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  TournamentPhoto  ###

  # config.model 'TournamentPhoto' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your tournament_photo.rb model definition

  #   # Found associations:

  #     configure :tournament, :belongs_to_association 

  #   # Found columns:

  #     configure :_id, :bson_object_id 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :image_file_name, :text         # Hidden 
  #     configure :image_content_type, :text         # Hidden 
  #     configure :image_file_size, :integer         # Hidden 
  #     configure :image_updated_at, :datetime         # Hidden 
  #     configure :image, :paperclip 
  #     configure :image_fingerprint, :text 
  #     configure :_type, :text         # Hidden 
  #     configure :main_image, :boolean 
  #     configure :tournament_id, :bson_object_id         # Hidden 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  User  ###

  config.model 'User' do

    # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition

    # Found associations:

      configure :providers, :has_many_association 
      configure :posts, :has_many_association 
      configure :comments, :has_many_association 
      configure :friendships, :has_many_association 
      configure :bet_scores, :has_many_association 

    # Found columns:

      configure :_id, :bson_object_id 
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      configure :email, :text 
      configure :password, :password         # Hidden 
      configure :password_confirmation, :password         # Hidden 
      configure :reset_password_token, :text         # Hidden 
      configure :reset_password_sent_at, :datetime 
      configure :remember_created_at, :datetime 
      configure :sign_in_count, :integer 
      configure :current_sign_in_at, :datetime 
      configure :last_sign_in_at, :datetime 
      configure :current_sign_in_ip, :text 
      configure :last_sign_in_ip, :text 
      configure :name, :string 
      configure :about_me, :text 
      configure :admin, :boolean 
      configure :lose, :float 
      configure :win, :float 
      configure :paid, :float 
      configure :avatar_file_name, :text         # Hidden 
      configure :avatar_content_type, :text         # Hidden 
      configure :avatar_file_size, :integer         # Hidden 
      configure :avatar_updated_at, :datetime         # Hidden 
      configure :avatar, :paperclip 
      configure :avatar_fingerprint, :text 
      configure :confirmation_token, :text 
      configure :confirmed_at, :datetime 
      configure :confirmation_sent_at, :datetime 
      configure :unconfirmed_email, :text 
      configure :remember_me, :boolean 
      configure :_keywords, :serialized 

    # Cross-section configuration:

      # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
      # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
      # label_plural 'My models'      # Same, plural
      # weight 0                      # Navigation priority. Bigger is higher.
      # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
      # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

    # Section specific configuration:

      list do
        include_fields :avatar, :name, :email, :lose, :win, :paid
        # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
        # items_per_page 100    # Override default_items_per_page
        # sort_by :id           # Sort column (default is primary key)
        # sort_reverse true     # Sort direction (default is true for primary key, last created first)
      end
      show do; end
      edit do; end
      export do; end
      # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
      # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
      # using `field` instead of `configure` will exclude all other fields and force the ordering
  end

end
