//
//  XMLParser.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/6/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "XMLParser.h"

static XMLParser* sharedXMLParser;

@implementation XMLParser

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

// get xmlParser
+ (XMLParser*)xmlParser
{
    if (!sharedXMLParser) {
        sharedXMLParser = [[XMLParser alloc] init];
    }
    
    return sharedXMLParser;
}

// generate WordsssDB.sqlite
- (void)go
{
#warning TODO
}

@end
