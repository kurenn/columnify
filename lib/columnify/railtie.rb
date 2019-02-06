# frozen_string_literal: true

module Columnify
  class Railtie < Rails::Railtie
    initializer :columnify do
      ActiveSupport.on_load(:action_view) do
        require "columnify/columnify_template"
        ActionView::Template.register_template_handler :columnify, ColumnifyHandler
      end

      ActiveSupport.on_load(:action_controller) do
        require "columnify/action_controller"
      end
    end
  end
end
