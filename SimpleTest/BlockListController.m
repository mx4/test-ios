//
//  BlockListController.m
//  SimpleTest
//
//  Created by Maxime Austruy on 05/11/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import "BlockListController.h"
#import "BlockDetailViewController.h"

@interface BlockListController ()

@end

@implementation BlockListController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlockCell"];
    UILabel *title = (UILabel*) [cell viewWithTag:11];
    title.text = [NSString stringWithFormat:@"Test_%ld", (long)indexPath.row];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *segueString = [ NSString stringWithFormat:@"ShowBlockDetail" ];
    
    [self performSegueWithIdentifier:segueString sender:self];
}


#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s: %@", __FUNCTION__, [segue identifier]);
    
    if ([[segue identifier] isEqualToString:@"ShowBlockDetail"]) {
        NSLog(@"Following ShowBlockDetail");
        BlockDetailViewController *detailViewController = [segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        detailViewController.blockNumber = [ NSNumber numberWithInt: (int)indexPath.row];
    }

}

@end
