//
//  ViewController.m
//  FMDB
//
//  Created by tang on 15/12/17.
//  Copyright © 2015年 tang. All rights reserved.
//

#import "ViewController.h"
#import <FMDB/FMDB.h>
#import "NSString+JQSqlite.h"
@interface ViewController ()
@property (nonatomic, strong)FMDatabase *db;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *selectStr = [NSString stringWithFormat:@"select * from Student1 where name != 'lisi1' and age != '6'"];
    FMResultSet * rs = [self.db executeQuery:selectStr];
    while ([rs next]) {
        
        NSString * name = [rs stringForColumn:@"name"];
        NSInteger age = [rs intForColumn:@"age"];
        NSInteger hight = [rs intForColumn:@"hight"];
        NSDate *date = [rs dateForColumn:@"birthday"];
        NSLog(@"%@ , %ld, %ld, %@",name, age, hight, date);
    }
    [self.db close];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createdb:(id)sender {
    NSString *path = [NSString pathStringFolderName:@"Myfmdb" fileName:@"myPath.db"];
    self.db = [FMDatabase databaseWithPath:path];
    if ([self.db open]) {
        NSLog(@"open");
    }
}

- (IBAction)creatTable:(id)sender {
    NSString *string = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS Student1 (name text not null, age integer not null, hight integer, birthday date)"];
    BOOL creat = [self.db executeUpdate:string];
    if (creat) {
        NSLog(@"creat sucess");
    }
    
}

- (IBAction)deleteSource:(id)sender {
}

- (IBAction)addSource:(id)sender {
    for (int i = 0; i < 20; i++) {
        NSString *name = [NSString stringWithFormat:@"lisi%d", i];
        int age = 20 + arc4random_uniform(10);
        int hight = 160 + arc4random_uniform(25);
        NSDate *date = [NSDate date];
       BOOL res = [self.db executeUpdate:@"insert into Student1 (name , age, hight, birthday) values (?, ?, ?, ?)", name, @(age), @(hight), date];
        if (res) {
            NSLog(@"insert Success");
        }
    }
}

@end
