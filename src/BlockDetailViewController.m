//
//  BlockDetailViewController.m
//  bitc-ios
//
//  Created by Maxime Austruy on 11/7/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import "BlockDetailViewController.h"

#include "block-store.h"
#include "bitc.h"
#include "util.h"


@interface BlockDetailViewController ()

@end

@implementation BlockDetailViewController

@synthesize blockNumber = _blockNumber;
@synthesize blockNumberLabel = _blockNumberLabel;
//@synthesize blockNumberLabel = _blockNumberLabel;

#if 0
typedef struct btc_block_header {
   uint32       version;
   uint256      prevBlock;
   uint256      merkleRoot;
   uint32       timestamp;
   uint32       bits;
   uint32       nonce;
} btc_block_header;
#endif


- (void)viewDidLoad {
   [super viewDidLoad];
   btc_block_header hdr;
   uint256 hash = { 0 };
   char hashStr[80];
   char *ts;
   bool s;
   int height;
   
   height = [ _blockNumber integerValue];
   
   self.title = [ NSString stringWithFormat:@"%u", height ];

   s = blockstore_get_block_at_height(btc->blockStore, height, &hash, &hdr);
   
   ts = print_time_local(hdr.timestamp, "%a, %d %b %Y %T");
   uint256_snprintf_reverse(hashStr, sizeof hashStr, &hash);
      
   _timestampLabel.text = [NSString stringWithFormat:@"%s", ts];
   _nonceLabel.text = [NSString stringWithFormat:@"0x%x", hdr.nonce];
   _bitsLabel.text = [NSString stringWithFormat:@"%u", hdr.bits];
   _blockVersionLabel.text = [NSString stringWithFormat:@"%u", hdr.version];
//   cell.detailTextLabel.text = [NSString stringWithFormat:@"%s", hashStr];
   free(ts);

   _blockNumberLabel.text = [NSString stringWithFormat:@"%s", hashStr];
   NSLog(@"%s: %@", __FUNCTION__, _blockNumber);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end