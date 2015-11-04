//
//  DSToastAnimation.h
//  DSToast
//
//  Created by LS on 10/16/15.
//  Copyright © 2015 LS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol DSToastAnimationDelegate;

typedef NS_ENUM(NSInteger, DSToastAnimationType)
{
    DSToastAnimationTypeAlpha, // default
    DSToastAnimationTypeScale,
    DSToastAnimationTypePositionLeftToRight
};

@interface DSToastAnimation : NSObject

@property (nonatomic, assign) CFTimeInterval forwardAnimationDuration;
@property (nonatomic, assign) CFTimeInterval backwardAnimationDuration;
@property (nonatomic, assign) CFTimeInterval waitAnimationDuration;

@property (nonatomic, weak) id<DSToastAnimationDelegate> delegate;

+ (instancetype)toastAnimation;

- (CAAnimation *)animationWithType:(DSToastAnimationType)animationType;

@end


@protocol DSToastAnimationDelegate <NSObject>

@optional

- (void)toastAnimationDidStop:(CAAnimation *)anim finished:(BOOL)flag;

@end