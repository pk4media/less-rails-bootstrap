require 'rails'

require File.dirname(__FILE__) + '/twitter-bootstrap-breadcrumbs.rb'
require File.dirname(__FILE__) + '/../../../../app/helpers/flash_block_helper.rb'
# require File.dirname(__FILE__) + '/../../../../app/helpers/modal_helper.rb'
# require File.dirname(__FILE__) + '/../../../../app/helpers/navbar_helper.rb'

module Less
  module Rails
    module Bootstrap
      class Engine < ::Rails::Engine
        
        initializer 'less-rails-bootstrap.setup', :after => 'less-rails.after.load_config_initializers', :group => :all do |app|
          app.config.less.paths << File.join(config.root, 'vendor', 'frameworks')
        end

        initializer 'less-rails-bootstrap.setup_helpers' do |app|
          app.config.to_prepare do
            ActionController::Base.send :include, BreadCrumbs
            ActionController::Base.send :helper, FlashBlockHelper
            # ActionController::Base.send :helper, ModalHelper
            # ActionController::Base.send :helper, NavbarHelper
            # ActionController::Base.send :helper, BadgeLabelHelper
            #ActionController::Base.send :helper_method, :render_breadcrumbs
          end
        end
        
      end
    end
  end
end
