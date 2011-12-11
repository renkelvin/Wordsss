//
//  Sense.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sense, Word;

@interface Sense : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * meaning_cn;
@property (nonatomic, retain) NSString * meaning_en;
@property (nonatomic, retain) NSSet *word;
@property (nonatomic, retain) Sense *parent;
@property (nonatomic, retain) NSSet *son;
@end

@interface Sense (CoreDataGeneratedAccessors)

- (void)addWordObject:(Word *)value;
- (void)removeWordObject:(Word *)value;
- (void)addWord:(NSSet *)values;
- (void)removeWord:(NSSet *)values;

- (void)addSonObject:(Sense *)value;
- (void)removeSonObject:(Sense *)value;
- (void)addSon:(NSSet *)values;
- (void)removeSon:(NSSet *)values;

@end
