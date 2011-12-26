//
//  Word_Dict.m
//  Wordsss
//
//  Created by Ren Chuan on 12/26/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Word_Dict.h"
#import "McecDictWord.h"
#import "MwcDictWord.h"
#import "Word.h"


@implementation Word_Dict

@dynamic id;
@dynamic mcecDictWord;
@dynamic mwcDictWord;
@dynamic word;
@dynamic ahdDictWord;

+ (Word_Dict *)entityWithId:(NSNumber *)entityId inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"Word_Dict" inManagedObjectContext:context]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"id == %@", entityId]];
    
    Word_Dict *result = [[context executeFetchRequest:request error:NULL] lastObject];
    
    // [request release];
    
    return result;
}

@end
