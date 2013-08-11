require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  def test_should_not_be_valid_without_name 
    s = Story.create(:name => nil, :link => 'http://testsubmission.com')
    assert s.errors.on(:name)
  end

  def test_should_not_be_valid_without_link
    s = Story.create(:name => 'Juye homepage', :link => nil)
    assert s.errors.on(:link)
  end

  def test_should_create_story
    s = Story.create(:name => 'Juye\'s homepage', :link => 'http://www.juyekim.com')
    assert s.valid?
  end

  def test_should_be_associated_with_user
    assert_equal users(:patrick), stories(:one).user
  end
end
