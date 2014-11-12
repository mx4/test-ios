//
//  BlockListController.m
//  SimpleTest
//
//  Created by Maxime Austruy on 05/11/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import "BlockListController.h"
#import "BlockDetailViewController.h"
#include "hashtable.h"
#include "util.h"

@interface BlockListController ()

@end

@implementation BlockListController

static UITableView *blockList;
static struct hashtable *blockHashTable;
static int maxHeight;

void
BlockListAddBlock(int height,
                  const char *hashStr,
                  const char *date)
{
   NSLog(@"%s", __FUNCTION__);
   
   if (blockHashTable == NULL) {
      blockHashTable = hashtable_create();
   }
   
   NSLog(@"height=%d -- %s", height, hashStr);
   maxHeight = MAX(maxHeight, height);

   hashtable_insert(blockHashTable, &height, sizeof height, safe_strdup(hashStr));
   
   [ blockList beginUpdates];
   [ blockList insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]
                         withRowAnimation:UITableViewRowAnimationRight];
   [ blockList endUpdates];
}

- (void)viewDidLoad {
   [super viewDidLoad];
   blockList = _BlockList;

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
   NSLog(@"%s", __FUNCTION__);
   
   if (blockHashTable == NULL) {
      return 0;
   }
   return hashtable_getnumentries(blockHashTable);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlockCell"];
   UILabel *title = (UILabel*) [cell viewWithTag:11];
   
   if (blockHashTable) {
      int index = (long)indexPath.row;
      int height = maxHeight - index;
      char *hashStr = NULL;
      bool s;
      
      NSLog(@"idx = %u -- %u blocks", index, height + index);
      s = hashtable_lookup(blockHashTable, &height, sizeof height, (void *)&hashStr);
      
      if (s) {
         title.text = [NSString stringWithFormat:@"%s", hashStr];
      } else {
         NSLog(@"not found");
      }
   }
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
        BlockDetailViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        detailViewController.blockNumber = [ NSNumber numberWithInt: (int)indexPath.row];
    }

}

@end
