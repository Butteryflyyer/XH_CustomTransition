
//
//  presentViewController.m
//  XH_CustomTransition
//
//  Created by 信昊 on 2018/9/14.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "presentViewController.h"
#import "presentDViewController.h"
#import "customPresentTransition.h"
@interface presentViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation presentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.ImageView.frame = CGRectMake(100, 200, 60, 100);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
    [self.ImageView addGestureRecognizer:tap];
    

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)tapGesture{
    
    presentDViewController *vc = [[presentDViewController alloc]init];
    vc.ImageView.image = self.ImageView.image;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [customPresentTransition new];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
