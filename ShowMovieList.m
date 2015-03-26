//
//  ShowMovieList.m
//  ShowTracker
//
//  Created by Puneet Rao on 25/03/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import "ShowMovieList.h"

@interface ShowMovieList ()
{
    NSString *genreQueryString;
}

@end

@implementation ShowMovieList

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.objectMovieArr= [[NSMutableArray alloc]init];
    
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    genreQueryString=[NSString stringWithFormat:@"%@genere=%@",bsaeMovieAPI,self.getIntrest];
    NSLog(@"%@",genreQueryString);
    
    [self runApiwithString:genreQueryString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(void)runApiwithString:(NSString *)queryString
{
    API *objApi=[[API alloc]init];
    objApi.degate=self;
    
     [objApi getDataOnlyURL:queryString];
    
//    NSDictionary *dict=@{@"quality":@"720p",@"limit":@"50",@"minimum_rating":@"8"};
//    [objApi getDataFromURL:queryString withaParameters:dict];
    
    
}


#pragma mark - Actions
-(void)passDataWithDictionary:(NSDictionary *)dict
{
    NSDictionary *dictData=[dict objectForKey:@"data"];
    
    // NSLog(@"%@",dict);
    // NSLog(@"%@",dictData);
    
    NSMutableArray *arrMovie=[[NSMutableArray alloc] init];
    
    arrMovie=[dictData objectForKey:@"movies"];
    
      NSLog(@"%@",arrMovie);
    
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
    }
    // [collectionView reloadData];
    
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:self.view.frame andArray:self.objectMovieArr];
    [self.view addSubview:draggableBackground];
    
}


-(void)didFailPassingDta:(NSError *)error
{
    NSLog(@"%@",error);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
