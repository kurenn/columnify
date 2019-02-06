# frozen_string_literal: true

require "action_controller"

ActionController::Renderers.add :xls do |filename, options|
  # force layout false
  options[:layout] = false

  # disposition / filename
  disposition = options.delete(:disposition) || "attachment"
  file_name = options.delete(:filename) || "#{filename.gsub(/^.*\//, "")}.xls"

  send_data render_to_string(options), type: Columnify::Mime::XLS, filename: file_name, disposition: disposition
end
