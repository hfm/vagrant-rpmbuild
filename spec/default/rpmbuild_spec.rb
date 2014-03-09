require 'spec_helper'

describe package('rpm-build') do
  it { should be_installed }
end

%w(
  /home/vagrant/rpmbuild
  /home/vagrant/rpmbuild/SOURCES
).each do |f|
  describe file(f) do
    it { should be_directory }
    it { should be_owned_by 'vagrant'}
    it { should be_grouped_into 'vagrant'}
  end
end
