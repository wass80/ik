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
EOL
not_if "dpkg -s marathon"
end

package "marathon"

service "marathon" do
  action :restart
end
