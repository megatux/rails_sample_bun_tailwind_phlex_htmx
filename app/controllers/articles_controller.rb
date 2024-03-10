# frozen_string_literal: true

class ArticlesController < ApplicationController
  layout -> { ApplicationLayout }

  def index
    render Articles::IndexView.new
  end

  def show
    render Articles::ShowView.new
  end

  def create
    render plain: "<br>A new article added at #{Time.zone.now}<br>"
  end
end
