//
//  presentDViewController.m
//  XH_CustomTransition
//
//  Created by 信昊 on 2018/9/14.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "presentDViewController.h"
#import "common.h"
@interface presentDViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation presentDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}
-(void)initUI{
    self.view.backgroundColor = [UIColor whiteColor];
  
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, KSCreenWidth, KSCreenHeight - 20)];
    
    self.scrollView.delegate = self;
//    [self.scrollView.panGestureRecognizer requireGestureRecognizerToFail:edgePan];
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(KSCreenWidth, KSCreenHeight+300);

    [self.scrollView addSubview:self.ImageView];
    
    CGSize size = CGSizeMake(KSCreenWidth, KSCreenHeight);
    CGFloat height = (size.height/size.width)*(KSCreenWidth - DefualtMargin*2);
    self.ImageView.frame = CGRectMake(DefualtMargin, DefualtMargin, KSCreenWidth - DefualtMargin*2, height);
    
}
-(UIImageView *)ImageView{
    if (!_ImageView) {
        _ImageView = [[UIImageView alloc]init];
        _ImageView.userInteractionEnabled = YES;
    }
    return _ImageView;
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.scrollView.contentOffset.y < -120 && !self.parentViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
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
