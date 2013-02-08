//
//  BackgroundViewController.h
//  iArcomage
//
//  Created by NIBBLER on 2/6/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackgroundViewControllerDelegate <NSObject>

- (void)changeBackgroundImage;
- (void)changeTextureImage;

@end

@interface BackgroundViewController : UIViewController

@property (strong, nonatomic) id <BackgroundViewControllerDelegate> delegate;

@end
