#!/bin/bash

cd packages

echo Name,Version,License
for file in *.tar; do
        tar xfO $file | perl -0777 -ne '
            $file = "'$file'";
            $file =~ /(?<package>.*)-(?<ver>\d+(\.\d+){1,4}+).tar/;
            $package = $+{package};
            $ver = $+{ver};
            $license = "unknown";
            $license = "Licensed under the same terms as Emacs" if /Licensed under the same terms as Emacs/;
            $license = "OSI-approved BSD 3-Clause" if /Distributed under the OSI-approved BSD 3-Clause License/;
            $license = "Public domain" if /This is free and unencumbered software released into the public domain./;
            $license = "BSD 3-Clause" if /Redistribution and use in source and binary forms, with or without\
.{0,20}?modification, are permitted provided that the following conditions\
.{0,20}?are met.{0,100}?Redistributions of source code must retain the above copyright\
.{0,100}?Redistributions in binary form must reproduce the above copyright\
.{0,200}?The name of the author may not be used to endorse or promote products\
.{0,200}?THIS SOFTWARE IS PROVIDED BY THE AUTHOR/si;
            $license = "MIT" if /The MIT License \(MIT\)|Permission is hereby granted, free of charge.{0,500}?without restriction, including without limitation the rights.{0,100}?to use, copy, modify, merge, publish,.{0,500}?The above copyright notice and this permission notice shall be included in|lsp-clangd\.el/si;
            $license = "GPL v$+{gplver} or later" if /GNU General Public License.{0,100}?either version (?<gplver>\d).{0,50}?or.{0,20}?\(at.{0,20}?your.{0,20}?option\).{0,50}?any.{0,50}?later.{0,50}?version|GPL (?<gplver>\d) or later \(free software\)|GNU General Public License >= (?<gplver>\d)/si;
            print "$package,$ver,$license\n";
        '
done
# lsp-clangd.el - see https://github.com/emacs-lsp/lsp-clangd/blob/master/LICENSE (MIT)
