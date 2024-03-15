# frozen_string_literal: true

class HeaderButtonComponent < ApplicationComponent
  def initialize(type)
    @type = type
  end

  def template
    button(class: "w-8 text-slate-900 hover:text-slate-100 hover:bg-sky-500 rounded p1 transition-colors focus-ring-2 focus:ring-slate-200") {
      case @type
      when :menu
        menu_svg
      when :user
        user_svg
      else
        plain "?"
      end
    }
  end

  private

  def menu_svg
    svg(
      data_slot: "icon",
      aria_hidden: "true",
      fill: "currentColor",
      viewbox: "0 0 24 24",
      xmlns: "http://www.w3.org/2000/svg"
    ) do |s|
      s.path(
        clip_rule: "evenodd",
        d:
          "M3 6.75A.75.75 0 0 1 3.75 6h16.5a.75.75 0 0 1 0 1.5H3.75A.75.75 0 0 1 3 6.75ZM3 12a.75.75 0 0 1 .75-.75h16.5a.75.75 0 0 1 0 1.5H3.75A.75.75 0 0 1 3 12Zm0 5.25a.75.75 0 0 1 .75-.75h16.5a.75.75 0 0 1 0 1.5H3.75a.75.75 0 0 1-.75-.75Z",
        fill_rule: "evenodd"
      )
    end
  end

  def user_svg
    svg(
      data_slot: "icon",
      aria_hidden: "true",
      fill: "currentColor",
      viewbox: "0 0 24 24",
      xmlns: "http://www.w3.org/2000/svg"
    ) do |s|
      s.path(
        clip_rule: "evenodd",
        d:
          "M7.5 6a4.5 4.5 0 1 1 9 0 4.5 4.5 0 0 1-9 0ZM3.751 20.105a8.25 8.25 0 0 1 16.498 0 .75.75 0 0 1-.437.695A18.683 18.683 0 0 1 12 22.5c-2.786 0-5.433-.608-7.812-1.7a.75.75 0 0 1-.437-.695Z",
        fill_rule: "evenodd"
      )
    end
  end
end
