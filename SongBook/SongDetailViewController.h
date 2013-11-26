//
//  SongDetailViewController.h
//  SongBook
//
//  Created by Todd Schultz on 8/7/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongDetailViewController.h"
#import "Song.h"

@interface SongDetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UILabel *songLabel;
@property (nonatomic, strong) IBOutlet UILabel *videoLabel;
@property (nonatomic, strong) IBOutlet UILabel *tabLabel;
//@property (nonatomic, strong) NSString *tabName;
//@property (nonatomic, strong) NSString *songName;
//@property (nonatomic, strong) NSString *videoName;
//@property (nonatomic, strong) UIImage *lyric;
@property (nonatomic, strong) Song *song;

@end
