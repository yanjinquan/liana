//
//  ViewController.m
//  轮播图
//
//  Created by tang on 16/1/1.
//  Copyright © 2016年 汤鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic, strong)NSArray *imageArray;
@property(nonatomic, assign)NSInteger tager;

@end
UIScrollView *_myscrollview;
UIPageControl *_pageControl;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView *carouseView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    carouseView.delegate = self;
    carouseView.bounces = NO;
    carouseView.contentSize = CGSizeMake(carouseView.frame.size.width * 3, 0);
    CGRect frame = carouseView.frame;
    NSMutableArray *muArr = [@[] mutableCopy];
    for (int i = 0; i < 6; i++) {
        NSString *imageName = [NSString stringWithFormat:@"image%d.jpg", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [muArr addObject:image];
    }
    self.imageArray = (NSArray *)muArr;
    for (int i = 0; i < 3; i++) {
        frame.origin.x = i * frame.size.width;
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:frame];
        if (i == 0) {
            imageV.image = self.imageArray[self.imageArray.count - 1];
        }else{
            imageV.image = self.imageArray[i - 1];
        }
        [carouseView addSubview:imageV];
    }
    carouseView.contentOffset = CGPointMake(carouseView.frame.size.width, 0);
    self.tager = 0;
    _myscrollview = carouseView;
    carouseView.pagingEnabled = YES;
    carouseView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:carouseView];
    UIPageControl *pageV = [[UIPageControl alloc]initWithFrame:CGRectMake(100, self.view.frame.size.height - 100, self.view.frame.size.width - 200, 44)];
    [self.view addSubview:pageV];
    pageV.numberOfPages = self.imageArray.count;
    _pageControl = pageV;
    [pageV addTarget:self action:@selector(pagechaged :) forControlEvents:UIControlEventValueChanged];
    pageV.currentPageIndicatorTintColor = [UIColor redColor];
    pageV.pageIndicatorTintColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (page == 1) {
        return;
    }
    if (page == 0) {
        self.tager -= 1;
    }else{
        self.tager += 1;
    }
    
    if (self.tager < 0) {
        self.tager = self.imageArray.count - 1;
            }else if(self.tager == self.imageArray.count){
        self.tager = 0;
    }
    [self setcarouseViewSubviews];
    
}
- (void)pagechaged :(UIPageControl *)pageC{
    self.tager = pageC.currentPage;
    [self setcarouseViewSubviews];
}
- (void)setcarouseViewSubviews{
    UIImageView *imageV0 = _myscrollview.subviews[0];
    UIImageView *imageV1 = _myscrollview.subviews[1];
    UIImageView *imageV2 = _myscrollview.subviews[2];
    if (self.tager == 0) {
        imageV1.image = self.imageArray[0];
        _myscrollview.contentOffset = CGPointMake(_myscrollview.frame.size.width, 0);
        imageV0.image = self.imageArray.lastObject;
        imageV2.image = self.imageArray[1];
    }else if (self.tager == self.imageArray.count - 1){
        imageV1.image = self.imageArray[self.tager];
        _myscrollview.contentOffset = CGPointMake(_myscrollview.frame.size.width, 0);
        imageV0.image = self.imageArray[self.tager - 1];
        imageV2.image = self.imageArray[0];
    }else{
        imageV1.image = self.imageArray[self.tager];
        _myscrollview.contentOffset = CGPointMake(_myscrollview.frame.size.width, 0);
        imageV0.image = self.imageArray[self.tager - 1];
        imageV2.image = self.imageArray[self.tager + 1];
    }
    _pageControl.currentPage = self.tager;
}
@end
