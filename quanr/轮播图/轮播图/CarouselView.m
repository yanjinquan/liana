//
//  CarouselView.m
//  轮播图
//
//  Created by tang on 16/1/1.
//  Copyright © 2016年 汤鹏. All rights reserved.
//

#import "CarouselView.h"


@interface CarouselView ()
@property (nonatomic, copy)NSArray *imageViews;
@property (nonatomic, copy)NSArray *carouseImages;
@end

@implementation CarouselView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.bounces = NO;
    }
    return self;
}
- (void)carouseWithImageArray:(NSArray *)imageArr{
    self.carouseImages = imageArr;
    self.contentSize = CGSizeMake(self.frame.size.height, imageArr.count * self.frame.size.width);
}

@end
