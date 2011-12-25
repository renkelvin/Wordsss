//
//  Status.m
//  Wordsss
//
//  Created by Ren Chuan on 12/25/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Status.h"
#import "User.h"


@implementation Status

@dynamic date;
@dynamic day;
@dynamic dlc;
@dynamic level;
@dynamic count0;
@dynamic count1;
@dynamic count2;
@dynamic count7;
@dynamic count5;
@dynamic count4;
@dynamic count10;
@dynamic count3;
@dynamic count6;
@dynamic count9;
@dynamic count8;
@dynamic countm;
@dynamic user;

+ (Status*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    Status* entity = nil;
    
    entity = [NSEntityDescription insertNewObjectForEntityForName:@"Status" inManagedObjectContext:context];
    
    return entity;
}

- (void)updateCount:(int)level from:(int)fromLevel;
{
    //
    switch (fromLevel) {
        case 0:
            self.count0 = [NSNumber numberWithInt:([self.count0 intValue]-1)];
            break;
        case 1:
            self.count1 = [NSNumber numberWithInt:([self.count1 intValue]-1)];
            break;
        case 2:
            self.count2 = [NSNumber numberWithInt:([self.count2 intValue]-1)];
            break;
        case 3:
            self.count3 = [NSNumber numberWithInt:([self.count3 intValue]-1)];
            break;
        case 4:
            self.count4 = [NSNumber numberWithInt:([self.count4 intValue]-1)];
            break;
        case 5:
            self.count5 = [NSNumber numberWithInt:([self.count5 intValue]-1)];
            break;
        case 6:
            self.count6 = [NSNumber numberWithInt:([self.count6 intValue]-1)];
            break;
        case 7:
            self.count7 = [NSNumber numberWithInt:([self.count7 intValue]-1)];
            break;
        case 8:
            self.count8 = [NSNumber numberWithInt:([self.count8 intValue]-1)];
            break;
        case 9:
            self.count9 = [NSNumber numberWithInt:([self.count9 intValue]-1)];
            break;
        case 10:
            self.count10 = [NSNumber numberWithInt:([self.count10 intValue]-1)];
            break;
        case -1:
            self.countm = [NSNumber numberWithInt:([self.countm intValue]-1)];
            break;
        default:
            break;
    }
    
    //
    switch (level) {
        case 0:
            self.count0 = [NSNumber numberWithInt:([self.count0 intValue]+1)];
            break;
        case 1:
            self.count1 = [NSNumber numberWithInt:([self.count1 intValue]+1)];
            break;
        case 2:
            self.count2 = [NSNumber numberWithInt:([self.count2 intValue]+1)];
            break;
        case 3:
            self.count3 = [NSNumber numberWithInt:([self.count3 intValue]+1)];
            break;
        case 4:
            self.count4 = [NSNumber numberWithInt:([self.count4 intValue]+1)];
            break;
        case 5:
            self.count5 = [NSNumber numberWithInt:([self.count5 intValue]+1)];
            break;
        case 6:
            self.count6 = [NSNumber numberWithInt:([self.count6 intValue]+1)];
            break;
        case 7:
            self.count7 = [NSNumber numberWithInt:([self.count7 intValue]+1)];
            break;
        case 8:
            self.count8 = [NSNumber numberWithInt:([self.count8 intValue]+1)];
            break;
        case 9:
            self.count9 = [NSNumber numberWithInt:([self.count9 intValue]+1)];
            break;
        case 10:
            self.count10 = [NSNumber numberWithInt:([self.count10 intValue]+1)];
            break;
        case -1:
            self.countm = [NSNumber numberWithInt:([self.countm intValue]+1)];
            break;
        default:
            break;
    }
    
    NSLog(@"%d - %d - %d", [self.count0 intValue], [self.count1 intValue], [self.count2 intValue]);
}

@end
