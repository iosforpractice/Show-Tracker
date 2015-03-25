//
//  RWViewController.h
//  ShowTracker
//
//  Created by Joshua on 3/1/14.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import <QuartzCore/QuartzCore.h>
#import "MovieDetails.h"
#import "ShowMovieList.h"


@interface ViewController : UIViewController <UIScrollViewDelegate,passDataWithDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
{
    IBOutlet UICollectionView *collectionView;
    
}
extern NSString *const bsaeMovieAPI;

@property (strong, nonatomic) IBOutlet UIImageView *upperImageView;


@end