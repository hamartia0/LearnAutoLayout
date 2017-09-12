//
//  TrackTouchViewController.m
//  WWDC_AutoLaytOutDemo
//
//  Created by 赵白杨 on 2017/9/12.
//  Copyright © 2017年 赵白杨. All rights reserved.
//

#import "TrackTouchViewController.h"

@interface TrackTouchViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *cardView;

@end

@implementation TrackTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (CGAffineTransform)transformFunc:(CGPoint)transfrom {
    CGAffineTransform moveBy = CGAffineTransformMakeTranslation(transfrom.x, transfrom.y);
    double rotation = -sin(transfrom.x / (_cardView.frame.size.width * 4.0));
    
    return CGAffineTransformRotate(moveBy, rotation);
}

- (IBAction)userGesture:(UIPanGestureRecognizer *)sender {
    
    NSLog(@"gesture");
    
    switch (sender.state) {
        case UIGestureRecognizerStateChanged:
        {
            CGPoint translation = [sender translationInView:self.view];
            _cardView.transform = [self transformFunc:translation];
        }
            break;
        
        case UIGestureRecognizerStateEnded:
        {
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:1.0 options:UIViewAnimationOptionTransitionNone animations:^{
                _cardView.transform = CGAffineTransformIdentity;
            } completion:nil
            ];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
