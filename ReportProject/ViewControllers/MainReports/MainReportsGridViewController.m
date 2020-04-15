//
//  MainReportsGridViewController.m
//  ReportProject
//
//  Created by Arthur on 4/6/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainReportsGridViewController.h"
#import "AppDelegate.h"

@interface MainReportsGridViewController()

@property (weak, nonatomic) IBOutlet UICollectionView *mainView;

@end

@implementation MainReportsGridViewController
{
    NSArray *mList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initArray];
    _mainView.backgroundColor = [UIColor colorWithRed:235/255.0f green:242/255.0f blue:212/255.0f alpha:1];
    _mainView.dataSource = self;
    _mainView.delegate = self;
}

-(void) initArray
{
    mList = @[@"Arthur",@"Merlin",@"Modred",@"Gawain",@"Lancelot",@"Bedivere",@"Tristan",@"Garreth",@"Morgan"];
}

#pragma <UICollectionViewDatasource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return mList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FolderViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FolderItem" forIndexPath:indexPath];
    cell.mainIconImage.image = [UIImage imageNamed:@"folder-icon"];
    cell.nameLabel.text = [mList objectAtIndex:indexPath.row];
    [cell.nameLabel setFont:[UIFont boldSystemFontOfSize:20]];
    return  cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [[AppDelegate shareInstance] showWarningNotificationWithMessage:[mList objectAtIndex:indexPath.row]];
}


@end
