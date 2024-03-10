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

      body(class: "bg-blue-100", "hx-headers": "{\"X-CSRF-Token\": \"#{helpers.form_authenticity_token}\"}") do
        main(class: "m-4 bg-slate-100", &block)
      end

      footer(class: "m-4") {
        p { "Copyright Cristian Molina #{Time.zone.now.year}" }
      }
    end
  end
end
