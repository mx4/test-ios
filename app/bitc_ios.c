//
//  bitc_ios.c
//  bitc-ios
//
//  Created by Maxime Austruy on 11/11/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#include <stdio.h>

#include "bitc_ios.h"

void
LogViewAppend(const char *pfx,
              const char *line);

void
bitc_ios_log(const char *pfx,
             const char *line)
{
   LogViewAppend(pfx, line);
}