# README

用 ruby on rails 实现网页搭建 投票

配置好环境，进入到文件夹，在控制台输入 ``rails server`` 启动服务器，在``localhost:3000 ``可以看到页面

``bundle install`` 安装gemfile中的工具

## 页面
app/view/home/index.html.erb为主页面

controller 控制页面逻辑

config/route.rb 中定义页面的路由（即，设定默认界面home page，点击某个控件导航到哪个界面）

## 数据
generate生成资源，migrate迁移db

model中约束各个资源之间的关系

有一些是自带的解析的路径名称 如xxx_path

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version                   ：  \t      2.3.0 acient version

* System dependencies ： \t   windows

* Configuration

* Database creation   ： \t   sqlite3

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
