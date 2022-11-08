require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:one)
  end

  test 'should not be empty' do
    @comment.content = '    '
    assert_not @comment.valid?
  end

  test 'should not exceed 255 characters' do
    @comment.content = 'a' * 256
    assert_not @comment.valid?
  end
end
