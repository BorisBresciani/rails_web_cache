# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RailsWebCache::KeysHelper, type: :helper do
  describe 'helper' do
    it 'returns n/a value' do
      expect(helper.expired_at(nil)).to eql 'n/a'
    end

    it 'returns time tag' do
      date = Date.today
      content = content_tag(:time,
                            date.strftime('%d %b %Y - %H:%M'),
                            datetime: date.iso8601)
      expect(helper.expired_at(date)).to eql content
    end

    it 'returns check_box tag' do
      value = 'Test'
      id = 1
      content = (label_tag "key-#{id}", value, class: 'd-none').concat(
        check_box_tag('keys[]', value, nil, id: "key-#{id}")
      )
      expect(helper.check_box_key(value, id)).to eql content
    end
  end
end
