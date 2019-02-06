# frozen_string_literal: true

require "action_dispatch/http/mime_type"
require "spreadsheet"

class ColumnifyTemplate
  class << self
    attr_accessor :template_lookup_options
  end

  self.template_lookup_options = {handlers: [:columnify]}

  def initialize(context, *args)
    @context = context
    super(*args)
  end

  def workbook
    @workbook ||= Spreadsheet::Workbook.new
  end

  def worksheet(resources, *args)
    sheet = workbook.create_worksheet(name: worksheet_name.to_s)

    sheet.row(0).concat args.map(&:to_s).map(&:humanize)

    resources.each_with_index do |resource, index|
      args.each do |method_name|
        sheet.row(index + 1).push(resource.send(method_name))
      end
    end

    buffer = StringIO.new
    workbook.write(buffer)
    buffer.rewind
    buffer.read
  end

  private

  def worksheet_name
    DateTime.now.to_i
  end
end

class ColumnifyHandler
  cattr_accessor :default_format
  self.default_format = "application/xls"

  def self.call(template, source = nil)
    source ||= template.source
    # this juggling is required to keep line numbers right in the error
    %{__already_defined = defined?(spreadsheet); spreadsheet||=ColumnifyTemplate.new(self); #{source}}
  end
end
