execute "update apt-get" do
  user "root"
  command "apt-get update"
end
package "build-essential"
package "git"

include_recipe "java8-install.rb"
