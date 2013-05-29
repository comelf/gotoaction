///Users/byung-woolee/Desktop/hudy/GoToAction/GoToAction.xcodeproj
//  DBconnect.h
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 22..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface DBconnect : NSObject
{
    sqlite3* manual;
    NSString* DBtableName;
    NSString* DBfield1;
    NSString* DBfield2;
    NSString* DBfield3;
    sqlite3_stmt *statment;
    int total;
}

-(NSString*) filePath;
-(void)openDB;
-(void) createTable:(NSString*) tableName
            imgPath:(NSString*) img_path
          textField:(NSString*) text_field
                Idx:(NSString*) index_n;
-(void) saveDB:(int)value1
         title:(NSString*)value2
       content:(NSString*)value3;
-(void) updateDB:(int)value1
           title:(NSString*)value2
         content:(NSString*)value3;
-(void) deleteDB:(int)key;
-(void) deleteDBall;
- (id)dbQuerySelect;
-(int) totalRecord;
@end
