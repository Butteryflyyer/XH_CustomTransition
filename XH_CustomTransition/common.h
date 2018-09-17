//
//  common.h
//  XH_CustomTransition
//
//  Created by 信昊 on 2018/9/14.
//  Copyright © 2018年 信昊. All rights reserved.
//

#ifndef common_h
#define common_h

#define  KSCreenWidth   [[UIScreen mainScreen] bounds].size.width
#define  KSCreenHeight  [[UIScreen mainScreen] bounds].size.height

// iPhone X
#define  K_iPhoneX (KSCreenWidth == 375.f && KSCreenHeight == 812.f ? YES : NO)

// Status bar height.
#define  K_StatusBarHeight      (K_iPhoneX ? 44.f : 20.f)

// Navigation bar height.
#define  K_NavigationBarHeight  (K_iPhoneX ? 88.f : 64.f)

// Tabbar height.
#define  K_TabbarHeight         (K_iPhoneX ? (49.f+34.f) : 49.f)

// Tabbar safe bottom margin.
#define  K_TabbarSafeBottomMargin         (K_iPhoneX ? 34.f : 0.f)

// Status bar & navigation bar height.
#define  K_StatusBarAndNavigationBarHeight  (K_iPhoneX ? 88.f : 64.f)

#define  K_ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

#define WeakObj(o) try{}@finally{} __weak typeof(o) o##Weak = o

#define RGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]
#define HEXColor(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]
#define DefualtMargin 20

#define FlowMenuCellHeight 280

#define GetAppDelegate  ((AppDelegate *)[UIApplication sharedApplication].delegate)


#endif /* common_h */
