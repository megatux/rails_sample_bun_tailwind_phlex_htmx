# frozen_string_literal: true

class Articles::IndexView < ApplicationView
  def template
    div(class: "h-16 flex items-center justify-between") {
      h1(class: "p-2 font-mono font-bold font-lg font-bold") { "Articles index" }

      button("hx-post": articles_path, "hx-target": "#article-list", "hx-swap": "afterbegin",
        class: "font-mono rounded border-2 border-black bg-indigo-200 p-1 text-sm transition-colors focus-ring-2 focus:ring-indigo-800 hover:bg-indigo-100") {
        plain "Add new article"
      }
    }

    section(id: "article-list") {
      3.times do
        render ArticleComponent.new
      end
    }
  end
end
