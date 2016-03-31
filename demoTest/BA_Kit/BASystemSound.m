//
//  BASystemSound.m
//  demoTest
//
//  Created by 博爱 on 16/3/31.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BASystemSound.h"
#import "BALog.h"

@implementation BASystemSound

/* 从ID中播放系统声音 */
+ (void)playSystemSound:(AudioID)audioID
{
    AudioServicesPlaySystemSound(audioID);
}

/* 播放系统声音震动 */
+ (void)playSystemSoundVibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

/* 播放网页声音 */
+ (SystemSoundID)playCustomSound:(NSURL *)soundURL
{
    SystemSoundID soundID;
    
    OSStatus err = AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(soundURL), &soundID);
    if(err != kAudioServicesNoError)
    {
        BALog(@"Could not load %@", soundURL);
    }
    return soundID;
}

/* 配置自定义音效 */
+ (BOOL)disposeSound:(SystemSoundID)soudID
{
    OSStatus err = AudioServicesDisposeSystemSoundID(soudID);
    if(err != kAudioServicesNoError)
    {
        BALog(@"Error while disposing sound %i", (unsigned int)soudID);
        return NO;
    }
    
    return YES;
}

@end
