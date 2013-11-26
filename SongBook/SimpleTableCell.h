//
//  SimpleTableCell.h
//  SongBook
//
//  Created by Todd Schultz on 8/8/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *difficultyLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
