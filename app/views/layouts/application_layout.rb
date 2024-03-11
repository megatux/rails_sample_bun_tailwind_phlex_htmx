# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def template(&block)
    doctype

    html do
      head do
        title { "You're awesome" }
        meta name: "viewport", content: "width=device-width,initial-scale=1"
        csp_meta_tag
        csrf_meta_tags
        javascript_include_tag "application"
        stylesheet_link_tag "application"
        stylesheet_link_tag "tailwind", "inter-font"
      end

      body(class: "bg-blue-300", "hx-headers": "{\"X-CSRF-Token\": \"#{helpers.form_authenticity_token}\"}") do
        h1(class: "bg-indigo-500 border-2 border-black text-xl text-yellow-100") {
          p(class: "m-2") { "Welcome to another Rails demo" }
        }
        main(class: "m-4 bg-slate-100", &block)
      end

      footer(class: "bg-indigo-500 border-2 border-black") {
        p(class: "m-2") { "Copyright Cristian Molina - #{Time.zone.now.year}" }
      }
    end
  end
end
