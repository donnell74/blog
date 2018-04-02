require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
	test "should not save the article without a title" do
		article = Article.create(text: "Testing")
		assert_not article.save
		assert_includes article.errors.messages[:title], "can't be blank"
		assert_includes article.errors.messages[:title], "is too short (minimum is 5 characters)"
		assert_equal 2, article.errors.size
	end

	test "should not save the article with short title" do
		article = Article.create(title: "bad", text: "Testing")
		assert_not article.save
		assert_includes article.errors.messages[:title], "is too short (minimum is 5 characters)"
		assert_equal 1, article.errors.size
	end

	test "should not save the article without text" do
		article = Article.create(title: "Testing")
		assert_not article.save
		assert_includes article.errors.messages[:text], "can't be blank"
		assert_equal 1, article.errors.size
	end
end
