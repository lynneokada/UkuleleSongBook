//
//  AboutViewController.h
//  SongBook
//
//  Created by Todd Schultz on 8/7/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *webView;
- (IBAction)postToFacebook:(id)sender;
- (IBAction)postToTwitter:(id)sender;

@end
