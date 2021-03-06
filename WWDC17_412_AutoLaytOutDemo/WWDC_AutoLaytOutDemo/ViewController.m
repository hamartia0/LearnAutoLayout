//
//  ViewController.m
//  WWDC_AutoLaytOutDemo
//
//  Created by 赵白杨 on 2017/9/12.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *wrappingView;

@property (weak, nonatomic) IBOutlet UIView *contentView;


@property (strong, nonatomic) NSLayoutConstraint *zeroHeightConstaint;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *edgeConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fakeHeightConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_wrappingView.heightAnchor constraintEqualToConstant:0];
}

- (IBAction)clickEditAction:(UIBarButtonItem *)sender {
    
    if (_zeroHeightConstaint == nil) {
        _zeroHeightConstaint = [_wrappingView.heightAnchor constraintEqualToConstant:0];
    }
    
    BOOL shouldShow = _edgeConstraint.isActive ? NO : YES;
    
    if (shouldShow) {
        _zeroHeightConstaint.active = NO;
        _edgeConstraint.active = YES;
    } else {
        _edgeConstraint.active = NO;
        _zeroHeightConstaint.active = YES;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)clickCartAction:(UIBarButtonItem *)sender {
    
    if (_fakeHeightConstraint.constant == 0) {
        _fakeHeightConstraint.constant = 79.0f;
    } else {
        _fakeHeightConstraint.constant = 0.0f;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    
}



@end
