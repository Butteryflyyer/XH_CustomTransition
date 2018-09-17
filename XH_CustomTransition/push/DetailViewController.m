
//
//  DetailViewController.m
//  XH_CustomTransition
//
//  Created by 信昊 on 2018/9/12.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
@interface DetailViewController ()
@property (nonatomic,strong) UIPercentDrivenInteractiveTransition *percentDrivenTransition;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanGesture:)];
    edgePan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePan];
    self.bgImageView.frame = self.view.bounds;
    // Do any additional setup after loading the view.
}
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        [self.view addSubview:_bgImageView];
    }
    return _bgImageView;
}
- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)edgePan {
    
    CGFloat progress = [edgePan translationInView:self.view].x / self.view.bounds.size.width;
    NSLog(@"%f", progress);
    
    if (edgePan.state == UIGestureRecognizerStateBegan) {
        self.percentDrivenTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    } else if (edgePan.state == UIGestureRecognizerStateChanged) {
        [self.percentDrivenTransition updateInteractiveTransition:progress];
    } else if (edgePan.state == UIGestureRecognizerStateChanged || edgePan.state == UIGestureRecognizerStateEnded) {
        [self.percentDrivenTransition finishInteractiveTransition];
        self.percentDrivenTransition = nil;
    }
    
}

#pragma mark -- UINavigationControllerDelegate

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    if ([animationController isKindOfClass:[ViewController class]]) {
        return self.percentDrivenTransition;
    }
    else {
        return nil;
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
