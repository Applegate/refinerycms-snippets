module Refinery
  module Snippets
    class SnippetPagePart < ActiveRecord::Base

   #   set_table_name 'snippets_page_parts'

      delegate :title, :to => :snippet

      belongs_to :snippet, :foreign_key => :snippet_id
      belongs_to :page_part, :foreign_key => :page_part_id

      validates_uniqueness_of :snippet_id,  :scope => [:page_part_id, :before_body]

      before_save do |snippet_page_part|
        snippet_page_part.position = (Refinery::Snippets::SnippetPagePart.where('page_part_id = ?', snippet_page_part.page_part_id).maximum(:position) || -1) + 1
      end
      
      default_scope :order("position ASC")
      scope :before, where(SnippetPagePart.table_name => {:before_body => true})
      scope :after, where(SnippetPagePart.table_name => {:before_body => false})

    end
  end
end
