# frozen_string_literal: true

class ArticlesController < ApplicationController
  layout -> { ApplicationLayout }

  def index
    articles = Article.all.order(id: :desc)
    render Articles::IndexView.new(articles)
  end

  def create
    new_article = Article.create!(
      name: Faker::Lorem.sentence, details: Faker::Lorem.paragraph, published: true, stock: 0
    )
    render ArticleComponent.new(new_article), layout: false
  end
end
