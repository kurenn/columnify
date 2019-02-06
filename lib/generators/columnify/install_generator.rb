# frozen_string_literal: true

require "rails/generators/base"

module Columnify
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def register_mime_type
        append_to_file "config/initializers/mime_types.rb",
                       %Q{Mime::Type.register "#{Columnify::Mime::XLS}", :xls}
      end
    end
  end
end
