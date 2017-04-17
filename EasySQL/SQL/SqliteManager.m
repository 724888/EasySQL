//
//  SqliteManager.m
//  LPandFP
//
//  Created by LMsgSendNilSelf on 2017/4/6.
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

NSString *selectSql(NSString *table,NSArray<NSString *> *keys,NSString *where) {

    SqliteMaker *maker = [[SqliteMaker alloc]init];
    maker.select(keys).from(table).where(where);
    return maker.sqlCommand;
}

NSString *insertSql(NSString *table,NSDictionary<NSString *,NSString *> *dictionary) {
    
    SqliteMaker *maker = [[SqliteMaker alloc]init];
    maker.insert(table,dictionary);
    return maker.sqlCommand;
}

NSString *deleteSql(NSString *table) {

    SqliteMaker *maker = [[SqliteMaker alloc]init];
    maker.delete(table);
    return maker.sqlCommand;
}

/*only use the method when primary key autoincrement*/
NSString *resetPrimaryKey(NSString *table) {
   
    SqliteMaker *maker = [[SqliteMaker alloc]init];
    maker.resetPrimaryKey(table);
    return maker.sqlCommand;
}

@end
