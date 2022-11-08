require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    fake_content = <<-LOREM
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rutrum
      enim vitae libero laoreet, quis rhoncus nisi tempor. Ut convallis leo vitae
      sapien dignissim efficitur. Nam eget mi diam. Pellentesque nec egestas justo,
      sed egestas tellus. Phasellus porttitor eget tellus.
    LOREM
    @post = Post.new(title: 'Example Title', content: fake_content )
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
    @post.content = @post.content * 10
    assert_not @post.valid?
  end
end
