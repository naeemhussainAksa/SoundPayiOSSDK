//
//  SoundPay.h
//  SoundPayiOSSDK
//
//  Created by Naeem Hussain on 10/08/2022.
//

#import <Foundation/Foundation.h>
#import "SoundPaySDK.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SoundPaySdkDelegate <NSObject>
- (void)messageDidReceive:(NSString*)message;
- (void)messageDidSent;
@end

@interface SoundPay : NSObject
{
    SoundPaySDK *soundPayObj;
}
@property (nonatomic, weak) id <SoundPaySdkDelegate> delegate;

+ (id)sharedInstance;
- (void) broadcastText: (const char *) textMessage;
- (void) stopReceiving;
- (void) stopBroadcast;
- (void) receiveBroadcastText;

@end

NS_ASSUME_NONNULL_END
