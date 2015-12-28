//
//  ViewController.m
//  FMDB
//
//  Created by tang on 15/12/17.
//  Copyright © 2015年 tang. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"
@interface ViewController ()
@property (nonatomic, strong)FMDatabase *db;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path = [str stringByAppendingPathComponent:@"myPath.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    if ([db open]) {
        NSLog(@"数据库一打开");
        self.db = db;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.db
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
