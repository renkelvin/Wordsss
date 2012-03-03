//
//  SearchHis.m
//  Wordsss
//
//  Created by Ren Chuan on 2/25/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "SearchHis.h"
#import "HisData.h"

@implementation SearchHis

@dynamic id;
@dynamic word_id;
@dynamic hisData;
@dynamic date;

+ (SearchHis*)insertSearchHis:(Word*)word user:(User*)user inManagedObjectContext:(NSManagedObjectContext*)context
{
    SearchHis* searchHis = nil;
    
    // Create
    searchHis = [NSEntityDescription insertNewObjectForEntityForName:@"SearchHis" inManagedObjectContext:context];
    searchHis.date = [NSDate date];
    
    // Configure wordRecord
    searchHis.word_id = word.id;
    searchHis.hisData = user.hisdata;
    
    // Configure user
    [user.hisdata.searchHis addObject:searchHis];
    
    //
    return searchHis;
}

@end
