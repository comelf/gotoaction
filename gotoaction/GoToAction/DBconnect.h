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
}
-(NSString*) filePath;
-(void)openDB;
-(void) createTable:(NSString*) tableName
            imgPath:(NSString*) img_path
          textField:(NSString*) text_field
                Idx:(NSString*) index_n;
-(void) saveDB:(NSString*)value1
       imgPath:(NSString*)value2;
@end
