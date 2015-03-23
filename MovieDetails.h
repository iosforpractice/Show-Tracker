//
//  MovieDetails.h
//  ShowTracker
//
//  Created by Puneet Rao on 23/03/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetails : NSObject

@property (strong,nonatomic) NSString *genre;
@property (strong,nonatomic) NSString *language;
@property (strong,nonatomic) UIImage  *image;
@property (strong,nonatomic) NSString *mpa_rating;
@property (strong,nonatomic) NSString *rating;
@property (strong,nonatomic) NSString *runtime;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *title_long;
@property (strong,nonatomic) NSString *year;



@end
