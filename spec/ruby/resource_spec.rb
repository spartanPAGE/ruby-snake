require 'spec_helper'
require 'ruby/helper/resources/resource'

describe Ruby::Helper::Resource do
  validate_ext = lambda do |path, avail_exts|
    Ruby::Helper::Resource.validate_ext(path, avail_exts)
  end

  context 'validate_ext' do
    it 'handles proper exts well' do
      expect(validate_ext.call('test.png', ['png'])).not_to be nil
    end

    it 'handles bad exts correctly' do
      expect(validate_ext.call('', ['jpg'])).to be nil
    end

    it 'handles many exts' do
      expect(validate_ext.call('test.jpg', %w(jpg smtg_else))).not_to be nil
    end
  end
end
