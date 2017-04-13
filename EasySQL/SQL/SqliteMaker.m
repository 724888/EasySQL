//
//  SqliteMaker.m
//  LPandFP
//
//  Created by wpstarnice on 2017/4/6.
//  Copyright © 2017年 p. All rights reserved.
//

#import "SqliteMaker.h"

@interface SqliteMaker () <SelectNextCommand>{

    NSMutableString *_sqlCommand;
}

@end

@implementation SqliteMaker

- (instancetype)init {

    if (self = [super init]) {
        _sqlCommand = [NSMutableString string];
    }
    
    return self;
}

- (NSString *)sqlCommand {

    return [_sqlCommand copy];
}

- (SqliteMaker *(^)(NSString *table,NSArray<NSString *> *))create {
    
    return ^SqliteMaker*(NSString *table,NSArray<NSString *> *keys) {
        
        NSString *keyString = [keys componentsJoinedByString:@","];
        [_sqlCommand appendFormat:@" create table if not exists %@ (%@) ",table,keyString];
        return self;
    };
}

- (SqliteMaker *(^)(NSString *table,NSDictionary<NSString *,NSString *> *))insert {
    
    return ^SqliteMaker*(NSString *table,NSDictionary<NSString *,NSString *> *dictionary) {
        
        NSString *keyString = [[dictionary allKeys] componentsJoinedByString:@","];
        NSString *valueString = [[dictionary allValues]componentsJoinedByString:@","];
        [_sqlCommand appendFormat:@" insert into %@ (%@) values (%@) ",table,keyString,valueString];
        return self;
    };
}

- (SqliteMaker *(^)())delete {
    
    return ^SqliteMaker*() {
        [_sqlCommand appendString:@" delete "];
        return self;
    };
}

- (SqliteMaker<SelectNextCommand> *(^)(NSArray<NSString *> *))select {

    return ^SqliteMaker*(NSArray<NSString *> *commands) {
        NSString *str;
        if (commands.count>0) {
            str = [commands componentsJoinedByString:@","];
        } else {
            str = @" select * ";
        }
        [_sqlCommand appendString:str];
        return self;
    };
}

- (SqliteMaker *(^)(NSString *))where {

    return ^SqliteMaker*(NSString *command) {
        [_sqlCommand appendFormat:@" where %@ ",command];
        return self;
    };
}

- (SqliteMaker *(^)(NSString *key,SqlSortType type))orderBy {
    
    return ^SqliteMaker*(NSString *key,SqlSortType type) {
        [_sqlCommand appendFormat:@" order by %@ = %@ ",key,type == SqlDESCSort ? @"desc" : @"asc"];
        return self;
    };
}

- (SqliteMaker *(^)(NSString *))limit {
    
    return ^SqliteMaker*(NSString *numberStr) {
        [_sqlCommand appendFormat:@" limit %@ ",numberStr];
        return self;
    };
}

- (SqliteMaker *(^)(NSString *))resetPrimaryKey {
    
    return ^SqliteMaker*(NSString *table) {
        [_sqlCommand appendFormat:@"update sqlite_sequence set seq=0 where name= '%@'",table];
        return self;
    };
}

#pragma mark - SelectNextCommand
- (SqliteMaker *(^)(NSString *))from {
    
    return ^SqliteMaker*(NSString *command) {
        [_sqlCommand appendFormat:@" from %@ ",command];
        return self;
    };
}

@end
