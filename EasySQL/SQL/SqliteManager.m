//
//  SqliteManager.m
//  LPandFP
//
//  Created by wpstarnice on 2017/4/6.
//  Copyright © 2017年 p. All rights reserved.
//

#import "SqliteManager.h"
#import "SqliteMaker.h"

@implementation SqliteManager

NSString *createSql(NSString *table,NSArray<NSString *> *keys) {
    
    SqliteMaker *maker = [[SqliteMaker alloc]init];
    maker.create(table,keys);
    
    return maker.sqlCommand;
}

NSString *selectSql(NSArray<NSString *> *keys,NSString *table,NSString *where) {

    SqliteMaker *maker = [[SqliteMaker alloc]init];
    maker.select(keys).from(table).where(where);
    
    return maker.sqlCommand;
}

@end
