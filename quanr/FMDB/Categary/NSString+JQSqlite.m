//
//  NSString+JQSqlite.m
//  FMDB
//
//  Created by tang on 15/12/30.
//  Copyright © 2015年 tang. All rights reserved.
//

#import "NSString+JQSqlite.h"

@implementation NSString (JQSqlite)
+ (NSString *)pathStringFolderName :(NSString *)folder fileName : (NSString *)file{
    NSString *domans = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    if (folder) {
        folder = [domans stringByAppendingPathComponent:folder];
        NSFileManager *manager = [NSFileManager defaultManager];
        NSError *error;
        [manager createDirectoryAtPath:folder withIntermediateDirectories:YES attributes:nil error:&error];//创建文件夹的方法
    }
    NSString *filePath = [folder stringByAppendingPathComponent:file];
    NSLog(@"%@", filePath);
    return filePath;
}
@end
