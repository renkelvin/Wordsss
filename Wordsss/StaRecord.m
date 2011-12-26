//
//  StaRecord.m
//  Wordsss
//
//  Created by Ren Chuan on 12/25/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "StaRecord.h"
#import "HisData.h"


@implementation StaRecord

@dynamic date;
@dynamic day;
@dynamic dlc;
@dynamic count0;
@dynamic count1;
@dynamic count2;
@dynamic count9;
@dynamic count6;
@dynamic count8;
@dynamic count3;
@dynamic count5;
@dynamic countm;
@dynamic count4;
@dynamic count7;
@dynamic count10;
@dynamic hisData;

+ (StaRecord*)insertStaRecord:(User*)user inManagedObjectContext:(NSManagedObjectContext*)context
{
    StaRecord* staRecord = nil;
    
    // Create
    staRecord = [NSEntityDescription insertNewObjectForEntityForName:@"StaRecord" inManagedObjectContext:context];
    
    // Configure staRecord
    staRecord.day = [user.status.day copy];
    staRecord.date = [user.status.date copy];
    staRecord.dlc = [user.status.dlc copy];
    
    staRecord.count0 = [user.status.count0 copy];
    staRecord.count1 = [user.status.count1 copy];
    staRecord.count2 = [user.status.count2 copy];
    staRecord.count3 = [user.status.count3 copy];
    staRecord.count4 = [user.status.count4 copy];
    staRecord.count5 = [user.status.count5 copy];
    staRecord.count6 = [user.status.count6 copy];
    staRecord.count7 = [user.status.count7 copy];
    staRecord.count8 = [user.status.count8 copy];
    staRecord.count9 = [user.status.count9 copy];
    staRecord.count10 = [user.status.count10 copy];
    staRecord.countm = [user.status.countm copy];
    
    staRecord.hisData = user.hisdata;
    
    // Configure user
    [user.hisdata.staRecord addObject:staRecord];
    
    //
    return staRecord;
}

- (float)getCount
{
    float count = 0;
    
    count = 
    [self.count1 floatValue]*0.0 + 
    [self.count2 floatValue]*0.1 + 
    [self.count3 floatValue]*0.2 +
    [self.count4 floatValue]*0.3 + 
    [self.count5 floatValue]*0.4 + 
    [self.count6 floatValue]*0.5 + 
    [self.count7 floatValue]*0.6 +
    [self.count8 floatValue]*0.7 + 
    [self.count9 floatValue]*0.8 + 
    [self.count10 floatValue]*0.9 + 
    [self.countm floatValue]*1.0;
    
    return count;
}

@end
