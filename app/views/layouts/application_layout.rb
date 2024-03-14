# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def template(&block)
    doctype

    html do
      head do
        title { "Rails demo" }
        meta name: "viewport", content: "width=device-width,initial-scale=1"
        csp_meta_tag
        csrf_meta_tags
        javascript_include_tag "application"
        stylesheet_link_tag "application"
        stylesheet_link_tag "tailwind", "inter-font"
      end

      body(class: "bg-slate-800", "hx-headers": "{\"X-CSRF-Token\": \"#{helpers.form_authenticity_token}\"}") do
        header(class: "bg-white px-6 shadow") {
          div(class: "h-16 flex items-center justify-between") {
            render HeaderButtonComponent.new(:menu)
            h1(class: "text-xl font-bold") { "Rails demo" }
            render HeaderButtonComponent.new(:user)
          }
        }
        main(class: "m-4 p-4 bg-slate-400 rounded", &block)
      end

      footer(class: "bg-white px-4 shadow h-12 flex items-center") {
        p(class: "m-2 text-sm font-normal") { "© Cristian Molina - #{Time.zone.now.year}" }
      }
    end
  end
end
