file "/etc/zookeeper/conf/myid" do
  content "#{node["zkid"]}"
end

execute "add conf to /etc/zookeeper/conf/zoo.cfg" do
  user "root"
  command "echo #{node["master_ips"].map.with_index(1){|ip,i|"server.#{i}=#{ip}"}.join("\n")}:2888:3888 >> /etc/zookeeper/conf/zoo.cfg"
end

service "zookeeper" do
  action :restart
end

file "/etc/mesos/zk" do
  content "zk://#{node["master_ips"].join(",")}:2181/mesos"
end

file "/etc/mesos-master/quorum" do
  content "1"
end

file "/etc/mesos-master/hostname" do
  content node["host_ip"]
end

file "/etc/mesos-master/hostname_lookup" do
  content "false"
end

file "/etc/mesos-master/ip" do
  content node["host_ip"]
end

file "/etc/mesos-master/cluster" do
  content "Cluster01"
end

service "mesos-slave" do
  action :stop
end

file "/etc/init/mesos-slave.override" do
  content "manual"
end

service "mesos-master" do
  action :restart
end
