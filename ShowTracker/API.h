//
//  API.h
//  ShowTracker
//
//  Created by Puneet Rao on 21/03/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@protocol passDataWithDelegate <NSObject>

-(void )passDataWithDictionary:(NSDictionary*)dict;
-(BOOL)passData;
-(void)didFailPassingDta:(NSError *)error;

@end

@interface API : NSObject

@property (strong,nonatomic) id<passDataWithDelegate> degate;
@property (strong,nonatomic) NSDictionary *getResponse;
-(NSDictionary*)getDataOnlyURL:(NSString*)strUrl;
-(NSDictionary*)getDataFromURL:(NSString*)strUrl withaParameters:(NSDictionary*)dict;
-(NSDictionary*)sucsess:(NSDictionary *)dictData;
-(void)faliure:(NSError *)error;


@end
