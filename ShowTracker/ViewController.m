//
//  RWViewController.m
//  ShowTracker
//
//  Created by Joshua on 3/1/14.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

#import "ViewController.h"
#import "RemoteImageView.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    self.objectMovieArr= [[NSMutableArray alloc]init];
    
    API *objApi=[[API alloc]init];
    objApi.degate=self;
    
   // [objApi getDataOnlyURL:@"http://yts.to/api/v2/list_movies.json"];
    
    NSDictionary *dict=@{@"quality":@"720p",@"limit":@"50",@"minimum_rating":@"7"};
    

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
    
    for (NSDictionary * dataDictionary in arrMovie)
    {
        self.allMovieDeatails=[[MovieDetails alloc] init];
       
        //self.allMovieDeatails.arr_genre=[[NSMutableArray alloc] init];

        //self.allMovieDeatails.arr_genre=[dataDictionary objectForKey:@"generes"];
       
        //self.showAllMovieDeatails.str_genre=
        // NSLog(@"%@",[dataDictionary objectForKey:@"genres"]);
        //NSLog(@"%@",dataDictionary);
        
        self.allMovieDeatails.arr_genre=[dataDictionary objectForKey:@"genres"];
        self.allMovieDeatails.str_id=[dataDictionary objectForKey:@"id"];
        self.allMovieDeatails.str_language=[dataDictionary objectForKey:@"language"];
        self.allMovieDeatails.str_image=[dataDictionary objectForKey:@"medium_cover_image"];
        self.allMovieDeatails.str_mpa_rating=[dataDictionary objectForKey:@"mpa_rating"];
        self.allMovieDeatails.str_rating=[dataDictionary objectForKey:@"rating"];
        self.allMovieDeatails.str_runtime=[dataDictionary objectForKey:@"runtime"];
        self.allMovieDeatails.str_title=[dataDictionary objectForKey:@"title"];
        self.allMovieDeatails.str_title_long=[dataDictionary objectForKey:@"title_long"];
        self.allMovieDeatails.str_year=[dataDictionary objectForKey:@"year"];

        NSArray *torrentArr=[dataDictionary objectForKey:@"torrents"];
        NSDictionary *torrentDict=[torrentArr objectAtIndex:0];
          //NSLog(@"%@",[torrentArr objectAtIndex:0]);

        self.allMovieDeatails.str_torrent_date_upload=[torrentDict objectForKey:@"date_uploaded"];
        self.allMovieDeatails.str_torrent_hash=[torrentDict objectForKey:@"hash"];
        self.allMovieDeatails.str_torrent_quality=[torrentDict objectForKey:@"quality"];
        self.allMovieDeatails.str_torrent_size=[torrentDict objectForKey:@"size"];
        
        [self.objectMovieArr addObject:self.allMovieDeatails];
        
        
         // NSLog(@"%@",[dataDictionary objectForKey:@"language"]);
         // NSLog(@"%@",[self.allMovieDeatails.arr_genre objectAtIndex:1]);
          NSLog(@"%@",self.objectMovieArr);
    }
   [collectionView reloadData];

}


-(void)didFailPassingDta:(NSError *)error
{
      NSLog(@"%@",error);
}

#pragma mark - Collection View Controller Delegates

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
      NSLog(@"%ld",(unsigned long)self.objectMovieArr.count);
    return self.objectMovieArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    RemoteImageView *recipeImageView = (RemoteImageView *)[cell viewWithTag:100];
    MovieDetails *showDetails=[self.objectMovieArr objectAtIndex:indexPath.row];
    recipeImageView.imageURL=[NSURL URLWithString:showDetails.str_image];
    
    UILabel *labelMovie=(UILabel*)[cell viewWithTag:200];
    labelMovie.text=showDetails.str_title;
    
      NSLog(@"%@",showDetails.arr_genre);
    
    UILabel *genereLabel1=(UILabel *)[cell viewWithTag:301];
    genereLabel1.text=[showDetails.arr_genre objectAtIndex:0];
    

    
    if ([showDetails.arr_genre count]>1)
    {
        UILabel *genereLabel2=(UILabel *)[cell viewWithTag:302];
        genereLabel2.text=[showDetails.arr_genre objectAtIndex:1];
    }

    
    
    NSLog(@"%@",recipeImageView);
    return cell;
}



@end
