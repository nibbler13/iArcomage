//
//  QuitViewController.h
//  iArcomage
//
//  Created by NIBBLER on 2/16/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol quitViewControllerDelegate <NSObject>

- (void)noQuitButtonPressed;
- (void)yesQuitButtonPressed;

@end

@interface QuitViewController : UIViewController

@property (strong, nonatomic) id <quitViewControllerDelegate> delegate;

@end
