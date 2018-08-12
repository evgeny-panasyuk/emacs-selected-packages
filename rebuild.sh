#!/bin/bash

export HOME=$(cd $(dirname "$0"); pwd)
git clean -dfx .emacs.d
#emacs --eval="(require 'package)" --eval="(package-refresh-contents)" &&
# echo emacs --eval '(setq user-emacs-directory "'$(cd $(dirname "$0"); pwd)'")'  #rebuild.el
rm -rf ./packages
emacs -batch -l rebuild.el
./license.sh > LICENSE.csv
