require 'spec_helper'

describe package('rpm-build') do
  it { should be_installed }
end

describe file('/home/vagrant/rpmbuild/SOURCES') do
  it { should be_directory }
  it { should be_owned_by 'vagrant'}
  it { should be_grouped_into 'vagrant'}
end
