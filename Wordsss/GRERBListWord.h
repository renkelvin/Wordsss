//
//  GRERBListWord.h
//  Wordsss
//
//  Created by Ren Chuan on 2/25/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word_List;

@interface GRERBListWord : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * meaning_cn;
@property (nonatomic, retain) NSString * meaning_en;
@property (nonatomic, retain) Word_List *word_list;
@property (nonatomic, retain) NSMutableSet *grerbListMem;
@end

@interface GRERBListWord (CoreDataGeneratedAccessors)

- (void)addGrerbListMemObject:(NSManagedObject *)value;
- (void)removeGrerbListMemObject:(NSManagedObject *)value;
- (void)addGrerbListMem:(NSSet *)values;
- (void)removeGrerbListMem:(NSSet *)values;

@end
