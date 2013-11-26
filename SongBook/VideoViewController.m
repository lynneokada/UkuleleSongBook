//
//  VideoViewController.m
//  Song Book
//
//  Created by Todd Schultz on 8/14/13.
//  Copyright (c) 2013 QAMob.info. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

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
    NSString *code1 = @"<iframe width=\"320\" height=\"160\" src=\"http://www.youtube.com/embed/GFI8KJGlh9M\" frameborder=\"0\" allowfullscreen></iframe>";
    [[self video1]loadHTMLString:code1 baseURL:nil];
    NSString *code2 = @"<iframe width=\"320\" height=\"160\" src=\"http://www.youtube.com/embed/_2r0w30-TI4\" frameborder=\"0\" allowfullscreen></iframe>";
      self.view.backgroundColor = [[UIColor alloc] initWithRed:24.0 / 255 green:125.0 / 255 blue:207.0 / 255 alpha:1.0];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonVideo1:(id)sender {
}
@end