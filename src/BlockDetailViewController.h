//
//  BlockDetailViewController.h
//  bitc-ios
//
//  Created by Maxime Austruy on 11/7/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockDetailViewController : UIViewController

@property (strong, nonatomic) NSNumber         *blockNumber;
@property (strong, nonatomic) IBOutlet UILabel *blockNumberLabel;

@end
