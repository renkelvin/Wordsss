//
//  Word.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/20/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Word.h"
#import "Association.h"
#import "Rootaffix.h"
#import "Sense.h"
#import "Word_Dict.h"
#import "Word_List.h"


@implementation Word

@dynamic id;
@dynamic name;
@dynamic association;
@dynamic rootaffix;
@dynamic sense;
@dynamic word_dict;
@dynamic word_list;

+ (Word*)wordWithWordId:(NSNumber*)wordId inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"Word" inManagedObjectContext:context]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"id == %@", wordId]];
    
    Word *result = [[context executeFetchRequest:request error:NULL] lastObject];
    
    // [request release];
    
    return result;
}

@end
