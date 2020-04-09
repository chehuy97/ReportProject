//
//  MainReportTreeListViewController.m
//  ReportProject
//
//  Created by Arthur on 4/6/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainReportTreeListViewController.h"

@interface MainReportTreeListViewController()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainReportTreeListViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    _tableView.backgroundColor = [UIColor colorWithRed:235/255.0f green:242/255.0f blue:212/255.0f alpha:1];
    _tableView.dataSource = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemTreeViewCell *cell = (ItemTreeViewCell *) [ tableView dequeueReusableCellWithIdentifier:@"FolderItem"];
    cell.baseIconImage.image = [UIImage imageNamed:@"folder-icon"];
    cell.nameLabel.text = @"Folder";
    
    return cell;
}

@end
