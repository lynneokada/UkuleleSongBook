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

@interface SongBookViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SongBookViewController {
    NSArray *songs;
    NSArray *searchResults;
    NSArray *thumbnails;
    NSArray *difficulty;
    NSArray *video;
    NSArray *tab;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"songs" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    songs = [dict objectForKey:@"SongName"];
    thumbnails = [dict objectForKey:@"Thumbnail"];
    difficulty = [dict objectForKey:@"Difficulty"];
    video = [dict objectForKey:@"VideoName"];
    tab = [dict objectForKey:@"tabName"];


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [songs count];
        
    }
}

- (SimpleTableCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";

    // good search bad search ui
     
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
            cell.nameLabel.text = [songs objectAtIndex:indexPath.row];
            cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
            cell.difficultyLabel.text = [difficulty objectAtIndex:indexPath.row];
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

            
            
        }
        
        return cell;
    }

- (void)tableView:(SimpleTableCell *)tableView willDisplayCell:(SimpleTableCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [UIColor blueColor];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showSongDetail"]) {
        SongDetailViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath = nil;
        
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow]
                ;
            destViewController.songName = [songs objectAtIndex:indexPath.row];
            destViewController.videoName = [video objectAtIndex:indexPath.row];
            destViewController.tabName = [tab objectAtIndex:indexPath.row];
            
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            destViewController.songName = [songs objectAtIndex:indexPath.row];
            destViewController.videoName = [video objectAtIndex:indexPath.row];
            destViewController.tabName = [tab objectAtIndex:indexPath.row];
        }
    }
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [songs filteredArrayUsingPredicate:resultPredicate];
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