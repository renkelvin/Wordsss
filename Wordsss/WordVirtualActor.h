//
//  WordVirtualActor.h
//  Wordsss
//
//  Created by Ren Chuan on 12/26/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Word.h"
#import "Word_Dict.h"
#import "Word_Relation.h"

@interface WordVirtualActor : NSObject {
    //
    Word* _word;
    
    //
    NSArray* _adcDictWordArray;
    NSArray* _mwcDictWordArray;
    NSArray* _sentenceArray;
    NSArray* _wordDerivativeArray;
    NSArray* _wordSynonymArray;
    NSArray* _wordAntonymArray;
    NSArray* _wordAssociationArray;
    NSArray* _wordRootaffixArray;
    NSArray* _wordSenseArray;
}

@property (nonatomic, retain) Word* word;

+ (WordVirtualActor*)wordVirtualActor:(Word*)word;

- (WordVirtualActor*)init:(Word*)word;

- (void)prepare;

- (NSArray*)getAhdDictWord;
- (NSArray*)getMwcDictWord;
- (NSArray*)getSentence;
- (NSArray*)getWordDerivative;
- (NSArray*)getWordSynonym;
- (NSArray*)getWordAntonym;
- (NSArray*)getWordAssociation;
- (NSArray*)getWordRootaffix;
- (NSArray*)getWordSense;

@end
