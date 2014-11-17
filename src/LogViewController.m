//
//  LogViewController.m
//  SimpleTest
//
//  Created by Maxime Austruy on 05/11/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import "LogViewController.h"
#import "bitc_ios.h"
#include <stdlib.h>

@interface LogViewController ()

@end

@implementation LogViewController

static UITextView *logView;
static NSString *logText;

void
LogViewAppend(const char *pfx,
              const char *line)
{
   NSString *s = [ NSString stringWithFormat:@"%s: %s", pfx, line ];
 
   logText = [ NSString stringWithFormat:@"%@ %@", s, logText ? logText : @""];
   logView.text = logText;
}


- (void)viewDidLoad {
   [super viewDidLoad];
   logView = _logTextView;
   logView.text = logText;
}

- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
}


@end
