# frozen_string_literal: true

module RailsWebCache
  module KeysHelper
    def expired_at(value)
      return 'n/a' unless value.present?
      content_tag(:time,
                  value.strftime('%d %b %Y - %H:%M'),
                  datetime: value.iso8601)
    end

    def check_box_key(value, id)
      (label_tag "key-#{id}", value, class: 'd-none').concat(
        check_box_tag('keys[]', value, nil, id: "key-#{id}")
      )
    end
  end
end
