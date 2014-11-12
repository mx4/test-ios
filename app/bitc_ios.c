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

void
LogViewAppend(const char *pfx,
              const char *line);

void
DashboardUpdate(int height,
                const char *hash,
                int connected,
                int total, int numAddrs,
                const char *date);

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
 * bitc_ios_info_update --
 *
 *-------------------------------------------------------------------
 */

void
bitc_ios_info_update(void)
{
   char hashStr[80];
   uint32 timestamp;
   char *ts = NULL;

   mutex_lock(btcui->lock);
   uint256_snprintf_reverse(hashStr, sizeof hashStr,
                            &btcui->blocks[btcui->idx].hash);
   timestamp = btcui->blocks[btcui->idx].timestamp;
   if (timestamp) {
      ts = print_time_local(timestamp, "%c");
   }
   
   DashboardUpdate(btcui->height, hashStr,
                   btcui->num_peers_active,
                   btcui->num_peers_alive,
                   btcui->num_addrs,
                   ts ? ts : "");
   free(ts);
   mutex_unlock(btcui->lock);
}