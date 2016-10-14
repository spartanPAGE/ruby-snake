require 'spec_helper'
require 'ruby/helper/resources/resource'

describe Ruby::Helper::Resource do
  validate_ext = -> (path, avail_exts) { Ruby::Helper::Resource.validate_ext(path, avail_exts) }
  it 'validates file ext correctly' do
    expect(validate_ext.('test.png', ['png'])).not_to be nil
  end

end
