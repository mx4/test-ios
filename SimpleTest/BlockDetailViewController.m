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

    NSLog(@"%s: %@", __FUNCTION__, _blockNumber);

    UILabel *detailLabel = (UILabel*) [ self.view viewWithTag:12];
    detailLabel.text = [NSString stringWithFormat:@"Block %@", _blockNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end