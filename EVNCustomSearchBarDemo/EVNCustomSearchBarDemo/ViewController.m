//
//  ViewController.m
//  EVNCustomSearchBar
//
//  Created by developer on 2017/9/28.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
#import "Helper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self initSearchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark: 设置顶部导航搜索部分
- (void)initSearchBar
{
    self.navigationItem.titleView = self.searchBar;
    if (@available(iOS 11.0, *))
    {
        [self.searchBar.heightAnchor constraintLessThanOrEqualToConstant:44].active = YES;
    }
    else
    {

    }
}

#pragma mark: getter method EVNCustomSearchBar
- (EVNCustomSearchBar *)searchBar
{
    if (!_searchBar)
    {
        _searchBar = [[EVNCustomSearchBar alloc] initWithFrame:CGRectMake(0, 20, kEVNScreenWidth, 44)];

        _searchBar.backgroundColor = [UIColor clearColor]; // 清空searchBar的背景色
        _searchBar.iconImage = [UIImage imageNamed:@"EVNCustomSearchBar.bundle/searchImageBlack.png"];
//        _searchBar.iconImage = [UIImage imageNamed:@"EVNCustomSearchBar.bundle/searchImageTextColor.png"];
        _searchBar.iconAlign = EVNCustomSearchBarIconAlignCenter;
        [_searchBar setPlaceholder:@"请输入关键字"];  // 搜索框的占位符
        _searchBar.placeholderColor = TextGrayColor;
        _searchBar.delegate = self; // 设置代理
        [_searchBar sizeToFit];
    }
    return _searchBar;
}

#pragma mark: EVNCustomSearchBar delegate method
- (BOOL)searchBarShouldBeginEditing:(EVNCustomSearchBar *)searchBar
{
    NSLog(@"class: %@ function:%s", NSStringFromClass([self class]), __func__);
    self.searchTVC = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    self.searchTVC.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //    _searchTVC.tableView.dataSource = self;
    //    _searchTVC.tableView.delegate = self;
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:_searchTVC];

    // 搜索框检测代理
    _searchController.searchResultsUpdater = self;
    _searchController.delegate = self;
    _searchController.searchBar.placeholder = @"咋地/不咋地/咋地";

    // KVC
    UITextField *searchField = [_searchController.searchBar valueForKey:@"_searchField"]; // 先取出textfield

    [searchField setValue:self.searchBar.placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    searchField.textColor = self.searchBar.textColor;
    searchField.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
    [_searchController.searchBar setValue:@"取消" forKey:@"_cancelButtonText"];
    [[[_searchController.searchBar.subviews.firstObject subviews] firstObject] removeFromSuperview]; // 直接把背景imageView干掉。在iOS8,9是没问题的，7没测试过。

    //  _searchController.searchBar.delegate = self;
    [self presentViewController:_searchController animated:YES completion:^{
        //        self.searchBar.hidden = YES;
        //        self.view.hidden = YES;
    }];
    return YES;
}

- (void)searchBarTextDidBeginEditing:(EVNCustomSearchBar *)searchBar
{
    NSLog(@"class: %@ function:%s", NSStringFromClass([self class]), __func__);
}

- (BOOL)searchBarShouldEndEditing:(EVNCustomSearchBar *)searchBar
{
    NSLog(@"class: %@ function:%s", NSStringFromClass([self class]), __func__);
    return YES;
}

- (void)searchBarTextDidEndEditing:(EVNCustomSearchBar *)searchBar
{
    NSLog(@"class: %@ function:%s", NSStringFromClass([self class]), __func__);
}

- (void)searchBar:(EVNCustomSearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"class: %@ function:%s", NSStringFromClass([self class]), __func__);
}

- (BOOL)searchBar:(EVNCustomSearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSLog(@"class: %@ function:%s", NSStringFromClass([self class]), __func__);
    return YES;
}

- (void)searchBarSearchButtonClicked:(EVNCustomSearchBar *)searchBar
{
    NSLog(@"class: %@ function:%s", NSStringFromClass([self class]), __func__);
}

- (void)searchBarCancelButtonClicked:(EVNCustomSearchBar *)searchBar
{
    NSLog(@"class: %@ function:%s", NSStringFromClass([self class]), __func__);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.searchBar resignFirstResponder];
}

#pragma mark: UISearchResultsUpdating Method
#pragma mark 监听者搜索框中的值的变化
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    // 1. 获取输入的值
    self.inputText = self.searchBar.text;
//    [self afn1];
}


@end
