//
//  PureWord.h
//  Wordsss
//
//  Created by Ren Chuan on 3/3/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word;

@interface PureWord : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Word *word;

@end
