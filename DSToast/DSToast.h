//
//  DSToast.h
//  DSToast
//
//  Created by LS on 8/18/15.
//  Copyright (c) 2015 LS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSToastAnimation.h"

typedef NS_ENUM(NSInteger, DSToastShowType)
{
    DSToastShowTypeTop,
    DSToastShowTypeCenter,
    DSToastShowTypeBottom
};

@interface DSToast : UILabel

@property (nonatomic, assign) CFTimeInterval forwardAnimationDuration;
@property (nonatomic, assign) CFTimeInterval backwardAnimationDuration;
@property (nonatomic, assign) CFTimeInterval waitAnimationDuration;

@property (nonatomic, assign) UIEdgeInsets   textInsets;
@property (nonatomic, assign) CGFloat        maxWidth;

@property (nonatomic, readonly, assign) DSToastShowType showType;
@property (nonatomic, readonly, assign) DSToastAnimationType animationType;

+ (instancetype)toastWithText:(NSString *)text;
+ (instancetype)toastWithText:(NSString *)text animationType:(DSToastAnimationType)animationType;

- (instancetype)initWithText:(NSString *)text;
- (instancetype)initWithText:(NSString *)text animationType:(DSToastAnimationType)animationType;


- (void)show;   // show in window
- (void)showWithType:(DSToastShowType)type; // show in window with type
- (void)showInView:(UIView *)view;    //Default is DSToastShowTypeBottom
- (void)showInView:(UIView *)view showType:(DSToastShowType)type;

@end
