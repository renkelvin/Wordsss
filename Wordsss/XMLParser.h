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
#import "Association.h"
#import "Rootaffix.h"
#import "Sense.h"
#import "Frequency.h"
#import "Word_Association.h"
#import "Word_Rootaffix.h"
#import "Word_Sense.h"
#import "Word_Dict.h"
#import "McecDictWord.h"
#import "McecDictMeaning.h"
#import "MwcDictWord.h"
#import "MwcDictMeaning.h"
#import "AhdDictWord.h"
#import "AhdDictMeaning.h"
#import "AhdDictSentence.h"
#import "Word_List.h"
#import "CSListWord.h"
#import "MAListWord.h"
#import "PHListWord.h"
#import "GRERBListWord.h"
#import "GRERBListMem.h"
#import "DotaListWord.h"
#import "List.h"

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    NSXMLParser* _parser;
    
    WordsssDBDataManager* _dbm;
    
    char _ERIndicator;
}

+ (XMLParser*)xmlParser;

- (void)go;

@end

#pragma mark -
#pragma mark IterStatEnums

enum IterStat_M { MNONE, MMYSQLDUMP };
enum IterStat_D { DNONE, DDATABASE };
enum IterStat_T { TNONE,    TTABLESTRUCTURE, 
                            TTABLEDATA,
                            TTABLEDATA_WORD, 
                            TTABLEDATA_FREQUENCY, 
                            TTABLEDATA_WORDASSOCIATION, TTABLEDATA_ASSOCIATION, 
                            TTABLEDATA_WORDROOTAFFIX, TTABLEDATA_ROOTAFFIX,  
                            TTABLEDATA_WORDSENSE, TTABLEDATA_SENSE, TTABLEDATA_SENSEFAMILY,
                            TTABLEDATA_WORDDICT,
                            TTABLEDATA_MCECDICTWORD, TTABLEDATA_MCECDICTMEANING,
                            TTABLEDATA_AHDDICTWORD, TTABLEDATA_AHDDICTMEANING, TTABLEDATA_AHDDICTSENTENCE,
                            TTABLEDATA_MWCDICTWORD, TTABLEDATA_MWCDICTMEANING,
                            TTABLEDATA_WORDLIST,
                            TTABLEDATA_DOTALISTWORD, TTABLEDATA_CSLISTWORD, TTABLEDATA_MALISTWORD, TTABLEDATA_PHLISTWORD, TTABLEDATA_GRERBLISTWORD, TTABLEDATA_GRERBLISTMEM, 
                            TTABLEDATA_LIST,
                            TTABLEDATA_CONVERSION, TTABLEDATA_DERIVATION, TTABLEDATA_SYNONYM, TTABLEDATA_ANTONYM, 
                            };
enum IterStat_R { RNONE, RROW };
enum IterStat_F { FNONE, FFIELD };
