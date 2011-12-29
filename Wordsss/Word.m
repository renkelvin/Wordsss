//
//  Word.m
//  Wordsss
//
//  Created by Ren Chuan on 12/28/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Word.h"
#import "Frequency.h"
#import "Word_Association.h"
#import "Word_Convertion.h"
#import "Word_Dict.h"
#import "Word_List.h"
#import "Word_Relation.h"
#import "Word_Rootaffix.h"
#import "Word_Sense.h"


@implementation Word

@dynamic id;
@dynamic name;
@dynamic frequency;
@dynamic word_association;
@dynamic word_convertion;
@dynamic word_dict;
@dynamic word_list;
@dynamic word_relation;
@dynamic word_rootaffix;
@dynamic word_sense;

+ (Word *)wordWithId:(NSNumber *)wordId inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"Word" inManagedObjectContext:context]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"id == %@", wordId]];
    
    Word *result = [[context executeFetchRequest:request error:NULL] lastObject];
    
    // [request release];
    
    return result;
}

- (NSString*)getBriefMeaning
{
    NSString* string = [NSString stringWithFormat:@""];
    
    for (AhdDictWord* ahdDictWord in self.word_dict.ahdDictWord) {
        string = [string stringByAppendingFormat:@"%@\n", [ahdDictWord getBriefMeaning]];
    }
    
    return string;
}

- (void)configLabel:(WordCellBrief*)label
{
    [label setText:[self getBriefMeaning]];
}

@end
