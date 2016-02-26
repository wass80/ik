package "wget"
execute "docker install" do
  command "wget -qO- https://get.docker.com/ | sudo sh"
  not_if "type docker"
end

