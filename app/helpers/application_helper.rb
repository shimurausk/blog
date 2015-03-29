module ApplicationHelper

	def tag_cloud(tags, classes)

		max = tags.sort_by(&:count).last

		tags.each do |tag|
							#binding.pry
			index = tag.count.to_f / max.count * (classes.size-1)

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

end
