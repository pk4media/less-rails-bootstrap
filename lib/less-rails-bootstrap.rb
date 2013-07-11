module Less
  module Rails
    module Bootstrap
      require 'less/rails/bootstrap/engine' if defined?(Rails)
    end
  end
end

require 'less-rails'
require 'less/rails/bootstrap'
