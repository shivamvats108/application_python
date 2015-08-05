#
# Copyright 2015, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'poise/utils'
require 'poise_application/service_mixin'

require 'poise_application_python/app_mixin'


module PoiseApplicationPython
  # A helper mixin for Python service resources and providers.
  #
  # @since 4.0.0
  module ServiceMixin
    include Poise::Utils::ResourceProviderMixin

    # A helper mixin for Python service resources.
    module Resource
      include PoiseApplication::ServiceMixin::Resource
      include PoiseApplicationPython::AppMixin::Resource
    end

    # A helper mixin for Python service providers.
    module Provider
      include PoiseApplication::ServiceMixin::Provider
      include PoiseApplicationPython::AppMixin::Provider

      # Include the Python environment variables
      def service_options(resource)
        super
        resource.environment.update(new_resource.parent_python.python_environment) if new_resource.parent_python
      end

    end
  end
end
