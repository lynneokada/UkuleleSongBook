//NEW
//  SongBookViewController.m
//  SongBook
//
//  Created by Todd Schultz on 8/7/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import "SongBookViewController.h"
#import "SongDetailViewController.h"
#import "SimpleTableCell.h"
#import "Song.h"

@interface SongBookViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *songs;
@end

@implementation SongBookViewController {
    NSArray *searchResults;
    NSArray *thumbnails;
    NSArray *difficulty;
    NSArray *video;
    NSArray *tab;
    NSArray *lyric;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"songs" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSMutableArray *songs = [NSMutableArray array];
    NSArray *songNames = [dict objectForKey:@"SongName"];
    
    for (int i = 0; i < songNames.count; i++) {
        Song *song = [[Song alloc] initWithName:songNames[i]
                                   andImageName:[dict objectForKey:@"Thumbnail"][i]
                                  andDifficulty:[dict objectForKey:@"Difficulty"][i]
                                   andVideoName:[dict objectForKey:@"VideoName"][i]
                                   andTablature:[dict objectForKey:@"tabName"][i]
                                       andLyric:[dict objectForKey:@"lyric"][i]
                      ];
//        song.name = songNames[i];
//        song.imageName = [dict objectForKey:@"Thumbnail"][i];
//        song.dificulty = [dict objectForKey:@"Difficulty"][i];
//        song.videoName = [dict objectForKey:@"VideoName"][i];
//        song.tab = [dict objectForKey:@"tabName"][i];
//        song.lyric = [dict objectForKey:@"lyric"][i];
        [songs addObject:song];
    }
    
    self.songs = [songs copy];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return self.songs.count;
        
    }
}

- (SimpleTableCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";

    // good search bad search ui
    
    Song *song = [self.songs objectAtIndex:indexPath.row];
    
        SimpleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
      if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
       if (tableView == self.searchDisplayController.searchResultsTableView) {
           cell.nameLabel.text = [searchResults objectAtIndex:indexPath.row];
           cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
           cell.difficultyLabel.text = [difficulty objectAtIndex:indexPath.row];
           cell.backgroundColor = [UIColor redColor];
           tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
           
        }else {
            cell.nameLabel.text = song.name;
            cell.thumbnailImageView.image = [UIImage imageNamed:song.imageName];
            cell.difficultyLabel.text = song.dificulty;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
        
        return cell;
    }

- (void)tableView:(SimpleTableCell *)tableView willDisplayCell:(SimpleTableCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [[UIColor alloc] initWithRed:24.0 / 255 green:125.0 / 255 blue:207.0 / 255 alpha:1.0];
   cell.textLabel.textColor = [UIColor redColor];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showSongDetail"]) {
        SongDetailViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath = nil;
        
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow]
                ;
            destViewController.song = [self.songs objectAtIndex:indexPath.row];
//            destViewController.songName = [self.songs objectAtIndex:indexPath.row];
//            destViewController.videoName = [video objectAtIndex:indexPath.row];
//            destViewController.tabName = [tab objectAtIndex:indexPath.row];
       
            
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
//            destViewController.songName = [songs objectAtIndex:indexPath.row];
//            destViewController.videoName = [video objectAtIndex:indexPath.row];
//            destViewController.tabName = [tab objectAtIndex:indexPath.row];
            destViewController.song = [self.songs objectAtIndex:indexPath.row];

        }
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [self.songs filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [self performSegueWithIdentifier: @"showSongDetail" sender: self];
    }
    else [self performSegueWithIdentifier: @"showSongDetail" sender: self];
}
//fixed the detail page appearance from the main list by adding the line above, which curiously is NOT in the older version that worked the whole time ... ? 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 69;

    
}

@end