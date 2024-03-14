# frozen_string_literal: true

class ArticlesController < ApplicationController
  layout -> { ApplicationLayout }

  def index
    render Articles::IndexView.new
  end

  def create
    render ArticleComponent.new, layout: false
  end
end
