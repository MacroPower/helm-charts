rm -rf tmp
mkdir -p tmp
git clone --depth=1 https:///github.com/opencloud-eu/helm tmp/opencloud
rm -rf charts/opencloud/**/*.yaml
rm tmp/opencloud/charts/opencloud/README.md
cp -r tmp/opencloud/charts/opencloud/* charts/opencloud
cp tmp/opencloud/LICENSE charts/opencloud/LICENSE
rm -rf tmp
