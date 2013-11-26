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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set the Label text with the selected recipe
    songLabel.text = songName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
