//
//  Word_Relation.h
//  Wordsss
//
//  Created by Ren Chuan on 12/31/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word;

@interface Word_Relation : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSMutableSet *antonym;
@property (nonatomic, retain) NSMutableSet *derivative;
@property (nonatomic, retain) NSMutableSet *synonym;
@property (nonatomic, retain) Word *word;
@property (nonatomic, retain) NSMutableSet *conversion;
@property (nonatomic, retain) Word *convOrig;
@property (nonatomic, retain) Word *deriOrig;
@end

@interface Word_Relation (CoreDataGeneratedAccessors)

- (void)addAntonymObject:(Word *)value;
- (void)removeAntonymObject:(Word *)value;
- (void)addAntonym:(NSSet *)values;
- (void)removeAntonym:(NSSet *)values;

- (void)addDerivativeObject:(Word *)value;
- (void)removeDerivativeObject:(Word *)value;
- (void)addDerivative:(NSSet *)values;
- (void)removeDerivative:(NSSet *)values;

- (void)addSynonymObject:(Word *)value;
- (void)removeSynonymObject:(Word *)value;
- (void)addSynonym:(NSSet *)values;
- (void)removeSynonym:(NSSet *)values;

- (void)addConversionObject:(Word *)value;
- (void)removeConversionObject:(Word *)value;
- (void)addConversion:(NSSet *)values;
- (void)removeConversion:(NSSet *)values;

@end
