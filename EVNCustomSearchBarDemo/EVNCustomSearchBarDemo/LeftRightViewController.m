//
//  LeftRightViewController.m
//  EVNCustomSearchBar
//
//  Created by developer on 2017/9/28.
//  Copyright © 2017年 仁伯安. All rights reserved.
//

#import "LeftRightViewController.h"
#import "Header.h"
#import "Helper.h"

@interface LeftRightViewController ()

@end

@implementation LeftRightViewController

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

    UIBarButtonItem *rightButtonItemFir = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(rightButtonItemAction:)];

    UIBarButtonItem *rightButtonItemSec = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(rightButtonItemAction:)];

    self.navigationItem.rightBarButtonItems = @[rightButtonItemFir, rightButtonItemSec];
}

#pragma mark: getter method EVNCustomSearchBar
- (EVNCustomSearchBar *)searchBar
{
    if (!_searchBar)
    {
        _searchBar = [[EVNCustomSearchBar alloc] initWithFrame:CGRectMake(0, 20, kEVNScreenWidth, 44)];

        _searchBar.backgroundColor = [UIColor clearColor]; // 清空searchBar的背景色
        _searchBar.iconImage = [Helper imagesNamedFromCustomBundle:@"EVNCustomSearchBar.png"];
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

- (void)rightButtonItemAction:(UIBarButtonItem *)buttonItem
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"单击俺作甚🙄" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"咋地" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];

    UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [rootViewController presentViewController:alertController animated:NO completion:nil];
}

@end
