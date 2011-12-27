//
//  Word_Convertion.h
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word;

@interface Word_Convertion : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) Word *aComparative;
@property (nonatomic, retain) Word *aSuperlative;
@property (nonatomic, retain) Word *nPlural;
@property (nonatomic, retain) Word *origin;
@property (nonatomic, retain) Word *vPastParticiple;
@property (nonatomic, retain) Word *vPastTense;
@property (nonatomic, retain) Word *vPresentParticiple;
@property (nonatomic, retain) Word *vThirdPersonSingular;
@property (nonatomic, retain) Word *word;

@end
