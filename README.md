params_action_cache
===================

Rails action caching for requests with different params

Usage:

````ruby
class Foo extends ActionController::Base
  caches_action :index, params: [:page, per_page]

  def index
    Foos.paginate(params[:page], params[:per_page])
  end
end
````

Responses to `/foo/index?page=1`, `/foo/index?page=2`, etc. will be cached separately.
Params not specified in the options are ignored.
