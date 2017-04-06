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
NSString *selectSql(NSArray<NSString *> *keys,NSString *table,NSString *where);

@end
