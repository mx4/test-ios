//
//  WebViewController.m
//  bitc-ios
//
//  Created by Maxime Austruy on 13/11/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController


- (void)viewDidLoad {
   [super viewDidLoad];
   NSLog(@"%s", __FUNCTION__);
   NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0", @"UserAgent", nil];
   [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
   NSString *urlStr = [ NSString stringWithFormat:
                        @"http://blockchain.info/block-index/%@", _hashStr ];
   NSURL *url = [NSURL URLWithString:urlStr];
   NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
   
   NSLog(@"%@", urlStr);
   [ _webView loadRequest:requestObj];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
   NSLog(@"Error : %@",error);
}

@end
