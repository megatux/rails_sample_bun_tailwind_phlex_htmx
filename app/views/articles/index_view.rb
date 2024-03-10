# frozen_string_literal: true

class Articles::IndexView < ApplicationView
  def template
    h1 { "Articles index" }

    10.times do |i|
      article(class: "m-4 bg-slate-300") {
        h3 { "This is the element ##{i}" }
      }
    end
  end
end
