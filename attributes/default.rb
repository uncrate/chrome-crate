default['chrome']['deb64_download_url'] = 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
default['chrome']['deb32_download_url'] = 'https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb'
default['chrome']['rpm64_download_url'] = 'https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm'
default['chrome']['rpm32_download_url'] = 'https://dl.google.com/linux/direct/google-chrome-stable_current_i386.rpm'

arch = node['kernel']['machine'] =~ /x86_64/ ? "x86_64" : "i386"

case node['platform']
when "debian", "ubuntu"
  if arch == "x86_64"
    default['chrome']['download_url'] = node['chrome']['deb64_download_url']
  else
    default['chrome']['download_url'] = node['chrome']['deb32_download_url']
  end
when "centos", "redhat"
  if arch == "x86_64"
    default['chrome']['download_url'] = node['chrome']['rpm64_download_url']
  else
    default['chrome']['download_url'] = node['chrome']['rpm32_download_url']
  end
end