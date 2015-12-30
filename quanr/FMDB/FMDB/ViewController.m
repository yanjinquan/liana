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
    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path = [str stringByAppendingPathComponent:@"myPath.db"];
//    FMDatabase *db = [FMDatabase databaseWithPath:path];
//    if ([db open]) {
//        NSLog(@"数据库一打开");
//        self.db = db;
//    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *selectStr = [NSString stringWithFormat:@"select * from Student where name != 'lisi1' and age != '6'"];
    FMResultSet * rs = [self.db executeQuery:selectStr];
    while ([rs next]) {
        
        NSString * name = [rs stringForColumn:@"name"];
        NSLog(@"%@",name);
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
    NSString *string = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS Student (name text not null, age integer not null, hight integer, birthday text)"];
    BOOL creat = [self.db executeUpdate:string];
    if (creat) {
        NSLog(@"creat sucess");
    }
}

- (IBAction)deleteSource:(id)sender {
}

- (IBAction)addSource:(id)sender {
    for (int i = 0; i < 20; i++) {
    NSString *insertString = [NSString stringWithFormat:@"insert into Student (name , age, hight, birthday) values ('lisi%u', '%u', '%u', '%@')", i, arc4random_uniform(100), arc4random_uniform(200), [NSDate date]];
        if([self.db executeUpdate:insertString]) NSLog(@"insert success");
    }
}
@end
