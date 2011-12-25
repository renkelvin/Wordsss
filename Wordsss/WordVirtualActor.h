//
//  WordVirtualActor.h
//  Wordsss
//
//  Created by Ren Chuan on 12/26/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Word.h"

@interface WordVirtualActor : NSObject {
    //
    Word* _word;
}

@property (nonatomic, retain) Word* word;

@end
