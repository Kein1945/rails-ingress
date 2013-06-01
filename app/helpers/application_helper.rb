module ApplicationHelper
	def will_paginate(collection = nil, options = {})
      options[:renderer] ||= BootstrapLinkRenderer
      super.try :html_safe
    end
 
    class BootstrapLinkRenderer < WillPaginate::ActionView::LinkRenderer
      protected
      
      def html_container(html)
        tag :div, tag(:ul, html), container_attributes
      end
 
      def page_number(page)
        tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
      end
 
      def previous_or_next_page(page, text, classname)
        tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
      end

      def gap
        text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
        %(<li><span class="gap">#{text}</span></li>)
      end
    end
end
