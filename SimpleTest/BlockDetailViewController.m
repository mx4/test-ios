//
//  BlockDetailViewController.m
//  bitc-ios
//
//  Created by Maxime Austruy on 11/7/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import "BlockDetailViewController.h"

@interface BlockDetailViewController ()

@end

@implementation BlockDetailViewController

@synthesize blockNumber = _blockDNumber;
@synthesize blockNumberLabel = _blockNumberLabel;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.blockNumberLabel.text = [ NSString stringWithFormat:@"Test_%@", self.blockNumber];
    NSLog(@"%s", __FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
;