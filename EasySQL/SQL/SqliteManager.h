//
//  SqliteManager.h
//  LPandFP
//
//  Created by wpstarnice on 2017/4/6.
//  Copyright © 2017年 p. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SqliteManager : NSObject

NSString *createSql(NSString *table,NSArray<NSString *> *keys);
NSString *selectSql(NSString *table,NSArray<NSString *> *keys,NSString *where);
NSString *insertSql(NSString *table,NSDictionary<NSString *,NSString *> *dictionary);
NSString *deleteSql(NSString *table);
NSString *resetPrimaryKey(NSString *table);

@end
