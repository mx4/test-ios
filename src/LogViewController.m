//
//  LogViewController.m
//  SimpleTest
//
//  Created by Maxime Austruy on 05/11/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import "LogViewController.h"

@interface LogViewController ()

@end

@implementation LogViewController

static UITextView *logView;

void
LogViewAppend(const char *pfx,
              const char *line)
{
   NSLog(@"%s: %s", pfx, line);
   
   logView.text = [ logView.text stringByAppendingFormat: @"%s: %s", pfx, line ];
 
   NSString *s = [ NSString stringWithFormat:@"%s: %s %@", pfx, line, logView.text ];
   
   logView.text = s;
}


- (void)viewDidLoad {
   [super viewDidLoad];
   logView = _logTextView;
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
