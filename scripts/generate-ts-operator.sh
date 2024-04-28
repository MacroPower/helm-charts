rm -rf tmp
mkdir -p tmp
git clone --depth=1 https://github.com/tailscale/tailscale tmp/tailscale
rm -rf charts/tailscale-operator/**/*.yaml
cp -r tmp/tailscale/cmd/k8s-operator/deploy/chart/* charts/tailscale-operator
cp tmp/tailscale/LICENSE charts/tailscale-operator/LICENSE
rm -rf tmp
