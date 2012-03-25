require 'refinerycms-snippets'

module Refinery
  module Snippets
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Snippets

      config.before_initialize do
        require 'extensions/page_extensions'
        require 'extensions/page_part_extensions'
        require 'extensions/pages_helper_extensions'
      end

      initializer "register refinery_snippets plugin", :after => :set_routes_reloader do |app|

        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinery_snippets"
          plugin.url = {:controller => '/refinery/snippets/admin/snippets'}
          plugin.menu_match = /^\/?(admin|refinery)\/snippets/
          plugin.activity = [{
                               :class_name => :'Refinery::Snippets::Snippet',
                               :url => "refinery.edit_snippets_admin_snippet_path"
                             }, {
                               :class_name => :'Refinery::Snippets::SnippetPagePart',
                               :nested_with => ['snippet'],
                               :url => "refinery.edit_snippets_admin_snippet_snippets_page_part_path"
                             }]
        end
      end

      config.to_prepare do
        Refinery::Page.send :include, Extensions::Page
        Refinery::PagePart.send :include, Extensions::PagePart
        Refinery::PagesHelper.send :include, Extensions::PagesHelper
      end

      config.after_initialize do
        Refinery::Pages::Tab.register do |tab|
          tab.name = "snippets"
          tab.partial = "/refinery/snippets/admin/pages/tabs/snippets"
        end

        Refinery.register_engine(Refinery::Snippets)
      end
    end
  end
end
