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

@synthesize blockNumber = _blockNumber;
@synthesize blockNumberLabel = _blockNumberLabel;

- (void)viewDidLoad {
   [super viewDidLoad];

   _blockNumberLabel.text = [NSString stringWithFormat:@"Block %@", _blockNumber];
   NSLog(@"%s: %@", __FUNCTION__, _blockNumber);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end