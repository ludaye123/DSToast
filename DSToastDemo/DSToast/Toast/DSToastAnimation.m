//
//  DSToastAnimation.m
//  DSToast
//
//  Created by LS on 10/16/15.
//  Copyright © 2015 LS. All rights reserved.
//

#import "DSToastAnimation.h"

@interface DSToastAnimation ()

@end

static NSString *const kScaleKeyPath = @"transform.scale";
static NSString *const kOpacityKeyPath = @"opacity";

@implementation DSToastAnimation

//+ (instancetype)sharedAnimation
//{
//    static id instance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//        instance = [[self alloc] init];
//    });
//    
//    return instance;
//}

+ (instancetype)toastAnimation
{
    return [[self alloc] init];
}

- (CAAnimation *)animationWithType:(DSToastAnimationType)animationType
{
    CABasicAnimation *forwardAnimation = nil;
    CABasicAnimation *backwardAnimation = nil;
   
    switch (animationType)
    {
        case DSToastAnimationTypeAlpha:
            forwardAnimation = [CABasicAnimation animationWithKeyPath:kOpacityKeyPath];
            backwardAnimation = [CABasicAnimation animationWithKeyPath:kOpacityKeyPath];
            
            forwardAnimation.fromValue = @0.0;
            forwardAnimation.toValue = @1.0;
            backwardAnimation.fromValue = @1.0;
            backwardAnimation.toValue = @0.0;
            break;
            
        case DSToastAnimationTypeScale:
            forwardAnimation = [CABasicAnimation animationWithKeyPath:kScaleKeyPath];
            forwardAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.5f :1.7f :0.6f :0.85f];
            backwardAnimation = [CABasicAnimation animationWithKeyPath:kScaleKeyPath];
            backwardAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.4f :0.15f :0.5f :-0.7f];
            forwardAnimation.fromValue = @0.0;
            forwardAnimation.toValue = @1.0;
            backwardAnimation.fromValue = @1.0;
            backwardAnimation.toValue = @0.0;
            
            break;
            
        case DSToastAnimationTypePositionLeftToRight:
            
            forwardAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
            backwardAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
            forwardAnimation.fromValue = @(-CGRectGetWidth([UIScreen mainScreen].bounds));
            forwardAnimation.toValue = @(CGRectGetWidth([UIScreen mainScreen].bounds)/2);
            backwardAnimation.fromValue = @(CGRectGetWidth([UIScreen mainScreen].bounds)/2);
            backwardAnimation.toValue = @(CGRectGetWidth([UIScreen mainScreen].bounds) * 2);
            
            break;
        
        default:
            break;
    }
    
    forwardAnimation.duration = self.forwardAnimationDuration;
    backwardAnimation.duration = self.backwardAnimationDuration;
    backwardAnimation.beginTime = forwardAnimation.duration + self.waitAnimationDuration;

    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[forwardAnimation,backwardAnimation];
    animationGroup.duration = self.forwardAnimationDuration + self.backwardAnimationDuration + self.waitAnimationDuration;
    animationGroup.removedOnCompletion = NO;
    animationGroup.delegate = self;
    animationGroup.fillMode = kCAFillModeForwards;
    
    return animationGroup;
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(toastAnimationDidStop:finished:)])
    {
        [self.delegate toastAnimationDidStop:anim finished:flag];
    }
}

@end
