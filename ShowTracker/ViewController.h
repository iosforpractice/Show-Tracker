//
//  RWViewController.h
//  ShowTracker
//
//  Created by Joshua on 3/1/14.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "API.h"
#import "MovieDetails.h"


@interface ViewController : UIViewController <UIScrollViewDelegate,passDataWithDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
{
    IBOutlet UICollectionView *collectionView;
    
}
@property (nonatomic,strong) MovieDetails *allMovieDeatails;
@property (nonatomic,strong) NSMutableArray *objectMovieArr;


@end