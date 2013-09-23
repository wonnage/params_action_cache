module ParamsActionCache
  extend ActiveSupport::Concern
  included do
    def caches_action_with_params(*actions)
      options = actions.extract_options!

      if options[:params]
        options[:cache_path] = Proc.new {|c| c.params.slice(*Array(options[:params])) }
      end

      caches_action_without_params(*actions, options)
    end

    alias_method_chain :caches_action, :params
  end
end

ActionController::Caching::Actions::ClassMethods.send(:include, ParamsActionCache)
