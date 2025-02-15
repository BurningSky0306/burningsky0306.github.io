---
date : "2025-02-15T15:34:53+08:00"
draft : false
title : How to sync notes from WeRead to Notion
---

This post is reprinted from "renamed document in my Notion".

<!--more-->

# 视频介绍

[懒人必备！自动整理读书笔记技巧曝光_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV12m4y1L7M2/?buvid=XU870AF8F4798AFDB7EB5E8209E0AFFCCFB08&is_story_h5=false&mid=IYmw6S/HuCGfTRiOVVlV0Q==&p=1&plat_id=114&share_from=ugc&share_medium=android&share_plat=android&share_session_id=8e3bb104-b694-4329-a944-ae66656e5be1&share_source=COPY&share_tag=s_i&timestamp=1695939419&unique_k=tn6WfwM&up_id=34889387&vd_source=294f63791ae8bef6fa76a1ea4a682d3f)

# 项目简介

该项目利用Github的自动任务实现每天定时将微信读书的笔记同步到Notion数据库中。

## 部署项目的前备条件

### 获取微信读书Cookies

1. 登陆网页版微信读书
2. F12开发者模式
3. 进入网络——文档——标头——找到Cookies

### 获取自定义的Notion集成的Token

1. 设置——连接——开发或管理集成

1. 创建集成，保存密钥

### 获取数据库BaseID

1. 将作者提供的Notion模板保存到自己的Notion中
2. 清除模板中原有的内容
3. 对该页面添加连接，连接为刚才创建的集成
4. 获取如图所示的BaseID

## 项目部署

1. Fork该Github工程
2. 定义变量：Setting——secrets and variables——actions

1. 如图所示，创建变量，将自己的变量字段填写进去，变量名要和图上的一模一样
2. 手动运行一次项目：Actions——weread sync

1. 之后就可以不用管了，每天八点左右他都会自动运行一次程序以同步笔记

# 作者提供的部署步骤

```markdown
1. star本项目
2. fork这个工程
3. 获取微信读书的Cookie
    - 浏览器打开 <https://weread.qq.com/>
    - 微信扫码登录确认，提示没有权限忽略即可
    - 按F12进入开发者模式，依次点 Network -> Doc -> Headers-> cookie。复制 Cookie 字符串;
4. 获取NotionToken
    - 浏览器打开https://www.notion.so/my-integrations
    - 点击New integration 输入name提交
    - 点击show，然后copy
5. 复制[这个Notion模板](<https://www.notion.so/a7794117392d4625ace722f78742afca?pvs=21>)，删掉所有的数据，并点击右上角设置，Connections添加你创建的Integration。
6. 获取NotionDatabaseID
    - 打开Notion数据库，点击右上角的Share，然后点击Copy link
    - 获取链接后比如 [<https://www.notion.so/malinkang/1b78f0fd0d03484caa00154285ffec0c?v=7ed7e3fbe69043a28d2847e76f075d99&pvs=4>](<https://www.notion.so/1b78f0fd0d03484caa00154285ffec0c?pvs=21>) 中间的1b78f0fd0d03484caa00154285ffec0c就是DatabaseID
7. 在Github的Secrets中添加以下变量
    - 打开你fork的工程，点击Settings->Secrets and variables->New repository secret
    - 添加以下变量
        - WEREAD_COOKIE
        - NOTION_TOKEN
        - NOTION_DATABASE_ID
```
