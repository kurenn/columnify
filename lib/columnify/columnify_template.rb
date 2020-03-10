# frozen_string_literal: true

require 'action_dispatch/http/mime_type'
require 'spreadsheet'
require 'worksheet'

class ColumnifyTemplate
  class << self
    attr_accessor :template_lookup_options
  end

  self.template_lookup_options = {handlers: [:columnify]}

  def initialize(context, *args)
    @context = context
    super(*args)
  end

  def worksheet(resources, *args)
    worksheet = Columnify::Worksheet.new(resources, *args)
    worksheet.create
  end
end

class ColumnifyHandler
  cattr_accessor :default_format
  self.default_format = Columnify::Mime::XLS

  def self.call(template, source = nil)
    source ||= template.source
    # this juggling is required to keep line numbers right in the error
    %{__already_defined = defined?(spreadsheet); spreadsheet||=ColumnifyTemplate.new(self); #{source}}
  end
end
