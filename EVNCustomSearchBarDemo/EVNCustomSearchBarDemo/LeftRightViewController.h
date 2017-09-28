//
//  LeftRightViewController.h
//  EVNCustomSearchBar
//
//  Created by developer on 2017/9/28.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EVNCustomSearchBar.h"

@interface LeftRightViewController : UIViewController<EVNCustomSearchBarDelegate>

/**
 * 导航搜索框EVNCustomSearchBar
 */
@property (strong, nonatomic) EVNCustomSearchBar *searchBar;


@end
