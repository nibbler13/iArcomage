//
//  SoundSystem.m
//  iArcomage
//
//  Created by NIBBLER on 1/12/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "SoundSystem.h"

@implementation SoundSystem
{
    BOOL needToPlay;
    AVAudioPlayer *avPlayer;
    NSMutableArray *soundsArray;
    NSDictionary *soundsEffectName;
}

- (void)playDealSoundEffectForEvent:(NSString*)event
{
    //NSLog(@"===========parameter: %@", event);
    //NSLog(@"event: %@", (NSString*)[soundsEffectName objectForKey:event]);
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:(NSString*)[soundsEffectName objectForKey:event] ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    AVAudioPlayer *avPlayerTemp = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    
    [soundsArray addObject:avPlayerTemp];
    
    
    avPlayerTemp.numberOfLoops = 0;
    avPlayerTemp.volume = [[NSUserDefaults standardUserDefaults] floatForKey:@"soundVolume"];
    avPlayerTemp.delegate = self;
    [avPlayerTemp play];
    
    //NSLog(@"%d", [soundsArray count]);
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    //NSLog(@"audioPlayerDidFinishingPlaying %d", [soundsArray count]);
    
    for (int i = 0; i < [soundsArray count]; i++) {
        //NSLog(@"i: %d", i);
        if ([player isEqual:[soundsArray objectAtIndex:i]]) {
            //NSLog(@"equal founded");
            [soundsArray removeObjectAtIndex:i];
        }
    }
}

- (id)initWithFileName:(NSString*)fileName
{
    if (self = [super init]) {
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"];
        NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
        avPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
        avPlayer.numberOfLoops = -1;
        avPlayer.volume = 0.0;
        
        soundsArray = [[NSMutableArray alloc] initWithCapacity:10];
        
        soundsEffectName = [[NSDictionary alloc] initWithObjects:[[NSArray alloc] initWithObjects:
                                                                  @"damage",
                                                                  @"deal",
                                                                  @"defeat",
                                                                  @"evillaugh",
                                                                  @"resb_down",
                                                                  @"resb_downa",
                                                                  @"ress_up",
                                                                  @"ress_upa",
                                                                  @"towerwall",
                                                                  nil]  forKeys:[[NSArray alloc] initWithObjects:
                                                                                 @"WillTakeDamage",
                                                                                 @"WillTakeACard",
                                                                                 @"PlayerLose",
                                                                                 @"PlayerWin",
                                                                                 @"WillDecreaseSelfCommonResource",
                                                                                 @"WillDecreaseSelfGeneralResource",
                                                                                 @"WillIncreaseSelfCommonResource",
                                                                                 @"WillIncreaseSelfGeneralResource",
                                                                                 @"WillIncreaseTowerOrWall",
                                                                                 nil]];
        
        if ([[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"] > 0.0) {
            [self playMusic];
        }
    }
    return self;
}

- (void)playMusic
{
    needToPlay = YES;
    [avPlayer play];
    [self doVolumeUp];
}

- (void)stopMusic
{
    needToPlay = NO;
    [self doVolumeFade];
}

- (void)updateSoundVolume
{
    if ([[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"] > 0.0) {
        if (avPlayer.isPlaying) {
            avPlayer.volume = [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"];
        } else {
            [self playMusic];
        }
    } else {
        [self stopMusic];
    }
}

- (void)doVolumeFade
{
    if (!needToPlay) {
        if (avPlayer.volume > 0.0) {
            avPlayer.volume = avPlayer.volume - 0.05;
            [self performSelector:@selector(doVolumeFade) withObject:nil afterDelay:0.2];
        } else {
            [avPlayer stop];
        }
    }
}

- (void)doVolumeUp
{
    if (needToPlay) {
        if (avPlayer.volume < [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"]) {
            avPlayer.volume = avPlayer.volume + 0.05;
            [self performSelector:@selector(doVolumeUp) withObject:nil afterDelay:0.2];
        }
    }
}

- (BOOL)isMusicPlaying
{
    return avPlayer.isPlaying;
}

@end
