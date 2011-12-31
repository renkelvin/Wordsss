//
//  Sense.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Sense.h"
#import "Sense.h"
#import "Word_Sense.h"


@implementation Sense

@dynamic id;
@dynamic meaning_cn;
@dynamic meaning_en;
@dynamic parent;
@dynamic son;
@dynamic word_sense;

+ (Sense *)senseWithId:(NSNumber *)senseId inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"Sense" inManagedObjectContext:context]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"id == %@", senseId]];
    
    Sense *result = [[context executeFetchRequest:request error:NULL] lastObject];
    
    // [request release];
    
    return result;
}

- (NSString*)getTrack
{
    NSString* string = [NSString string];
    
    if (self.parent) {
        string = [NSString stringWithFormat:@"%@%@/", [self.parent getTrack], self.meaning_cn];
    }

    return string;
}

@end
