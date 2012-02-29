//
//  Word.m
//  Wordsss
//
//  Created by Ren Chuan on 12/28/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Word.h"

@implementation Word

@dynamic id;
@dynamic name;
@dynamic frequency;
@dynamic word_association;
@dynamic word_dict;
@dynamic word_list;
@dynamic word_relation;
@dynamic word_rootaffix;
@dynamic word_sense;
@dynamic field;

+ (Word *)wordWithId:(NSNumber *)wordId inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"Word" inManagedObjectContext:context]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"id == %@", wordId]];
    
    Word *result = [[context executeFetchRequest:request error:NULL] lastObject];
    
    // [request release];
    
    return result;
}

- (Word*)getTargetWord
{
    // ahdDictWord Existing
    if (self.word_dict.ahdDictWord) {
        return self;
    }
    
    // convOrig word Existing
    else if (self.word_relation.convOrig) {
        return self.word_relation.convOrig;
    }
    
    // deriOrig word Existing
    else if (self.word_relation.deriOrig) {
        return self.word_relation.deriOrig;
    }
    
    //
    else {
        return self;
    }
}

- (NSString*)getBriefMeaning
{
    NSString* string = [NSString stringWithFormat:@""];
    
    for (AhdDictWord* ahdDictWord in self.word_dict.ahdDictWord) {
        string = [string stringByAppendingFormat:@"%@", [ahdDictWord getBriefMeaning]];
    }
    
    return string;
}

- (NSString*)getSummaryMeaning
{
    NSString* string = [NSString stringWithFormat:@""];
    
    for (AhdDictWord* ahdDictWord in self.word_dict.ahdDictWord) {
        string = [string stringByAppendingFormat:@"%@\n", [ahdDictWord getSummaryMeaning]];
    }
    
    return string;
}

- (NSString*)getMeaningCN
{ 
    NSString* string = [NSString stringWithFormat:@""];
    
    for (AhdDictWord* ahdDictWord in self.word_dict.ahdDictWord) {
        string = [string stringByAppendingFormat:@"%@", [ahdDictWord getMeaningCN]];
    }
    
    return string;
}

- (void)configLabel:(WordCellLabel*)label
{
    // ahdDictWord Existing
    if (self.word_dict.ahdDictWord) {
        //
        [label setText:[self getBriefMeaning]];
    }
    
    // convOrig word Existing
    else if (self.word_relation.convOrig) {
        NSString* string = [NSString stringWithFormat:@"变形自\n%@ %@", self.word_relation.convOrig.name, [self.word_relation.convOrig getSummaryMeaning]];
        [label setText:string];
    }
    
    // deriOrig word Existing
    else if (self.word_relation.deriOrig) {
        NSString* string = [NSString stringWithFormat:@"继承自\n%@ %@", self.word_relation.deriOrig.name, [self.word_relation.deriOrig getSummaryMeaning]];
        [label setText:string];
    }
    
    //
    else {
        NSString* string = [NSString stringWithFormat:@"啊！这个词怎么会出现在这里的！"];
        [label setText:string];
    }
}

- (void)configLabel:(WordCellLabel*)labelT label:(WordCellLabel*)labelM
{
    //
    [labelT setText:@"TOEFL"];
    
    // ahdDictWord Existing
    if (self.word_dict.ahdDictWord) {
        //
        [labelM setText:[self getMeaningCN]];
    }
    
    // convOrig word Existing
    else if (self.word_relation.convOrig) {
        NSString* string = [NSString stringWithFormat:@"变形自: %@ %@", self.word_relation.convOrig.name, [self.word_relation.convOrig getMeaningCN]];
        [labelM setText:string];
    }
    
    // deriOrig word Existing
    else if (self.word_relation.deriOrig) {
        NSString* string = [NSString stringWithFormat:@"继承自: %@ %@", self.word_relation.deriOrig.name, [self.word_relation.deriOrig getMeaningCN]];
        [labelM setText:string];
    }
    
    //
    else {
        NSString* string = [NSString stringWithFormat:@"啊！这个词怎么会出现在这里的！"];
        [labelM setText:string];
    }
}

@end
