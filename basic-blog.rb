require 'date'

class Blog
	attr_accessor :blog_contents

	def initialize 
		@blog_contents = []
	end

	def add_post(new_post)
		@blog_contents.push(new_post)
		sort_posts
	end

	def sort_posts
	 	@blog_contents = @blog_contents.sort { |x,y| y.date <=> x.date }
	end

	def publish
		@blog_contents.each do |post|
			if post.sponsored
				puts "/*/*/*/*/*/#{post.title}/*/*/*/*/*/"
			else
				puts "Post #{post.title}"
			end
			puts "*****************************"
			puts "Post #{post.text}"
			puts "-----------------------------"
		end
		puts "1 | 2 | 3"
		puts ">" 
	end
end

class Post
	attr_accessor :title, :date, :text, :sponsored
	def initialize (title, date, text, sponsored = false)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end
end


my_blog = Blog.new
my_blog.add_post(Post.new("Title 1", Date.new(2014, 3, 17), "1 Texto de ejemplo"))
my_blog.add_post(Post.new("Title 2", Date.new(2015, 5, 3), "2 Texto de ejemplo", true))
my_blog.add_post(Post.new("Title 3", Date.new(2013, 2, 4), "3 Texto de ejemplo"))
my_blog.add_post(Post.new("Title 4", Date.new(2012, 3, 16), "4 Texto de ejemplo"))
my_blog.add_post(Post.new("Title 5", Date.new(2011, 5, 3), "5 Texto de ejemplo"))
my_blog.add_post(Post.new("Title 6", Date.new(2010, 1, 4), "6 Texto de ejemplo", true))

my_blog.publish