FROM ubuntu:18.04

RUN \
  apt-get update && apt-get -y dist-upgrade && \
  apt-get install -y curl build-essential libreadline-dev unzip passwd && apt-get autoclean && apt-get autoremove && \
  mkdir lua_build && cd lua_build && \
  curl -R -O https://www.lua.org/ftp/lua-5.3.5.tar.gz && \
  tar xf lua-5.3.5.tar.gz && rm -f lua-5.3.5.tar.gz && \
  cd lua-5.3.5 && \
  make linux test && \
  make install local && \
  cd / && rm -rf /lua_build && \
  mkdir luarocks_build && cd luarocks_build && \
  curl -R -O https://luarocks.github.io/luarocks/releases/luarocks-3.3.1.tar.gz && \
  tar xf luarocks-3.3.1.tar.gz && rm -f luarocks-3.3.1.tar.gz && \
  cd luarocks-3.3.1 && \
  ./configure && \
  make && \
  make install && \
  cd ../../ && rm -rf ./luarocks_build
