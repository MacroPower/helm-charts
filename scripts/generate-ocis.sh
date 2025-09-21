rm -rf tmp
mkdir -p tmp
git clone --depth=1 https://github.com/owncloud/ocis-charts tmp/owncloud
rm -rf charts/ocis/**/*.yaml
rm tmp/owncloud/charts/ocis/README.md tmp/owncloud/charts/ocis/README.md.gotmpl
cp -r tmp/owncloud/charts/ocis/* charts/ocis
cp tmp/owncloud/LICENSE charts/ocis/LICENSE
rm -rf tmp
