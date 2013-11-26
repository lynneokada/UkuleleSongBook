//
//  SongBookViewController.m
//  SongBook
//
//  Created by Todd Schultz on 8/7/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import "SongBookViewController.h"
#import "SongDetailViewController.h"

@interface SongBookViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SongBookViewController {
    NSArray *songs;
    NSArray *searchResults;
    NSArray *thumbnails;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    songs = [NSArray arrayWithObjects:@"He's got the Whole World", @"Amazing Grace", @"This Land is Your Land", @"I'll Fly Away", @"You are my Sunshine", @"You Gotta Friend in Me", @"Baby Beluga", @"The Streets of Boston", @"Toes", @"Knee Deep", @"Noodle with BBQ Pork", @"He's the DJ...", @"Over the Rainbow", nil];
    thumbnails = [NSArray arrayWithObjects:@"rowicon1.jpg", @"rowicon2.jpg", @"rowicon1.jpg", @"rowicon2.jpg", @"rowicon1.jpg", @"rowicon2.jpg", @"rowicon1.jpg", @"rowicon2.jpg", @"rowicon1.jpg", @"rowicon2.jpg", @"rowicon1.jpg", @"rowicon2.jpg", @"rowicon1.jpg", nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [songs count];
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SongCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [songs objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];

    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showSongDetail"]) {
        SongDetailViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath = nil;
        
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            destViewController.songName = [searchResults objectAtIndex:indexPath.row];
            
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            destViewController.songName = [songs objectAtIndex:indexPath.row];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end