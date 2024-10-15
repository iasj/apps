

url=https://github.com/actionless/pikaur
pikaur=/iasj/apps/apps/pikaur
link="../apps/pikaur/pikaur.py ../biny/kaur"

rm -rf $pikaur
git clone --quiet $url --depth=1 $pikaur
ln -sf $link
