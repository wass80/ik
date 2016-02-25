include_recipe "./go-install.rb"

git "kubernetes" do
  repository "https://github.com/kubernetes/kubernetes"
end

execute "make kubernetes" do
  cwd "kubernetes"
  command <<EOS
export KUBERNETES_CONTRIB=mesos
echo $PATH
make
EOS
end

