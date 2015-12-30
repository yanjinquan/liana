//
//  ViewController.h
//  FMDB
//
//  Created by tang on 15/12/17.
//  Copyright © 2015年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *creatdb;
@property (strong, nonatomic) IBOutlet UIButton *creatTable;

@property (strong, nonatomic) IBOutlet UIButton *deleteSource;
@property (strong, nonatomic) IBOutlet UIButton *addSource;
- (IBAction)createdb:(id)sender;
- (IBAction)creatTable:(id)sender;
- (IBAction)deleteSource:(id)sender;
- (IBAction)addSource:(id)sender;

@end

