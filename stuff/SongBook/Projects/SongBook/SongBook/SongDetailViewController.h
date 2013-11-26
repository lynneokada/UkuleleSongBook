//
//  SongDetailViewController.h
//  SongBook
//
//  Created by Todd Schultz on 8/7/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongDetailViewController.h"

@interface SongDetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *songLabel;
@property (nonatomic, strong) NSString *songName;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
