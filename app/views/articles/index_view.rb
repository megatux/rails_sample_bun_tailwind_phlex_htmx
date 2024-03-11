# frozen_string_literal: true

class Articles::IndexView < ApplicationView
  def template
    h1(class: "p-2 font-mono font-lg font-bold") { "Articles index" }

    button("hx-post": articles_path, "hx-swap": "afterend",
      class: "font-mono rounded border-2 border-black bg-red-200 p-1 m-2 text-sm") {
      plain "Click to add a new article"
    }

    3.times do
      render ArticleComponent.new
    end
  end
end
