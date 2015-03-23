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
    
    //[objApi getDataOnlyURL:@"http://yts.to/api/v2/list_movies.json"];
    
    NSDictionary *dict=@{@"quality":@"720p",@"limit":@"10"};
    

    [objApi getDataFromURL:@"http://yts.to/api/v2/list_movies.json" withaParameters:dict];
    
    [super viewDidLoad];
}

#pragma mark - Actions
-(void)passDataWithDictionary:(NSDictionary *)dict
{
    NSDictionary *dictData=[dict objectForKey:@"data"];
    
     // NSLog(@"%@",dict);
     // NSLog(@"%@",dictData);
    
    NSMutableArray *arrMovie=[[NSMutableArray alloc] init];
    
    arrMovie=[dictData objectForKey:@"movies"];
    
      //NSLog(@"%@",[arrMovie objectAtIndex:0]);
    
    for (NSDictionary * in <#collection#>) {
        <#statements#>
    }
    
    NSDictionary *movieDict=[arrMovie objectAtIndex:0];
    
      NSLog(@"%@",movieDict);
    NSString *title=[movieDict objectForKey:@"title"];
    
      NSLog(@"%@",title);

}

-(void)didFailPassingDta:(NSError *)error
{
      NSLog(@"%@",error);
}

@end
