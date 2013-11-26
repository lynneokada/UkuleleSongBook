//
//  RowVideoViewController.h
//  Song Book
//
//  Created by Todd Schultz on 8/14/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RowVideoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *rvideo;
@property (weak, nonatomic) IBOutlet UIImage *lyric;
@property (strong, nonatomic) NSString *videoName;

@end
