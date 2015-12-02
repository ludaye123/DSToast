//
//  ViewController.m
//  DSToast
//
//  Created by LS on 8/18/15.
//  Copyright (c) 2015 LS. All rights reserved.
//

#import "ViewController.h"
#import "DSToast.h"

@interface ViewController ()
- (IBAction)handleShow:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)handleShow:(id)sender
{
    DSToast *toast = [[DSToast alloc] initWithText:@"iOS是由苹果公司开发的移动操作系统"];
//    [toast showInView:self.view];
    [toast show];
//    [toast showInView:self.view showType:DSToastShowTypeBottom];
}

- (IBAction)handleScale:(id)sender
{
    DSToast *toast = [DSToast toastWithText:@"iOS是由苹果公司开发的移动操作系统" animationType:DSToastAnimationTypeScale];
    [toast showInView:self.view];
}

- (IBAction)handleTranslate:(id)sender
{
    DSToast *toast = [DSToast toastWithText:@"iOS是由苹果公司开发的移动操作系统" animationType:DSToastAnimationTypePositionLeftToRight];
    [toast showInView:self.view];
}
@end
