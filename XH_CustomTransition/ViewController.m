//
//  ViewController.m
//  XH_CustomTransition
//
//  Created by 信昊 on 2018/9/12.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "customNavgationPushTransition.h"
#import "customNavgationPopTransition.h"
@interface ViewController ()<UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.ImageView.frame = CGRectMake(100, 200, 60, 100);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
    [self.ImageView addGestureRecognizer:tap];
    
     self.navigationController.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)tapGesture{
    
    DetailViewController *vc = [[DetailViewController alloc]init];
    vc.bgImageView.image = self.ImageView.image;
    vc.transitioningDelegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}



#pragma mark -- UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if (operation == UINavigationControllerOperationPush) {
        return [customNavgationPushTransition new];
    } else if (operation == UINavigationControllerOperationPop && fromVC != self) {
        return [customNavgationPopTransition new];
    } else {
        return nil;
    }
}


-(UIImageView *)ImageView{
    if (!_ImageView) {
        _ImageView = [[UIImageView alloc]init];
        _ImageView.userInteractionEnabled = YES;
        _ImageView.image = [UIImage imageNamed:@"2.jpeg"];
        [self.view addSubview:_ImageView];
    }
    return _ImageView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
