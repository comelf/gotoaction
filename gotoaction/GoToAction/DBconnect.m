//
//  DBconnect.m
//  GoToAction
//
//  Created by  byung-woo Lee on 13. 5. 22..
//  Copyright (c) 2013년  byung-woo Lee. All rights reserved.
//

#import "DBconnect.h"

@implementation DBconnect
-(int) totalRecord
{
    return total;
}
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
    NSString *sql = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS '%@' ('%@' INTEGER PRIMARY KEY, '%@' TEXT,'%@' TEXT);",DBtableName,DBfield1,DBfield2,DBfield3];
    
    if(sqlite3_exec(manual,[sql UTF8String], NULL, NULL,&err)!= SQLITE_OK){
        sqlite3_close(manual);
        NSAssert(0, @"could not create table");
    }else{
        NSLog(@"table created");
    }
}

-(void) saveDB:(int)value1
         title:(NSString*)value2
       content:(NSString*)value3
{
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO '%@' ('%@','%@','%@') VALUES ('%d','%@','%@')",DBtableName,DBfield1,DBfield2,DBfield3,value1,value2,value3];
    
    char *err;
    if (sqlite3_exec(manual,[sql UTF8String],NULL,NULL,&err)!=SQLITE_OK){sqlite3_close(manual);
        NSAssert(0,@"Could not save to table");
    }else{
        NSLog(@"table saved");
    }
}
-(void) updateDB:(int)value1
           title:(NSString*)value2
         content:(NSString*)value3
{
    NSString *sql = [NSString stringWithFormat:@"UPDATE '%@' SET '%@'='%@','%@'='%@' where '%@'='%d')",DBtableName,DBfield2,value2,DBfield3,value3,DBfield1,value1];
    
    char *err;
    if (sqlite3_exec(manual,[sql UTF8String],NULL,NULL,&err)!=SQLITE_OK){sqlite3_close(manual);
        NSAssert(0,@"Could not update table");
    }else{
        NSLog(@"table updated");
    }
}
-(void) deleteDB:(int)key
{
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM '%@' WHERE '%@' ='%d')",DBtableName,DBfield1,key];
    
    char *err;
    if (sqlite3_exec(manual,[sql UTF8String],NULL,NULL,&err)!=SQLITE_OK){sqlite3_close(manual);
        NSAssert(0,@"Could not Delete one data");
    }else{
        NSLog(@"Delete one data");
    }
}
-(void) deleteDBall
{
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM '%@'",DBtableName];
    
    char *err;
    if (sqlite3_exec(manual,[sql UTF8String],NULL,NULL,&err)!=SQLITE_OK){sqlite3_close(manual);
        NSAssert(0,@"Could not Delete all data ");
    }else{
        NSLog(@"Delete all data");
    }
}


- (id)dbQuerySelect
{
    NSString *querytring= [NSString stringWithFormat:@"SELECT * FROM '%@'",DBtableName];
    
    sqlite3_prepare(manual, [querytring cStringUsingEncoding:NSUTF8StringEncoding], querytring.length, &statment, nil);
    NSMutableArray *array;
    array = [[NSMutableArray alloc]init];
    total=0;
    while (sqlite3_step(statment)==SQLITE_ROW) {
        int Index = sqlite3_column_int(statment, 0);
        char* aField1 = sqlite3_column_text(statment, 1);
        char* aField2 = sqlite3_column_text(statment, 2);
        //char* aField3 = sqlite3_column_text(statment, 2);
        
        NSNumber *DBIndex = [NSNumber numberWithInt:Index];
        NSString *Field1Text = [NSString stringWithCString:aField1 encoding:NSUTF8StringEncoding];
        NSString *Field2Text = [NSString stringWithCString:aField2 encoding:NSUTF8StringEncoding];
        NSArray *record = [NSArray arrayWithObjects:DBIndex,Field1Text,Field2Text, nil] ;
        [array addObject:record];
        total+=1;
    }
    return array;
}

@end
