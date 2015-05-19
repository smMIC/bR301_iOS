//
//  SimulatorEADSessionController.m
//  iRockey301_ccid
//
//  Created by Marco Tresch on 19/05/15.
//  Copyright (c) 2015 ftsafe. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#include <pthread.h>
#include "wintypes.h"
#import "ReaderInterface.h"
#import "EADSessionController.h"


// We define the variables as dummies as they were declared "externally"
BOOL gIsOpen = 0;
unsigned int gDevType = 0;
unsigned int gIsReadData = 0;
unsigned int iR301_or_bR301 = 0;
DWORD g_dwTimeOut = 0;
pthread_mutex_t CommunicatonMutex = PTHREAD_MUTEX_INITIALIZER;

/**
 Feitian provides the EADSessionController only in its compiled object form for
 ARM CPUs. Since we do not have access to the source code, we implement just enough to satisfy the
 bootstrapping process. We end up with a mocked dummy implementation that allows for the application
 to at least start without failure, even in the simulator where we don't have the hardware cardreader available.
 */
@implementation EADSessionController : NSObject
+(EADSessionController *)sharedController {
    return [[EADSessionController alloc] init];
}

-(void) setDelegate:(id<ReaderInterfaceDelegate>)Delegate {
    // void
}

-(void) RegisterAccessoryConnectNotification {
    // void
}
@end
#endif