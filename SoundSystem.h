//
//  SoundSystem.h
//  iArcomage
//
//  Created by NIBBLER on 1/12/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundSystem : NSObject <AVAudioPlayerDelegate>

- (id)initWithFileName:(NSString*)fileName;
- (void)stopMusic;
- (void)updateSoundVolume;
- (BOOL)isMusicPlaying;
- (void)playDealSoundEffectForEvent:(NSString *)event;


@end
