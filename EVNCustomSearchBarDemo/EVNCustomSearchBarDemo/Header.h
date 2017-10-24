//
//  Header.h
//  EVNCustomSearchBar
//
//  Created by developer on 2017/9/28.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#ifndef Header_h
#define Header_h


#define kEVNScreenWidth [UIScreen mainScreen].bounds.size.width
#define kEVNScreenHeight [UIScreen mainScreen].bounds.size.height

// iPhone X
#define kEVN_iPhoneX (kEVNScreenWidth == 375.f && kEVNScreenHeight == 812.f ? YES : NO)


#define kEVNScreenStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define kEVNScreenNavigationBarHeight 44.f


#define kEVNScreenTopStatusNaviHeight (kEVNScreenStatusBarHeight + kEVNScreenNavigationBarHeight)

#define kEVNScreenTabBarHeight (kEVN_iPhoneX ? (49.f+34.f) : 49.f)

/**
 // MARK: 安全区底部高度
 */
#define kEVNScreenTabBarSafeBottomMargin (kEVN_iPhoneX ? 34.f : 0.f)

#define TextColor ([Helper colorWithHexString:@"#555555" alpha:1.0])
#define TextBlackColor ([Helper colorWithHexString:@"#494848" alpha:1.0])
#define TextGrayColor ([Helper colorWithHexString:@"#666666" alpha:1.0])
#define TextRedColor ([Helper colorWithHexString:@"#fa5353" alpha:1.0])

#endif /* Header_h */
