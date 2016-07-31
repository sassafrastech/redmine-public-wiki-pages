module WikiControllerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)
    base.skip_before_filter :authorize, if: :not_logged_in_and_page_is_public?
  end

  module InstanceMethods
    def not_logged_in_and_page_is_public?
      return false unless User.current
      find_existing_page

      # Calling find_existing_page may result in a call to render if page not found or page redirects.
      # We need to not follow that because find_existing_page may be called again during regular loading,
      # and that would raise an error. This is how you cancel a previous render/redirect.
      self.response_body = nil

      @page.present? && @page.public?
    end
  end
end
