# frozen_string_literal: true

class Articles::IndexView < ApplicationView
  def template
    h1 { "Articles index" }

    10.times do |i|
      article(class: "m-4 bg-slate-300") {
        h3 { "This is the element ##{i}" }
      }
    end

    button("hx-post": articles_path, "hx-swap": "beforebegin",
      class: "font-mono rounded border-2 border-black bg-red-200 p-2 m-2") {
      plain "Click to add an Article"
    }
  end
end
