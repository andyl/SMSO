
# Add StrongParameters protection to all models

ActiveRecord::Base.send :include, ActiveModel::ForbiddenAttributesProtection