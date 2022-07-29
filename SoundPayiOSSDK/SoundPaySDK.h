//
//  SoundPaySDK.h
//  SoundPay
//
//  Created by Naeem Hussain on 20/07/2022.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioQueue.h>


#define NUM_BUFFERS 3

@protocol SoundPaySdkDelegate <NSObject>
- (void)didReceivedString:(NSString*)message;
- (void)didEndSentData;
@end

typedef struct
{
    int ggwaveId;
    bool isCapturing;
    AudioQueueRef queue;
    AudioStreamBasicDescription dataFormat;
    AudioQueueBufferRef buffers[NUM_BUFFERS];
} StateInp;

typedef struct
{
    bool isPlaying;
    int ggwaveId;
    int offset;
    int totalBytes;
    NSMutableData * waveform;
    
    AudioQueueRef queue;
    AudioStreamBasicDescription dataFormat;
    AudioQueueBufferRef buffers[NUM_BUFFERS];
} StateOut;


@interface SoundPaySDK : NSObject
{
    StateInp stateInp;
    StateOut stateOut;
}

- (void)stopPlayback;
- (void)startPlayback: (const char *) message;
- (void) stopCapturing;
- (void)startCapture;


@end

