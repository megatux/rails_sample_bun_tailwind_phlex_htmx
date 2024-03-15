# frozen_string_literal: true

require "faker"

class ArticleComponent < ApplicationComponent
  ARTICLE_STYLE = "mb-2 bg-blue-600 rounded border-solid border-2 border-black item-article"
  HEADER_STYLE = "text-left text-slate-200 pl-2 font-semibold"

  def template
    article(class: ARTICLE_STYLE) {
      h3(class: HEADER_STYLE) {
        i { Faker::Lorem.sentence }
      }
      p(class: "bg-slate-200 p-4") { Faker::Lorem.paragraph }
    }
  end
end
