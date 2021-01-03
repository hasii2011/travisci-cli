#!/usr/local/bin/bash

function changeToProjectRoot {

    export areHere=`basename ${PWD}`
    if [[ ${areHere} = "scripts" ]]; then
        cd ..
    fi
}

changeToProjectRoot

#
#  Assumes python 3 is on PATH
#
clear

if [[ $# -eq 0 ]] ; then
        echo "in alias mode"
        rm -rf build dist
        # python3 setup-py2app.py py2app -A --iconfile src/org/pyut/resources/img/Pyut.icns
        python3 setup.py py2app -A
else
    if [[ ${1} = 'deploy' ]] ; then
            echo "in deploy mode"
            rm -rf build dist
            # python3 setup-py2app.py py2app --packages=click,PyTravisCI --iconfile src/org/pyut/resources/img/Pyut.icns
            python3 setup.py py2app --packages=click,PyTravisCI
    else
        echo "Unknown command line arguments"
    fi
# rm -rf src/UNKNOWN.egg-info
fi
