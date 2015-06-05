//
//  ViewController.m
//  pullWithBig
//
//  Created by 神说有光 on 15/4/30.
//  Copyright (c) 2015年 Our Dream. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+PullBig.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor orangeColor];
    scrollView.contentSize = CGSizeMake(320, 1000);
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    [scrollView setBigView:image withHeaderView:nil];
//    scrollView.bigView = image;
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
