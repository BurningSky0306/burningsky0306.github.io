@echo off
scp -r -P 22 public/* root@47.76.105.242:/home/hugo_blog/
::scp -r -P 端口 public/* 你的名字@IP:存放博客文件的路径（展示）