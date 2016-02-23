execute "install mesos" do
  user "root"
  command <<EOF
apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
export DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
export CODENAME=$(lsb_release -cs)
echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | \
  sudo tee /etc/apt/sources.list.d/mesosphere.list
apt-get update
apt-get -y install mesos
EOF
end
