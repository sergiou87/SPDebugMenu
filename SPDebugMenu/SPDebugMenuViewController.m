//
//  SPDebugMenuViewController.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuViewController.h"

#import "SPDebugMenuAction.h"

static NSString *kDebugMenuCellIdentifier = @"kDebugMenuCellIdentifier";

@interface SPDebugMenuViewController ()

@property (nonatomic, copy) NSArray *actions;
@property (nonatomic, strong) UIImage *screenshot;

@end

@implementation SPDebugMenuViewController

- (instancetype)initWithDebugMenuActions:(NSArray *)actions
                              screenshot:(UIImage *)screenshot
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        _actions = [actions copy];
        _screenshot = screenshot;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Debug menu";
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:kDebugMenuCellIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.actions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDebugMenuCellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    id<SPDebugMenuAction> action = self.actions[indexPath.row];
    cell.textLabel.text = action.title;
    cell.detailTextLabel.text = action.description;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<SPDebugMenuAction> action = self.actions[indexPath.row];
    
    [action performActionWithNavigationController:self.navigationController
                                       screenshot:self.screenshot];
}

@end
