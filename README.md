# PullBig
头部背景图片下拉放大

## 支持控件
* `UIScrollView`、`UITableView`

## 如何使用
* cocoapods导入：`pod 'UIScrollView+PullBig'`
* 手动导入：
    将UIScrollView+PullBig分类导入工程

##note
[scrollView setBigView:image withHeaderView:nil]; 有背景图片 没有头部view
[scrollView setBigView:image withHeaderView:[UIView new]]; 有背景图片 有头部view,头部view控件不会放大 显示高度以头部view高度为准
