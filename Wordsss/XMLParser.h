//
//  XMLParser.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/6/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSXMLParser.h>

#import "WordsssDBDataManager.h"
#import "Word.h"

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    NSXMLParser* _parser;
    
    WordsssDBDataManager* _dbm;
}

+ (XMLParser*)xmlParser;

- (void)go;

@end

#pragma mark -
#pragma mark IterStatEnums

enum IterStat_M { MNONE, MMYSQLDUMP };
enum IterStat_D { DNONE, DDATABASE };
enum IterStat_T { TNONE,    TTABLESTRUCTURE, 
                            TTABLEDATA, TTABLEDATA_WORD};
enum IterStat_R { RNONE, RROW };
enum IterStat_F { FNONE, FFIELD };
