require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	test "should not save the comment without an article" do
		comment = Comment.create(commenter: "Testing", body: "Testing")	
		assert_not comment.save
		assert_includes comment.errors.messages[:article], "must exist"
		assert_equal 1, comment.errors.size
	end

	test "should not save the comment without a commenter" do
		article = defaultArticleInstance
		comment = Comment.create(body: "Testing", article_id: article.id)	
		assert_not comment.save
		assert_includes comment.errors.messages[:commenter], "can't be blank"
		assert_equal 1, comment.errors.size
	end

	test "should not save the comment without body" do
		article = defaultArticleInstance
		comment = Comment.create(commenter: "Testing", article_id: article.id)
		assert_not comment.save
		assert_includes comment.errors.messages[:body], "can't be blank"
		assert_equal 1, comment.errors.size
	end

	private def defaultArticleInstance
		return Article.create(title: "Testing", text: "Testing")
	end
end
