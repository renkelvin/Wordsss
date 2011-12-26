//
//  Frequency.h
//  Wordsss
//
//  Created by Ren Chuan on 12/26/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word;

@interface Frequency : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * freq;
@property (nonatomic, retain) NSNumber * ra;
@property (nonatomic, retain) NSNumber * disp;
@property (nonatomic, retain) Word *word;

@end
