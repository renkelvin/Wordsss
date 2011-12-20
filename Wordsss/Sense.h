//
//  Sense.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sense, Word_Sense;

@interface Sense : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * meaning_cn;
@property (nonatomic, retain) NSString * meaning_en;
@property (nonatomic, retain) Sense *parent;
@property (nonatomic, retain) NSSet *son;
@property (nonatomic, retain) NSSet *word_sense;
@end

@interface Sense (CoreDataGeneratedAccessors)

- (void)addSonObject:(Sense *)value;
- (void)removeSonObject:(Sense *)value;
- (void)addSon:(NSSet *)values;
- (void)removeSon:(NSSet *)values;

- (void)addWord_senseObject:(Word_Sense *)value;
- (void)removeWord_senseObject:(Word_Sense *)value;
- (void)addWord_sense:(NSSet *)values;
- (void)removeWord_sense:(NSSet *)values;

@end
