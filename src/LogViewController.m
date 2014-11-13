//
//  LogViewController.m
//  SimpleTest
//
//  Created by Maxime Austruy on 05/11/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import "LogViewController.h"
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
//   printf("%s", [ s UTF8String]);
 
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
