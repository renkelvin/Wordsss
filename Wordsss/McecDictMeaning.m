//
//  McecDictMeaning.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "McecDictMeaning.h"
#import "McecDictWord.h"


@implementation McecDictMeaning

@dynamic id;
@dynamic meaning_cn;
@dynamic type;
@dynamic mcecDictWord;

+ (McecDictMeaning *)meaningWithId:(NSNumber *)meaningId inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"McecDictMeaning" inManagedObjectContext:context]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"id == %@", meaningId]];
    
    McecDictMeaning *result = [[context executeFetchRequest:request error:NULL] lastObject];
    
    // [request release];
    
    return result;
}

@end
