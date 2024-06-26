# frozen_string_literal: true

module Grape
  module Util
    module Accept
      module Header
        ALLOWED_CHARACTERS = %r{^([a-z*]+)/([a-z0-9*&\^\-_#{$ERROR_INFO}.+]+)(?:;([a-z0-9=;]+))?$}.freeze
        class << self
          # Corrected version of https://github.com/mjackson/rack-accept/blob/master/lib/rack/accept/header.rb#L40-L44
          def parse_media_type(media_type)
            # see http://tools.ietf.org/html/rfc6838#section-4.2 for allowed characters in media type names
            m = media_type&.match(ALLOWED_CHARACTERS)
            m ? [m[1], m[2], m[3] || ''] : []
          end
        end
      end
    end
  end
end
