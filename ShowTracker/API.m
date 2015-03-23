//
//  API.m
//  ShowTracker
//
//  Created by Puneet Rao on 21/03/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import "API.h"

@implementation API


-(NSDictionary*)getDataOnlyURL:(NSString*)strUrl
{
    
    NSURL *url=[NSURL URLWithString:strUrl];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer=[AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSDictionary * dict=responseObject;
         [self.degate passDataWithDictionary:dict];
         //[self sucsess:responseObject];
        }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
            [self.degate didFailPassingDta:error];
        }];
    
    [operation start];
    return nil;
}

-(NSDictionary*)getDataFromURL:(NSString*)strUrl withaParameters:(NSDictionary*)dict
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
 
   // NSURL *filePath=[NSURL fileURLWithPath:strUrl];
    
    [manager POST:strUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSDictionary * dict=responseObject;
        [self.degate passDataWithDictionary:dict];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
        [self.degate didFailPassingDta:error];

    }];
    
    return nil;
}



@end
