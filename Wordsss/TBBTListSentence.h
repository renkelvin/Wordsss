//
//  TBBTListSentence.h
//  Wordsss
//
//  Created by Kelvin Ren on 7/11/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TBBTListWord;

@interface TBBTListSentence : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * sentence;
@property (nonatomic, retain) NSNumber * beginTime;
@property (nonatomic, retain) NSNumber * endTime;
@property (nonatomic, retain) NSNumber * season;
@property (nonatomic, retain) NSNumber * episode;
@property (nonatomic, retain) NSMutableSet *tbbtListWord;
@end

@interface TBBTListSentence (CoreDataGeneratedAccessors)

- (void)addTbbtListWordObject:(TBBTListWord *)value;
- (void)removeTbbtListWordObject:(TBBTListWord *)value;
- (void)addTbbtListWord:(NSSet *)values;
- (void)removeTbbtListWord:(NSSet *)values;

@end
