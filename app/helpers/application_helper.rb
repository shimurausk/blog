module ApplicationHelper

	def tag_cloud(tags, classes)

		max = tags.sort_by(&:count).last

		tags.each do |tag|
			index = tag.count.to_f / Integer(max.count) * (classes.size-1)

			yield(tag,classes[index.round])
		end
	end

	def markdown(text)
    unless @markdown
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
      options = {
      	tables: true
      	# autolink: true,
	      # no_intra_emphasis: true,
	      # fenced_code_blocks: true,
	      # lax_html_blocks: true,
	      # strikethrough: true,
	      # superscript: true
      }
      @markdown = Redcarpet::Markdown.new(renderer,options)
    end

    @markdown.render(text).html_safe
  end

  def all_category
  	@all_category = []
    (@categories = Category.all).each do |category|
      @all_category.push(category.id)
    end
  end

  def all_tag
  	@all_tag = []
    (@tags = Tag.all).each do |tag|
      @all_tag.push([tag.name,tag.name])
    end
  end

end
