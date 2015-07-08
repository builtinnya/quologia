module ApplicationHelper
  # Creates an icon tag given an icon name and possible icon modifiers.
  # A non-breaking space entity will be put between an icon and a text.
  #
  #
  # Examples
  #
  #   fa_icon_spaced "camera-retro", text: "Take a photo"
  #   # => <i class="fa fa-camera-retro"></i> &nbsp; Take a photo
  #
  def fa_icon_spaced(names = "flag", options = {})
    classes = ["fa"]
    classes.concat Private.icon_names(names)
    classes.concat Array(options.delete(:class))
    text = options.delete(:text)
    right_icon = options.delete(:right)
    icon = content_tag(:i, nil, options.merge(:class => classes))
    Private.icon_join(icon, text, right_icon, true)
  end

  module Private
    extend ActionView::Helpers::OutputSafetyHelper

    def self.icon_join(icon, text, reverse_order = false, spaced = false)
      return icon if text.blank?
      elements = [icon, ERB::Util.html_escape(text)]
      elements.reverse! if reverse_order
      elements.insert(1, "&nbsp;".html_safe) if spaced
      safe_join(elements, " ")
    end

    def self.icon_names(names = [])
      array_value(names).map { |n| "fa-#{n}" }
    end

    def self.array_value(value = [])
      value.is_a?(Array) ? value : value.to_s.split(/\s+/)
    end
  end
end
