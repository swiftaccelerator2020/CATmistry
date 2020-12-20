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

#import "FIRCoreDiagnosticsData.h"
#import "FIRCoreDiagnosticsInterop.h"
#import "GULAppEnvironmentUtil.h"
#import "GULHeartbeatDateStorage.h"
#import "GULKeychainStorage.h"
#import "GULKeychainUtils.h"
#import "GULLogger.h"
#import "GULSecureCoding.h"
#import "GoogleDataTransportInternal.h"
#import "firebasecore.nanopb.h"

FOUNDATION_EXPORT double FirebaseCoreDiagnosticsVersionNumber;
FOUNDATION_EXPORT const unsigned char FirebaseCoreDiagnosticsVersionString[];
