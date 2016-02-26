service "zookeeper" do
  action :stop
end

file "/etc/init/zookeeper.override" do
  content "manual"
end

file "/etc/mesos/zk" do
  content "zk://#{node["master_ips"].map{|ip|"#{ip}:2181"}.join(",")}/mesos"
end

service "mesos-master" do
  action :stop
end

file "/etc/init/mesos-master.override" do
  content "manual"
end

file "/etc/mesos-slave/containerizers" do
  content "docker,mesos"
end

file "/etc/mesos-slave/executor_registration_timeout" do
  content "5mins"
end

file "/etc/mesos-slave/hostname" do
  content node["host_ip"]
end

file "/etc/mesos-slave/ip" do
  content node["host_ip"]
end

service "mesos-slave" do
  action :restart
end
