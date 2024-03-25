# frozen_string_literal: true

class Articles::IndexView < ApplicationView
  HEAD_STYLE = "p-2 font-mono font-bold font-lg font-bold"
  BUTTON_STYLE = "font-mono rounded border-2 border-black bg-indigo-200 p-1 text-sm transition-colors focus-ring-2 focus:ring-indigo-800 hover:bg-indigo-100"

  def initialize(articles = nil)
    @articles = articles
  end

  def template
    if @articles.nil?
      title_with_add_button
      load_indicator_placeholder
    else
      load_articles_section
    end
  end

  private

  def load_indicator_placeholder
    div("hx-get": items_articles_path, "hx-trigger": "load", class: "flex justify-center") {
      img(alt: "Loading items...",
        class: "htmx-indicator", width: "150", src: "/bars.svg")
    }
  end

  def load_articles_section
    section(id: "article-list", class: "grid md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4") {
      articles.each { |el| render el }
    }
  end

  def title_with_add_button
    div(class: "h-16 flex items-center justify-between") {
      h1(class: HEAD_STYLE) { "Articles index" }

      button("hx-post": articles_path, "hx-target": "#article-list", "hx-swap": "afterbegin",
        class: BUTTON_STYLE) {
        plain "Add new article"
      }
    }
  end

  def articles
    @articles.map do |article|
      ArticleComponent.new(article)
    end
  end
end
