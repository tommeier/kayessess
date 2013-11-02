module Kayessess

  require 'pry'

  # The SectionsController is responsible for providing actions for listing and
  # showing sections of the styleguide
  class SectionsController < Kayessess::ApplicationController
    before_filter :find_node, only: [:show, :example]

    def index
      @sections = @styleguide.sections
    end

    def show
      if @node.is_section?
        render(:partial => "section", :locals => {:section => section})
      end
    end

    def example
      render layout: 'kayessess/example'
    end

  private

    def find_node
      @node = @styleguide.section(params[:id])

      raise not_found if @node.nil?
    end
  end
end
