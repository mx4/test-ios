//
//  bitc_ios.c
//  bitc-ios
//
//  Created by Maxime Austruy on 11/11/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

#include "bitc_ios.h"
#include "bitc_ui.h"
#include "util.h"
#include "bitc.h"
#include "block-store.h"

void
LogViewAppend(const char *pfx,
              const char *line);

void
DashboardUpdate(int height,
                const char *hash,
                int connected,
                int total, int numAddrs,
                const char *date);

void BlockListAddBlock(int height);


/*
 *-------------------------------------------------------------------
 *
 * bitc_ios_log --
 *
 *-------------------------------------------------------------------
 */

void
bitc_ios_log(const char *pfx,
             const char *line)
{
   LogViewAppend(pfx, line);
}


/*
 *-------------------------------------------------------------------
 *
 * bitc_ios_dashboard_update --
 *
 *-------------------------------------------------------------------
 */

void
bitc_ios_dashboard_update(void)
{
   char hashStr[80];
   uint32 timestamp;
   char *ts = NULL;

   ASSERT(mutex_islocked(btcui->lock));

   uint256_snprintf_reverse(hashStr, sizeof hashStr,
                            &btcui->blocks[btcui->blockProdIdx].hash);
   timestamp = btcui->blocks[btcui->blockProdIdx].timestamp;
   if (timestamp) {
      ts = print_time_local(timestamp, "%c");
   }

   DashboardUpdate(btcui->height, hashStr,
                   btcui->num_peers_active,
                   btcui->num_peers_alive,
                   btcui->num_addrs,
                   ts ? ts : "");
   free(ts);
}


/*
 *-------------------------------------------------------------------
 *
 * bitc_ios_blocklist_update --
 *
 *-------------------------------------------------------------------
 */

void
bitc_ios_blocklist_update(void)
{
   int height;
   
   ASSERT(mutex_islocked(btcui->lock));

   height = blockstore_get_height(btc->blockStore);
   BlockListAddBlock(height);
}


/*
 *-------------------------------------------------------------------
 *
 * bitc_ios_info_update --
 *
 *-------------------------------------------------------------------
 */

void
bitc_ios_info_update(void)
{
   mutex_lock(btcui->lock);

   bitc_ios_dashboard_update();
   bitc_ios_blocklist_update();

   mutex_unlock(btcui->lock);
}
