//
//  OverlayView.m
//  testing swiping
//
//  Created by Richard Kim on 5/22/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//
//  @cwRichardKim for updates and requests

#import "OverlayView.h"

@implementation OverlayView
@synthesize imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noButton"]];
        imageView.frame=CGRectMake(180, 50, 100, 100);
        [self addSubview:imageView];
    }
    return self;
}

-(void)setMode:(GGOverlayViewMode)mode
{
    if (_mode == mode)
    {
        return;
    }
    
    _mode = mode;
    
    if(mode == GGOverlayViewModeLeft)
    {
        imageView.image = [UIImage imageNamed:@"noButton"];
        imageView.frame=CGRectMake(180, 50, 100, 100);

    }
    else
    {
        imageView.image = [UIImage imageNamed:@"yesButton"];
        imageView.frame=CGRectMake(10, 50, 100, 100);


    }
}

//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    if (imageView.image)
//    {
//        <#statements#>
//    }
//    imageView.frame = CGRectMake(50, 50, 100, 100);
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
