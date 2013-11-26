//
//  SongDetailViewController.m
//  SongBook
//
//  Created by Todd Schultz on 8/7/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import "SongDetailViewController.h"

@interface SongDetailViewController ()

@end

@implementation SongDetailViewController

@synthesize songLabel;
@synthesize songName;
@synthesize videoName;
@synthesize videoLabel;
@synthesize tabName;
@synthesize tabLabel;


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
    songLabel.text = songName;
    videoLabel.text = videoName;
    tabLabel.text = tabName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
