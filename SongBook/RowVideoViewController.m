//
//  RowVideoViewController.m
//  Song Book
//
//  Created by Todd Schultz on 8/14/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import "RowVideoViewController.h"

@interface RowVideoViewController ()

@end

@implementation RowVideoViewController

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
	// Do any additional setup after loading the view.
    NSString *rcode = [NSString stringWithFormat:@"<iframe width=\"320\" height=\"160\" src=\"http://www.youtube.com/embed/%@\" frameborder=\"0\" allowfullscreen></iframe>", self.videoName];
    [[self rvideo]loadHTMLString:rcode baseURL:nil];
    self.view.backgroundColor = [[UIColor alloc] initWithRed:24.0 / 255 green:125.0 / 255 blue:207.0 / 255 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
