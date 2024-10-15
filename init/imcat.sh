

url=https://github.com/stolk/imcat
imcat=/iasj/apps/apps/imcat
link="../apps/imcat/imcat ../biny/imcat"

rm -rf $imcat
git clone --quiet $url --depth=1 $imcat
cd $imcat
make
cd -
ln -sf $link
