chrome_package_filename = File.basename(node['chrome']['download_url'])
chrome_package_filepath = "#{Chef::Config['file_cache_path']}/#{chrome_package_filename}"

remote_file chrome_package_filepath do
  source node['chrome']['download_url']
  owner "root"
  group "root"
  mode "0644"
end

case node['platform']
when "debian", "ubuntu"
  dpkg_package "Google chrome" do
    source chrome_package_filepath
  end
else
  rpm_package "Google chrome" do
    source chrome_package_filepath
  end
end