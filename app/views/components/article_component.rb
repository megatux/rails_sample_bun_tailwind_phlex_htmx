# frozen_string_literal: true

require "faker"

class ArticleComponent < ApplicationComponent
  def template
    article(class: "m-2 bg-blue-400 rounded border-solid border-2 border-black") {
      h3(class: "text-left pl-2") { "This is an article for ... #{Faker::Lorem.sentence}" }
      p(class: "bg-blue-200 p-4") { Faker::Lorem.paragraph }
    }
  end
end
