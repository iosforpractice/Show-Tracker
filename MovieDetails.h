//
//  MovieDetails.h
//  ShowTracker
//
//  Created by Puneet Rao on 23/03/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDetails : NSObject

@property (strong,nonatomic) NSArray *arr_genre;
@property (strong,nonatomic) NSString *str_id;
@property (strong,nonatomic) NSString *str_language;
@property (strong,nonatomic) NSString *str_image;
@property (strong,nonatomic) NSString *str_mpa_rating;
@property (strong,nonatomic) NSString *str_rating;
@property (strong,nonatomic) NSString *str_runtime;
@property (strong,nonatomic) NSString *str_title;
@property (strong,nonatomic) NSString *str_title_long;
@property (strong,nonatomic) NSString *str_year;
@property (strong,nonatomic) NSString *str_torrent_date_upload;
@property (strong,nonatomic) NSString *str_torrent_hash;
@property (strong,nonatomic) NSString *str_torrent_quality;
@property (strong,nonatomic) NSString *str_torrent_size;



@end
