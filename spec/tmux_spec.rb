require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

describe command('tmux -V') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should contain('tmux') }
end

describe package('reattach-to-user-namespace'), :if => os[:family] == 'darwin' do
  it { should be_installed }
end
