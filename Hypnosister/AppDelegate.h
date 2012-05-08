//
//  AppDelegate.h
//  Hypnosister
//
//  Created by Jeff Weiss on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HypnosisView;
@interface AppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate> {
    HypnosisView *view;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;

@end
