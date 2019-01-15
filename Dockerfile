# MAINTAINER        linuxfish <muchunyu@luojilab.com>
# DOCKER-VERSION    0.1.0
#
# Dockerizing Python: Dockerfile for building python applications

FROM ubuntu:18.04
MAINTAINER linuxfish <muchunyu@luojilab.com>

# 中文支持
ENV LANG C.UTF-8
# enable nointeractive, required by tzdata install
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /data/workspace

CMD ["/bin/zsh"]

# fix timezone 
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y vim tmux \
    git zsh curl wget python python3 golang tzdata

COPY .vimrc /root/
COPY .tmux.conf /root/
COPY install_plugins.sh ./
RUN ./install_plugins.sh

ENV TERM xterm-256color
# oh-my-zsh
# ref: https://blog.phpgao.com/zsh_in_docker.html
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
    && chsh -s /bin/zsh
COPY .zshrc /root/
# sshd?
# ref: https://blog.phpgao.com/zsh_in_docker.html


# reference
# 1. https://medium.com/@hudsonmendes/docker-have-a-ubuntu-development-machine-within-seconds-from-windows-or-mac-fd2f30a338e4
# 2. https://imququ.com/post/vagrantup.html

# problems
# 1. vim中使用j k快速移动稍微有卡顿的现象，在mac上并没有这种问题，待查
