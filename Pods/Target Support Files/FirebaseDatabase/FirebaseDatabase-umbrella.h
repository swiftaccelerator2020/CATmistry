#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "FIRDataEventType.h"
#import "FIRDataSnapshot.h"
#import "FIRDatabase.h"
#import "FIRDatabaseQuery.h"
#import "FIRDatabaseReference.h"
#import "FIRMutableData.h"
#import "FIRServerValue.h"
#import "FIRTransactionResult.h"
#import "FirebaseDatabase.h"

FOUNDATION_EXPORT double FirebaseDatabaseVersionNumber;
FOUNDATION_EXPORT const unsigned char FirebaseDatabaseVersionString[];