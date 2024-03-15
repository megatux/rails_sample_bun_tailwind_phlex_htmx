require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url
    assert_response :success
    assert_match "id=\"article-list\"", @response.body
  end

  test "adding an article" do
    post articles_url, xhr: true
    assert_response :success
    assert_match "text/html", @response.media_type
    assert_match "item-article", @response.body
  end
end
