require 'spec_helper'
require 'ruby/helper/resources/resource'

describe Ruby::Helper::Resource do
  validate_ext = -> (path, avail_exts) { Ruby::Helper::Resource.validate_ext(path, avail_exts) }
  context 'validate_ext' do
    it 'handles proper exts well' do
      expect(validate_ext.('test.png', ['png'])).not_to be nil
    end

    it 'handles bad exts correctly' do
      expect(validate_ext.('', ['jpg'])).to be nil
    end

    it 'handles many exts' do
      expect(validate_ext.('test.jpg', ['jpg', 'something_else'])).not_to be nil
    end
  end
end
