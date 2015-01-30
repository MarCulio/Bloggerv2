module ArticlesHelper

	def article_params
		binding.pry
  		params.require(:article).permit(:title, :body, :tag_list, :image)
	end

end