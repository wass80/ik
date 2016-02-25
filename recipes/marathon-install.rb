execute "install marathon" do
  user "root"
  command <<EOL
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y \
  python-software-properties software-properties-common
apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)
echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | 
  sudo tee /etc/apt/sources.list.d/mesosphere.list

echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
add-apt-repository -y ppa:webupd8team/java
apt-get update -y
apt-get install -y oracle-java8-installer oracle-java8-set-default
EOL
not_if "dpkg -s marathon"
end

package "marathon"

service "marathon" do
  action :restart
end
