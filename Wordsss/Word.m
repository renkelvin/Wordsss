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
@dynamic pureWord;

static int freqArray[11] = {
    61854,      // 0  - 1     - Zero
    126,        // 1  - 800   - Basic
    70,         // 2  - 1500  - Middle
    34,         // 3  - 3000  - High
    23,         // 4  - 4000  - CET4
    14,         // 5  - 6000  - CET6
    9,          // 6  - 8000  - IELTS
    8,          // 7  - 9000  - TOEFL
    7,          // 8  - 10000 - SAT
    5,          // 9  - 12448 - GRE
    1           // 10 - 42814 - HolyShit
};

+ (Word *)wordWithId:(NSNumber *)wordId inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"Word" inManagedObjectContext:context]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"id == %@", wordId]];
    
    Word *result = [[context executeFetchRequest:request error:NULL] lastObject];
    
    return result;
}

+ (Word *)wordWithName:(NSString *)wordName inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:[NSEntityDescription entityForName:@"Word" inManagedObjectContext:context]];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name == %@", wordName]];
    
    Word *result = [[context executeFetchRequest:request error:NULL] lastObject];
        
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
        string = [string stringByAppendingFormat:@"%@；", [ahdDictWord getMeaningCN]];
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
        NSString* string = [NSString stringWithFormat:@""];
        [label setText:string];
    }
}

- (void)configLabel:(WordCellLabel*)labelT label:(WordCellLabel*)labelM
{
    //
    [labelT setText:[NSString stringWithFormat:@"%@", [self getShortTypeString]]];
    
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
        NSString* string = [NSString stringWithFormat:@""];
        [labelM setText:string];
    }
}

- (NSString*)getWordLevel
{
    //
    if ([self.field.holyshit boolValue]) {
        return @"超神";
    }
    else if ([self.field.gre boolValue]) {
        return @"GRE";
    }
    else if ([self.field.sat boolValue]) {
        return @"SAT";
    }
    else if ([self.field.tofel boolValue]) {
        return @"TOEFL";
    }
    else if ([self.field.ielts boolValue]) {
        return @"IELTS";
    }
    else if ([self.field.cet6 boolValue]) {
        return @"CET6";
    }
    else if ([self.field.cet4 boolValue]) {
        return @"CET4";
    }
    else if ([self.field.high boolValue]) {
        return @"HIGH";
    }
    else if ([self.field.middle boolValue]) {
        return @"MIDDLE";
    }
    else if ([self.field.basic boolValue]) {
        return @"BASIC";
    }
    else {
        return @"ZERO";
    }
    
    //
    int fre = [self.frequency.freq intValue];
    
    if (fre >= freqArray[0]) {
        return @"ZERO";
    }
    else if (fre >= freqArray[1]) {
        return @"基础";
    }
    else if (fre >= freqArray[2]) {
        return @"初中";
    }
    else if (fre >= freqArray[3]) {
        return @"高中";
    }
    else if (fre >= freqArray[4]) {
        return @"CET4";
    }
    else if (fre >= freqArray[5]) {
        return @"CET6";
    }
    else if (fre >= freqArray[6]) {
        return @"IELTS";
    }
    else if (fre >= freqArray[7]) {
        return @"TOEFL";
    }
    else if (fre >= freqArray[8]) {
        return @"SAT";
    }
    else if (fre >= freqArray[9]) {
        return @"GRE";
    }
    else {
        return @"超神";
    }
}

- (NSString*)getShortTypeString
{
    AhdDictWord* word = [self.word_dict.ahdDictWord anyObject];
    
    return [word getShortTypeString];
}

- (NSString*)getFullTypeString
{
    AhdDictWord* word = [self.word_dict.ahdDictWord anyObject];
    
    return [word getFullTypeString];
}

@end
