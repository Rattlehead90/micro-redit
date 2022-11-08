require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
  end

  test 'should have a title' do
    @post.title = '    '
    assert_not @post.valid?
  end

  test 'should have content' do
    @post.content = '      '
    assert_not @post.valid?
  end

  test 'title should be unique' do
    duplicate_post = @post.dup
    duplicate_post.title = @post.title.upcase
    @post.save
    assert_not duplicate_post.valid?
  end

  test 'title should be longer that 3 symbols' do
    @post.title = 'wtf'
    assert_not @post.valid?
  end

  test 'content should not exceed 2960 characters' do
    @post.content = 'a' * 2961
    assert_not @post.valid?
  end
end
