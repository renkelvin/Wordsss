//
//  Word_Sense.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Word_Sense.h"
#import "Sense.h"
#import "Word.h"


@implementation Word_Sense

@dynamic id;
@dynamic meaning_cn;
@dynamic type;
@dynamic word;
@dynamic sense;

+ (Word_Sense *)entityWithId:(NSNumber *)entityId inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"Word_Sense" inManagedObjectContext:context]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"id == %@", entityId]];
    
    Word_Sense *result = [[context executeFetchRequest:request error:NULL] lastObject];
    
    // [request release];
    
    return result;
}

@end
