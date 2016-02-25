http_request "go.tar.gz" do
  url "https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz"
  not_if "test -e go.tar.gz"
end

execute "install go1.6" do
  command <<EOS
tar -C /usr/local -xzf go.tar.gz
echo "export PATH=\\$PATH:/usr/local/go/bin" >> .bash_profile
EOS
end

file "/etc/sudoers.d/go" do
  user "root"
  owner "root"
  group "root"
  content "Defaults\tsecure_path=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin\"\n" 
end

execute "pathj" do
  command "echo $PATH"
end
