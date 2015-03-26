//
//  ShowMovieList.h
//  ShowTracker
//
//  Created by Puneet Rao on 25/03/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "API.h"
#import "MovieDetails.h"
#import "DraggableViewBackground.h"


@interface ShowMovieList : UIViewController<passDataWithDelegate>
@property (strong,nonatomic) NSString* getIntrest;
@property (nonatomic) int getIndex;
@property (nonatomic,strong) MovieDetails *allMovieDeatails;
@property (nonatomic,strong) NSMutableArray *objectMovieArr;



@end
