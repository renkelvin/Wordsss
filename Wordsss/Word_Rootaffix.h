//
//  Word_Rootaffix.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Rootaffix, Word;

@interface Word_Rootaffix : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) Word *word;
@property (nonatomic, retain) Rootaffix *rootaffix;

@end
