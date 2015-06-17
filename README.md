# PullBig
头部背景图片下拉放大

## 支持控件
* `UIScrollView`、`UITableView`

## 如何使用
* cocoapods导入：`pod 'UIScrollView+PullBig'`
* 手动导入：
    将UIScrollView+PullBig分类导入工程

## 说明
* [scrollView setBigView:image withHeaderView:nil]; 有背景图片 没有头部view
* [scrollView setBigView:image withHeaderView:[UIView new]]; 有背景图片 有头部view,头部view控件不会放大 显示高度以头部view高度为准

## UIScrollview下拉放大
![(UIScrollview下拉放大)](http://upload-images.jianshu.io/upload_images/533472-ffdf3199a5596b0f.gif)
## UITableview下拉放大
![(UITableview下拉放大)](http://upload-images.jianshu.io/upload_images/533472-52dcc5450b48faf0.gif)
