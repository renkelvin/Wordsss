//
//  WordVirtualActor.m
//  Wordsss
//
//  Created by Ren Chuan on 12/26/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "WordVirtualActor.h"

@implementation WordVirtualActor

@synthesize word = _word, wordRecord = _wordRecord;

+ (WordVirtualActor*)wordVirtualActor:(Word*)word
{
    WordVirtualActor* wordVirtualActor = [[WordVirtualActor alloc] init:word];
    
    [wordVirtualActor prepare];
    
    return wordVirtualActor;
}

- (WordVirtualActor*)init:(Word*)word;
{
    self.word = word;
    
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    self.wordRecord = [uva getWordRecord:word];
    
    return self;
}

#pragma mark - Instance method

//
- (NSArray*)getAhdDictWord
{
    if (!_adcDictWordArray) {
        _adcDictWordArray = [_word.word_dict.ahdDictWord allObjects];
    }
    
    return _adcDictWordArray;
}

//
- (NSArray*)getMwcDictWord
{
    if (!_mwcDictWordArray) {
        _mwcDictWordArray = [_word.word_dict.mwcDictWord allObjects];
    }
    
    return _mwcDictWordArray;
}

//
- (NSArray*)getSentence
{
    if (!_sentenceArray) {
        NSArray* array = [NSArray array];
        
        for (AhdDictWord* ahdDictWord in _word.word_dict.ahdDictWord) {
            array = [array arrayByAddingObjectsFromArray:[ahdDictWord getSentence]];
        }
        
        _sentenceArray = array;
    }
    
    return _sentenceArray;
}

//
- (NSArray*)getConversion
{
    if (!_conversionArray) {
        _conversionArray = [_word.word_relation.conversion allObjects];
    }
    
    return _conversionArray;
}

//
- (NSArray*)getDerivative
{
    if (!_derivativeArray) {
        _derivativeArray = [_word.word_relation.derivative allObjects];
    }
    
    return _derivativeArray;
}

//
- (NSArray*)getSynonym
{
    if (!_synonymArray) {
        _synonymArray = [_word.word_relation.synonym allObjects];
    }
    
    return _synonymArray;
}

//
- (NSArray*)getAntonym
{
    if (!_antonymArray) {
        _antonymArray = [_word.word_relation.antonym allObjects];
    }
    
    return _antonymArray;
}

//
- (NSArray*)getWordAssociation
{
    if (!_wordAssociationArray) {
        _wordAssociationArray = [_word.word_association allObjects];
    }
    
    return _wordAssociationArray;
}

//
- (NSArray*)getWordRootaffix
{
    if (!_wordRootaffixArray) {
        _wordRootaffixArray = [_word.word_rootaffix allObjects];
    }
    
    return _wordRootaffixArray;
}

//
- (NSArray*)getWordSense
{
    if (!_wordSenseArray) {
        _wordSenseArray = [_word.word_sense allObjects];
    }
    
    return _wordSenseArray;
}

- (NSArray*)getWordMems
{
    if (!_wordMemsArray) {
        //
        NSMutableArray* array = [NSMutableArray array];
        
        // Association
        NSArray* aArray = [self getWordAssociation];
        if ([aArray count]) {
            [array addObject:aArray];
        }
        
        // Rootaffix
        for (Word_Rootaffix* wr in [self getWordRootaffix]) {
            NSMutableArray* rArray = [NSMutableArray array];
            
            [rArray addObject:wr.rootaffix];
            
            [rArray addObject:wr];
            
            NSMutableArray* mArray = [NSMutableArray arrayWithArray:[wr.rootaffix.word_rootaffix allObjects]];
            [mArray removeObject:wr];
            [rArray addObjectsFromArray:mArray];
            
            [array addObject:rArray];
        }
        
        // Sense
        for (Word_Sense* ws in [self getWordSense]) {
            NSMutableArray* rArray = [NSMutableArray array];
            
            [rArray addObject:ws.sense];
            
            [rArray addObject:ws];
            
            NSMutableArray* mArray = [NSMutableArray arrayWithArray:[ws.sense.word_sense allObjects]];
            [mArray removeObject:ws];
            [rArray addObjectsFromArray:mArray];
            
            [array addObject:rArray];
        }
        
        //
        _wordMemsArray = array;
    }
    
    return _wordMemsArray;
}


- (void)prepare
{
    
}

- (NSMutableArray*)getHisRecords
{
    // Get UserDataManager
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // Get StaRecords
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"HisRecord"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"word_id == %@", _word.id]];
    [request setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"day" ascending:YES]]];
    NSMutableArray* srArray = [NSMutableArray arrayWithArray:[udm.managedObjectContext executeFetchRequest:request error:nil]];
    
    _hisRecords = srArray;
    
    return srArray;
    
}

- (NSString*)getMemDiffString
{
    int lvl = [_wordRecord.level intValue];
    
    if ([_hisRecords count] > 3*lvl) {
        return @"困难";
    }
    else if ([_hisRecords count] > 2*lvl) {
        return @"一般";
    }
    else if ([_hisRecords count] > 1*lvl) {
        return @"简单";
    }
    else {
        return @"一般";
    }
}

@end
