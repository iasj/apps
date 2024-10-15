
appsroot=/iasj/apps/apps
appsbash=/iasj/apps/bash
if test ! -d $appsroot/imux;then
  git clone https://gitlab.com/iasj/imux
  mv imux $appsroot
fi
ln -sf ../apps/imux/imux $appsroot/../biny/imux

if grep "imux" $appsbash > /dev/null;then exit 0;fi
echo "# Application: imux {" >> $appsbash
echo >> $appsbash
echo 'complete -W "$(ls ~/.config/imux)" imux' >> $appsbash
echo >> $appsbash
echo "# end-imux }" >> $appsbash
sh $appsroot/../init/fix.sh
