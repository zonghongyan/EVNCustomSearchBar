//
//  ViewController.h
//  EVNCustomSearchBar
//
//  Created by developer on 2017/9/28.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EVNCustomSearchBar.h"


@interface ViewController : UIViewController<EVNCustomSearchBarDelegate, UISearchResultsUpdating, UISearchControllerDelegate>

/**
 * 导航搜索框EVNCustomSearchBar
 */
@property (strong, nonatomic) EVNCustomSearchBar *searchBar;


/**
 * 获取输入的数据
 */
@property (copy, nonatomic) NSString *inputText;

/**
 * 搜索控制器
 */
@property (strong, nonatomic) UISearchController *searchController;

/**
 * 搜索使用的表示图控制器
 */
@property (strong, nonatomic) UITableViewController *searchTVC;

@end

