//
//  TBBTListWord.h
//  Wordsss
//
//  Created by Kelvin Ren on 7/11/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word_List;

@interface TBBTListWord : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSMutableSet *tbbtListSentence;
@property (nonatomic, retain) Word_List *word_list;
@end

@interface TBBTListWord (CoreDataGeneratedAccessors)

- (void)addTbbtListSentenceObject:(NSManagedObject *)value;
- (void)removeTbbtListSentenceObject:(NSManagedObject *)value;
- (void)addTbbtListSentence:(NSSet *)values;
- (void)removeTbbtListSentence:(NSSet *)values;

@end
