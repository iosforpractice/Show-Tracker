//
//  RWViewController.m
//  ShowTracker
//
//  Created by Joshua on 3/1/14.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    API *objApi=[[API alloc]init];
    objApi.degate=self;
    
    [objApi getDataOnlyURL:@"http://yts.to/a"];
    
    
    [super viewDidLoad];
}

#pragma mark - Actions
-(void)passDataWithDictionary:(NSDictionary *)dict
{
    NSLog(@"%@",dict);
}

-(void)didFailPassingDta:(NSError *)error
{
      NSLog(@"%@",error);
}

@end
