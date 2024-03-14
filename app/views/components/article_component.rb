# frozen_string_literal: true

require "faker"

class ArticleComponent < ApplicationComponent
  def template
    article(id: Time.now.to_i, class: "mb-2 bg-blue-600 rounded border-solid border-2 border-black item-article") {
      h3(class: "text-left text-slate-200 pl-2 font-semibold") {
        i { Faker::Lorem.sentence }
      }
      p(class: "bg-slate-200 p-4") { Faker::Lorem.paragraph }
    }
  end
end
