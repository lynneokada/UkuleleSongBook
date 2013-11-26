//
//  SongBookViewController.h
//  SongBook
//
//  Created by Todd Schultz on 8/7/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongBookViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UILabel *songLabel;
@property (nonatomic, strong) NSString *songName;

@end
