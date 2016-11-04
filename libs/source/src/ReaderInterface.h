/*
 * Support for bR301(Bluetooth) smart card reader
 *
 * ReaderInterface.h: header file for ReaderInterface.c
 *
 * Copyright (C) 2014, Ben <ben@ftsafe.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */


#import <Foundation/Foundation.h>


/**
 *  Delegate which is used to notify the appliation layer when the reader is attached/detached..
 */

@protocol ReaderInterfaceDelegate<NSObject>
@required

/**
 *  Delegate to be called when our custom version of the 301 has been attached or detached (regardless of whether a card is inserted or not).
 *  This should only be called on a background thread (not the main thread).
 *  You should assume that an application implemenation of this delegate will call [ReaderInterface cardInterface] to obtian a card interface.
 *  @param attached is YES if the 301 has become attached to the phone or NO if the 301 has become detached from the phone.
 */
- (void) readerInterfaceDidChange:
(BOOL)attached;

- (void) cardInterfaceDidDetach:
(BOOL)attached;
@end


/**
 *  ReaderInterface class represents the attached/detached state of the reader with the iOS device.
 *  It is envisioned that attach/detach notifications will be registered to be handled by internal methods of this class.
 *  Such internal methods are assumed to be declaring in the implementation file (hidden) rather than this header.
 *  It is also envisioned that I/O notifications (NSStreamEventHasBytesAvailable, etc.) will NOT be registered to be handled by methods of this class.
 *  Instead, such notificaitons would be registered during initialization of a CardInterface class to be handled by internal
 *  methods of the CardInterface class.
 */

@interface ReaderInterface :
NSObject {

}

/**
 *  Set an applicaiton defined delegate to receive notificaiton that our custom 301 reader has become attached/detached.
 *  The implementation of your notifiation logic must check to see if this delegate has been provided before attempting to call it.
 *  Our applicaiton layer might set this back to nil when notifications are no longer desired.
 *  @param delegate is the caller provided delegate.
 */
- (void)        setDelegate:
(id<ReaderInterfaceDelegate>)delegate;

/**
 *  Query if our custom version of the 301 is currently attached to the phone.
 *  @return YES if the 301 is attached to the phone.  NO if the 301 is detached from the phone.
 */
- (BOOL)        isReaderAttached;
/**
 *  Query if the card is currently attached to the 301.
 *  @return YES if the card is attached to the 301.  NO if the card is detached from the 301.
 */
- (BOOL)        isCardAttached;


@end





