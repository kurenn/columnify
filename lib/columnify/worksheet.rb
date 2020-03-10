# frozen_string_literal: true

module Columnify
  class Worksheet

    def initialize(resources, *args)
      @resources = resorurces
      @column_names = args
      @buffer = StringIO.new
      @workbook ||= Spreadsheet::Workbook.new
    end

    def create
      inject_column_names
      inject_data
      write_workbook_buffer
      read
    end

    private

    def read
      @buffer.rewind
      @buffer.read
    end

    def write_workbook_buffer
      @workbook.write(@buffer)
    end

    def inject_column_names
      sheet.row(0).concat humanized_columns
    end

    def inject_data
      @resources.each_with_index do |resource, index|
        @column_names.each do |method_name|
          sheet.row(index + 1).push(resource.send(method_name))
        end
      end
    end

    def humanized_columns
      @humanized_columns ||= @column_names.map(&:to_s).map(&:humanize)
    end

    def sheet
      @sheet ||= workbook.create_worksheet(name: worksheet_name)
    end

    def worksheet_name
      Time.now.to_i.to_s
    end
  end
end
