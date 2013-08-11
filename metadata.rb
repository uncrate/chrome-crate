name             'chrome-crate'
maintainer       'John Leacox'
license          'Apache 2.0'
description      'Installs/Configures chrome'
version          '0.1.0'

%w{
  debian
  ubuntu
}.each do |os|
  supports os
end

depends 'uncrate_base'
depends 'gdebi'
