//
//  SoundPay.m
//  SoundPayiOSSDK
//
//  Created by Naeem Hussain on 10/08/2022.
//

#import "SoundPay.h"

@implementation SoundPay
@synthesize delegate;

+ (id)sharedInstance {
    static SoundPay *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        // write your code here
        
        soundPayObj = [[SoundPaySDK alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self
                selector:@selector(notificationReceived:)
                name:@"SoundPaySdkNotificationObserver"
                object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) notificationReceived:(NSNotification *) notification
{
    NSDictionary *userInfo = notification.userInfo;
    if (userInfo) {
        NSString *infoType = [userInfo valueForKey:@"sdk_title"];
        NSString *stringMessage = [userInfo valueForKey:@"sdkMessage"];
        if (stringMessage) {
            [delegate messageDidReceive:stringMessage];
        }
        else {
            [delegate messageDidSent];
        }
    }

    if ([[notification name] isEqualToString:@"TestNotification"])
        NSLog (@"Successfully received the test notification!");
}

- (void) broadcastText: (const char *) textMessage
{
    [soundPayObj startPlayback:textMessage];
}

- (void) receiveBroadcastText
{
    [soundPayObj startCapture];
}

- (void) stopBroadcast
{
    [soundPayObj stopPlayback];
}

- (void) stopReceiving
{
    [soundPayObj stopCapturing];
}

@end
