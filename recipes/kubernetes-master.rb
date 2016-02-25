execute "add conf to /etc/zookeeper/conf/zoo.cfg" do
  user "root"
  command "echo #{node["master_ips"].map.with_index(1){|ip,i|"server.#{i}=#{ip}"}.join("\n")}:2888:3888 >> /etc/zookeeper/conf/zoo.cfg"
end
