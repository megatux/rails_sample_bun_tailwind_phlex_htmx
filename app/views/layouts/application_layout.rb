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

      body do
        main(class: "bg-slate-100", &block)
      end
    end
  end
end
