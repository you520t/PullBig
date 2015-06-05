//
//  UIScrollView+PullBig.m
//  pullWithBig
//
//  Created by 神说有光 on 15/4/30.
//  Copyright (c) 2015年 Our Dream. All rights reserved.
//

#import "UIScrollView+PullBig.h"
#import <objc/runtime.h>
@interface PullBigEffectView:UIView
@property (nonatomic, assign) UIEdgeInsets contentInset;
@property (nonatomic, assign) BOOL isLayoutSubviews;
@property (nonatomic, assign) CGFloat headerH;
@end
NSString *const ContentOffset = @"contentOffset";
@implementation PullBigEffectView
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    [self.superview removeObserver:self forKeyPath:ContentOffset context:nil];
    if (newSuperview) {
        [newSuperview addObserver:self forKeyPath:ContentOffset options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentInset = [(UIScrollView *)self.superview contentInset];
    UIView *headerView = [self.superview valueForKey:@"headerView"];
    UIView *bigView = [self.superview valueForKey:@"bigView"];
    self.frame = headerView ? headerView.bounds : bigView.bounds;
    self.headerH = headerView ? headerView.bounds.size.height : bigView.bounds.size.height;
    self.isLayoutSubviews = true;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:ContentOffset] && self.isLayoutSubviews) {
        [self animationHandle:[[object valueForKey:ContentOffset] CGPointValue]];
    }
}

-(void)animationHandle:(CGPoint)offset
{
    CATransform3D transform = CATransform3DIdentity;
    if (offset.y < -self.contentInset.top)
    {
        CGFloat offsetY = (offset.y + self.contentInset.top)/2;
        CGFloat scaleNumber = ((self.headerH-offset.y)-self.contentInset.top)/self.headerH;
        transform = CATransform3DTranslate(transform, 0, offsetY, 0);
        transform = CATransform3DScale(transform, scaleNumber, scaleNumber, 1);
        self.layer.transform = transform;
    }
    else
    {
        self.layer.transform = transform;
    }
}
@end

@interface UIScrollView()
@end
static char bigViewKey;
static char headerViewKey;
@implementation UIScrollView (PullBig)
-(void)setBigView:(UIView *)bigView withHeaderView:(UIView *)headerView
{
    if (!bigView) {
        return;
    }
    self.bigView = bigView;
    headerView.backgroundColor = [UIColor clearColor];
    self.headerView = headerView;
    [self setup];
}

-(void)setBigView:(UIView *)bigView
{
    [self.bigView removeFromSuperview];
    objc_setAssociatedObject(self, &bigViewKey, bigView, OBJC_ASSOCIATION_RETAIN);
}

-(UIView *)bigView
{
    return objc_getAssociatedObject(self, &bigViewKey);
}

-(void)setHeaderView:(UIView *)headerView
{
    [self.headerView removeFromSuperview];
    objc_setAssociatedObject(self, &headerViewKey, headerView, OBJC_ASSOCIATION_RETAIN);
}

-(UIView *)headerView
{
    return objc_getAssociatedObject(self, &headerViewKey);
}

-(void)setup
{
    PullBigEffectView *effectView = [[PullBigEffectView alloc] init];
    effectView.layer.masksToBounds = YES;
    [effectView addSubview:self.bigView];
    [self insertSubview:effectView atIndex:0];
    
    if ([self isKindOfClass:[UITableView class]])
    {
        UITableView *table = (UITableView *)self;
        table.tableHeaderView = self.headerView;
    }
    else if ([self isKindOfClass:[UIScrollView class]])
    {
        [self insertSubview:self.headerView belowSubview:self.bigView];
    }
}
@end
