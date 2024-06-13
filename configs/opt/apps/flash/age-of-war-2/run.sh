#!/bin/bash

SWF_PATH=$HOME/.adobe/game/age-of-war-2/age-of-war-2.swf

if [ -n "$SWF_PATH" ];then
    mkdir -p $HOME/.adobe/game/age-of-war-2/
    cp /opt/apps/flash/age-of-war-2/age-of-war-2.swf $SWF_PATH
    ruffle $SWF_PATH
else
    flashplayer $SWF_PATH
fi
