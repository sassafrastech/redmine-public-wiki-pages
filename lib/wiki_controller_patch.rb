module WikiControllerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)
    base.skip_before_filter :authorize, if: :page_is_public?
  end

  module InstanceMethods
    def page_is_public?
      true
    end
  end
end
