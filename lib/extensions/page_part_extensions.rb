module Extensions
  module PagePart

    #def self.included(base)
      #base.class_eval do
        #has_many :snippet_page_parts, :dependent => :destroy, :class_name => 'Refinery::Snippets::SnippetPagePart'
        #has_many :snippets, :through => :snippet_page_parts, :order => 'position ASC', :class_name => 'Refinery::Snippets::Snippet'
      #end
    #end
    extend ActiveSupport::Concern
    included do
      self.send :has_many, :snippet_page_parts, :dependent => :destroy, :class_name => 'Refinery::Snippets::SnippetPagePart'
      self.send :has_many, :snippets, :through => :snippet_page_parts, :order => 'position ASC', :class_name => 'Refinery::Snippets::Snippet'

    end
  end
end
