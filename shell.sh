#!/bin/sh

# 先记住当前的分支，切换到demo分支之后需要切换会拉
BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`

git fetch
git checkout demo || git checkout -b demo
git merge $BRANCH_NAME demo

mv ./storybook-static/* .

git add .
git commit -m "chore: 更新demo"
git push origin demo -f
git checkout $BRANCH_NAME

# 用谷歌浏览器打开demo页面
open -a /Applications/Google\ Chrome.app http://groups.alidemo.cn/UFORM/rs-antd-uform/
