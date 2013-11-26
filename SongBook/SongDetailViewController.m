//
//  SongDetailViewController.m
//  SongBook
//
//  Created by Todd Schultz on 8/7/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import "SongDetailViewController.h"
#import "RowVideoViewController.h"
#import "RowTablatureViewController.h"

@interface SongDetailViewController ()

@end

@implementation SongDetailViewController

//@synthesize songLabel;
//@synthesize songName;
//@synthesize videoName;
//@synthesize videoLabel;
//@synthesize tabName;
//@synthesize tabLabel;
//@synthesize lyric;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.songLabel.text = self.song.name;
    self.videoLabel.text = self.song.videoName;
    self.tabLabel.text = self.song.tab;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showVideoVC"]) {
        RowVideoViewController *destViewController = segue.destinationViewController;
        destViewController.videoName = self.song.videoName;
    }else{
        RowTablatureViewController *destViewController = segue.destinationViewController;
        destViewController.lyric = self.song.lyric;
        
    }
}
@end
