execute "install marathon" do
  user "root"
  command <<EOL
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
add-apt-repository -y ppa:webupd8team/java
apt-get update -y
apt-get install -y oracle-java8-installer oracle-java8-set-default
EOL
not_if "dpkg -s oracle-java8-installer"
end
