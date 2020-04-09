//
//  MainReportsGridViewController.m
//  ReportProject
//
//  Created by Arthur on 4/6/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainReportsGridViewController.h"

@interface MainReportsGridViewController()

@property (weak, nonatomic) IBOutlet UICollectionView *mainView;

@end

@implementation MainReportsGridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mainView.backgroundColor = [UIColor colorWithRed:235/255.0f green:242/255.0f blue:212/255.0f alpha:1];
    _mainView.dataSource = self;
}

#pragma <UICollectionViewDatasource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FolderViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FolderItem" forIndexPath:indexPath];
    cell.mainIconImage.image = [UIImage imageNamed:@"folder-icon"];
    cell.nameLabel.text = @"Folder";
    [cell.nameLabel setFont:[UIFont boldSystemFontOfSize:20]];
    return  cell;
    
}


@end
