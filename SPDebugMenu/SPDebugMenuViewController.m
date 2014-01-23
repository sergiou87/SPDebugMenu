//
//  SPDebugMenuViewController.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuViewController.h"

#import "SPDebugMenuAction.h"
#import "SPDebugMenuActionCell.h"

static NSString *kDebugMenuCellIdentifier = @"kDebugMenuCellIdentifier";

@interface SPDebugMenuViewController () <SPDebugMenuActionDelegate>

@property (nonatomic, copy) NSArray *actions;

@end

@implementation SPDebugMenuViewController

- (instancetype)initWithDebugMenuActions:(NSArray *)actions
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        _actions = [actions copy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Debug menu";
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(doneButtonTapped)];
    [self.navigationItem setRightBarButtonItem:doneButton];
    
    [self.tableView registerClass:[SPDebugMenuActionCell class]
           forCellReuseIdentifier:kDebugMenuCellIdentifier];
}

- (void)doneButtonTapped
{
    [self.delegate debugMenuViewControllerDidFinish:self];
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
    cell.detailTextLabel.text = action.detailedDescription;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<SPDebugMenuAction> action = self.actions[indexPath.row];
    action.delegate = self;

    [action performActionWithNavigationController:self.navigationController];
}

#pragma mark - SPDebugMenuActionDelegate methods

- (void)debugMenuActionDidStart:(id<SPDebugMenuAction>)action
{
    
}

- (void)debugMenuActionDidEnd:(id<SPDebugMenuAction>)action
{
    action.delegate = nil;
    
    if ([action shouldDismissDebugMenuAfterFinish])
    {
        [self.delegate debugMenuViewControllerDidFinish:self];
    }
    else if ([action shouldReloadDebugMenuAfterFinish])
    {
        [self.tableView reloadData];
    }
}

@end
