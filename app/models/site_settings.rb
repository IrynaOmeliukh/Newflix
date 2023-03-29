require 'singleton'

class SiteSettings < ApplicationRecord
  include Singleton

  validate :only_one_instance

  singleton_class.alias_method :current, :instance

  attribute :title, :string, default: 'Newflix'

  private

  def only_one_instance
    if self.class.count > 0
      errors.add(:base, "Only one instance of MyModel is allowed.")
    end
  end
end
