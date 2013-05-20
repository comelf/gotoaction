//
//  DBconnect.h
//  WeAreBaby
//
//  Created by  byung-woo Lee on 13. 5. 17..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface DBconnect : NSObject
{
    sqlite3 *db;
}

-(NSString*) filePath;
-(void) openDB;
-(void) linkDocuments;
-(void) createTable:(NSString*) tableName
          withFeld1:(NSString*) field1
          withFeld2:(NSString*) field2
          withFeld3:(NSString*) field3;
@end
