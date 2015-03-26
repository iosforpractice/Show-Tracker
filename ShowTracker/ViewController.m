//
//  RWViewController.m
//  ShowTracker
//
//  Created by Joshua on 3/1/14.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

#import "ViewController.h"
#import "RemoteImageView.h"

NSString *const bsaeMovieAPI=@"https://yts.to/api/v2/list_movies.json?";

@interface ViewController ()
{
    
    NSArray *genres;
    NSArray *images;
    UIImageView *grayImageView;
}

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{

    [super viewDidLoad];

    
    
    

    
}

-(void)viewWillAppear:(BOOL)animated
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"genres" ofType:@"plist"];
    
    NSDictionary *dict=[[NSDictionary alloc]initWithContentsOfFile:path];
    genres=[dict objectForKey:@"Genres"];
    images=[dict objectForKey:@"Thumbnails"];
    
    
      NSLog(@"%@",dict);
      NSLog(@"%@",genres);
      NSLog(@"%@",images);
}




#pragma mark - Collection View Controller Delegates

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return 1;
//}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
      NSLog(@"%ld",(unsigned long)genres.count);
    return genres.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    RemoteImageView *recipeImageView = (RemoteImageView *)[cell viewWithTag:100];
   // MovieDetails *showDetails=[self.objectMovieArr objectAtIndex:indexPath.row];
    recipeImageView.image=[UIImage imageNamed:[images objectAtIndex:indexPath.row]];
   
    [recipeImageView.layer setCornerRadius:10.0f];
    
    // border
    [recipeImageView.layer setBorderColor:[UIColor whiteColor].CGColor];
    [recipeImageView.layer setBorderWidth:5.0f];
    
    // drop shadow
    [recipeImageView.layer setShadowColor:[UIColor blackColor].CGColor];
    [recipeImageView.layer setShadowOpacity:0.8];
    [recipeImageView.layer setShadowRadius:10.0];
    [recipeImageView.layer setShadowOffset:CGSizeMake(5.0, 5.0)];
    
    
    
    UILabel *labelMovie=(UILabel*)[cell viewWithTag:200];
    labelMovie.text=[genres objectAtIndex:indexPath.row];
    
     // NSLog(@"%@",showDetails.arr_genre);
    
//    grayImageView=(UIImageView *)[cell viewWithTag:500];
//    grayImageView.backgroundColor=[UIColor grayColor];
//    grayImageView.alpha=0.4f;
//    
//    UILabel *genereLabel1=(UILabel *)[cell viewWithTag:301];
//    genereLabel1.text=[showDetails.arr_genre objectAtIndex:0];
//    
//
//    
//    if ([showDetails.arr_genre count]>1)
//    {
//        UILabel *genereLabel2=(UILabel *)[cell viewWithTag:302];
//        genereLabel2.text=[showDetails.arr_genre objectAtIndex:1];
//    }

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
      NSLog(@"%ld",(long)indexPath.row);
    NSString *storyBoardName=@"Main";
    NSString *viewControllerID=@"ShowMovie";
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:storyBoardName bundle:[NSBundle mainBundle]];
    ShowMovieList *controller=(ShowMovieList *)[storyBoard instantiateViewControllerWithIdentifier:viewControllerID];
    controller.getIndex=(int)indexPath.row;
    controller.getIntrest=[genres objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
