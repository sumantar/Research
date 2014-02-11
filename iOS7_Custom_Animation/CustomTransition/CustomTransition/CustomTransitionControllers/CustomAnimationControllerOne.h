//
//  CustomAnimationControllerOne.h
//  CustomTransition
//
//  Created by sumantar on 10/02/14.
//  Copyright (c) 2014 sumantar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomAnimatedTransitioningController.h"

@interface CustomAnimationControllerOne : NSObject <CustomAnimatedTransitioningController>

@property (nonatomic, assign) NSTimeInterval presentationDuration;

@property (nonatomic, assign) NSTimeInterval dismissalDuration;

@property (nonatomic, assign) BOOL isPresenting;

@end
