//
//  DBconnect.m
//  WeAreBaby
//
//  Created by  byung-woo Lee on 13. 5. 17..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import "DBconnect.h"

@implementation DBconnect

//파일 경로 찾기
-(NSString*)filePath{
    NSArray *paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"db.sqlite"];
}

-(void)openDB{
    if(sqlite3_open([[self filePath] UTF8String],&db)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0, @"Database failed to open");
    }else{
        NSLog(@"database OK");
    }
}

-(void) createTable:(NSString*) tableName
                idx:(NSString*) idx
          withFeld1:(NSString*) field1
          withFeld2:(NSString*) field2
          withFeld3:(NSString*) field3
{
    char *err;
    NSString *sql = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS '%@' ('%@' INTEGER PRIMARY KEY AUTOINCREMENT, '%@' TEXT,'%@' TEXT,'%@' TEXT);",tableName,idx,field1,field2,field3];
    
    if(sqlite3_exec(db,[sql UTF8String], NULL, NULL,&err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0, @"could not create table");
    }else{
        NSLog(@"table created");
    }
}

@end
