//
//  DBconnect.m
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 22..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import "DBconnect.h"

@implementation DBconnect

-(NSString*)filePath{
    NSArray *paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"manual.sqlite"];
}
-(void)openDB{
    if(sqlite3_open([[self filePath] UTF8String],&manual)!= SQLITE_OK){
        sqlite3_close(manual);
        NSAssert(0, @"Database failed to open");
    }else{
        NSLog(@"database OK");
    }
}

-(void) createTable:(NSString*) tableName
            imgPath:(NSString*) img_path
          textField:(NSString*) text_field
                Idx:(NSString*) index_n
{
    DBtableName=tableName;
    DBfield1=index_n;
    DBfield2=img_path;
    DBfield3=text_field;
    
    char *err;
    NSString *sql = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS '%@' ('%@' INTEGER PRIMARY KEY AUTOINCREMENT, '%@' TEXT,'%@' TEXT);",DBtableName,DBfield1,DBfield2,DBfield3];
    
    if(sqlite3_exec(manual,[sql UTF8String], NULL, NULL,&err)!= SQLITE_OK){
        sqlite3_close(manual);
        NSAssert(0, @"could not create table");
    }else{
        NSLog(@"table created");
    }
}

-(void) saveDB:(NSString*)value1
       and:(NSString*)value2
{
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO '%@' ('img_path','content') VALUES ('%@','%@')",DBtableName,value1,value2];
    
    char *err;
    if (sqlite3_exec(manual,[sql UTF8String],NULL,NULL,&err)!=SQLITE_OK){sqlite3_close(manual);
        NSAssert(0,@"Could not update table");
    }else{
        NSLog(@"table updated");
    }
    
}
@end
