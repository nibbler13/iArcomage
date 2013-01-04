//
//  IncompletedGameViewController.h
//  iArcomage
//
//  Created by NIBBLER on 1/4/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IncompletedGameDelegate <NSObject>

- (void)needToLoadSavedGame:(BOOL)needToLoad;

@end

@interface IncompletedGameViewController : UIViewController

@property (nonatomic, strong) id <IncompletedGameDelegate> delegate;

@end
