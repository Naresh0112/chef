#
# Copyright:: Copyright 2018, Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "spec_helper"

describe Chef::Resource::WindowsAdJoin do
  let(:resource) { Chef::Resource::WindowsAdJoin.new("example.com") }

  it "sets resource name as :windows_ad_join" do
    expect(resource.resource_name).to eql(:windows_ad_join)
  end

  it "sets the domain_name as its name" do
    expect(resource.domain_name).to eql("example.com")
  end

  it "only accepts FQDNs for the domain_name property" do
    expect { resource.domain_name "example" }.to raise_error(ArgumentError)
  end

  it "sets the default action as :join" do
    expect(resource.action).to eql([:join])
  end

  it "accepts :immediate, :delayed, or :never values for 'reboot' property" do
    expect { resource.reboot :immediate }.not_to raise_error
    expect { resource.reboot :delayed }.not_to raise_error
    expect { resource.reboot :never }.not_to raise_error
    expect { resource.reboot :nopenope }.to raise_error(ArgumentError)
  end
end
