# frozen_string_literal: true

class Articles::IndexView < ApplicationView
  HEAD_STYLE = "p-2 font-mono font-bold font-lg font-bold"
  BUTTON_STYLE = "font-mono rounded border-2 border-black bg-indigo-200 p-1 text-sm transition-colors focus-ring-2 focus:ring-indigo-800 hover:bg-indigo-100"

  def template
    div(class: "h-16 flex items-center justify-between") {
      h1(class: HEAD_STYLE) { "Articles index" }

      button("hx-post": articles_path, "hx-target": "#article-list", "hx-swap": "afterbegin",
        class: BUTTON_STYLE) {
        plain "Add new article"
      }
    }

    section(id: "article-list") {
      articles.each { |el| render el }
    }
  end

  private

  def articles
    3.times.map do
      ArticleComponent.new
    end
  end
end
