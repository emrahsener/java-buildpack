# Encoding: utf-8
# Cloud Foundry Java Buildpack
# Copyright 2013 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'time'
require 'java_buildpack/util'
require 'java_buildpack/util/download_cache'
require 'java_buildpack/util/format_duration'

module JavaBuildpack::Util

  # An extension of {DownloadCache} that is configured to use the application cache.  The application
  # cache location is defined by the second argument (<tt>ARGV[1]</tt>) to the +compile+ script.
  #
  # <b>WARNING: This cache should only by used by code run by the +compile+ script</b>
  class ApplicationCache < DownloadCache

    def initialize
      application_cache_directory = ARGV[1]
      fail 'Application cache directory is undefined' if application_cache_directory.nil?
      super(application_cache_directory)
    end

  end

end
