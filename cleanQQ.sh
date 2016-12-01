#!/bin/bash
WINEPREFIX_DIR=$HOME/.longene/qq/

function runhelp
{
  echo "************************************************************************"
  echo "*    Help"
  echo "*    Commands:"
  echo "*    -c/--clean 清理数据"
  echo "************************************************************************"

}


function runclean
{
  env WINEDLLPATH=/opt/longene/qq/wine-lib/lib/wine WINESERVER=/opt/longene/qq/wine-lib/bin/wineserver WINEPREFIX=$WINEPREFIX_DIR wine $WINEPREFIX_DIR/drive_c/Program\ Files/Tencent/QQ/Bin/QQ.exe >$HOME/Longene_qq.log 2>&1
  sleep 5
  bash /opt/longene/qq/qq.sh&
  sleep 5
  rm $WINEPREFIX_DIR/dosdevices/*::

}

function runapp
{
  bash /opt/longene/qq/qq.sh&

}


case $1 in 
  "--clean"| "-c")
    runclean
    ;;
  "--kill"| "-k")
    bash /opt/longene/qq/qq.sh -k
    ;;
  "--help"| "-h")
    runhelp
    ;;
  *)
    if [ -z $1  ];then        
      runapp
    else
      echo "Invalid option:$1"
      runhelp            
    fi
    ;;
esac
