# frozen_string_literal: true

class ArticlesController < ApplicationController
  layout -> { ApplicationLayout }

  def index
    render Articles::IndexView.new(nil)
  end

  def create
    new_article = Article.create!(
      name: Faker::Lorem.sentence, details: Faker::Lorem.paragraph, published: true, stock: 0
    )
    render ArticleComponent.new(new_article), layout: false
  end

  def items
    articles = Article.all.order(id: :desc)
    sleep 1 # this is to simulate a slow response and should be remove in a real scenario
    render Articles::IndexView.new(articles), layout: false
  end
end
