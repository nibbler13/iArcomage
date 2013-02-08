//
//  MusicViewController.h
//  iArcomage
//
//  Created by NIBBLER on 2/6/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MusicViewControllerDelegate <NSObject>

- (void)changeMusicToIndex:(NSInteger)index;

@end

@interface MusicViewController : UIViewController

@property (strong, nonatomic) id <MusicViewControllerDelegate> delegate;

@end