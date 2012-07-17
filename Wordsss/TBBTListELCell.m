//
//  TBBTListELCell.m
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "TBBTListELCell.h"

static char* episodeArrayS1[18] = {
    "",
    "Pilot",
    "The Big Bran Hypothesis",
    "The Fuzzy Boots Corollary",
    "The Luminous Fish Effect",
    "The Hamburger Postulate",
    "The Middle Earth Paradigm",
    "The Dumpling Paradox",
    "The Grasshopper Experiment",
    "The Cooper-Hofstadter Polarization",
    "The Loobenfeld Decay",
    "The Pancake Batter Anomaly",
    "The Jerusalem Duality",
    "The Bat Jar Conjecture",
    "The Nerdvana Annihilation",
    "The Pork Chop Indeterminacy",
    "The Peanut Reaction",
    "The Tangerine Factor"
};

static char* episodeArrayS2[24] = {
    "",
    "The Bad Fish Paradigm",
    "The Codpiece Topology",
    "The Barbarian Sublimation",
    "The Griffin Equivalency",
    "The Euclid Alternative",
    "The Cooper-Nowitzki Theorem",
    "The Panty Piñata Polarization",
    "The Lizard-Spock Expansion",
    "The White Asparagus Triangulation",
    "The Vartabedian Conundrum",
    "The Bath Item Gift Hypothesis",
    "The Killer Robot Instability",
    "The Friendship Algorithm",
    "The Financial Permeability",
    "The Maternal Capacitance",
    "The Cushion Saturation",
    "The Terminator Decoupling",
    "The Work Song Nanocluster",
    "The Dead Hooker Juxtaposition",
    "The Hofstadter Isotope",
    "The Vegas Renormalization",
    "The Classified Materials Turbulence",
    "The Monopolar Expedition"
};

static char* episodeArrayS3[24] = {
    "",
    "The Electric Can Opener Fluctuation",
    "The Jiminy Conjecture",
    "The Gothowitz Deviation",
    "The Pirate Solution",
    "The Creepy Candy Coating Corollary",
    "The Cornhusker Vortex",
	"The Guitarist Amplification",
    "The Adhesive Duck Deficiency",
    "The Vengeance Formulation",
    "The Gorilla Experiment",
    "The Maternal Congruence",
    "The Psychic Vortex",
    "The Bozeman Reaction",
    "The Einstein Approximation",
    "The Large Hadron Collision",
    "The Excelsior Acquisition",
    "The Precious Fragmentation",
    "The Pants Alternative",
    "The Wheaton Recurrence",
    "The Spaghetti Catalyst",
    "The Plimpton Stimulation",
    "The Staircase Implementation",
    "The Lunar Excitation"
};

static char* episodeArrayS4[25] = {
    "",
    "The Robotic Manipulation",
    "The Cruciferous Vegetable Amplification",
    "The Zazzy Substitution",
    "The Hot Troll Deviation",
    "The Desperation Emanation",
    "The Irish Pub Formulation",
    "The Apology Insufficiency",
    "The 21-Second Excitation",
    "The Boyfriend Complexity",
    "The Alien Parasite Hypothesis",
    "The Justice League Recombination",
    "The Bus Pants Utilization",
    "The Love Car Displacement",
    "The Thespian Catalyst",
    "The Benefactor Factor",
    "The Cohabitation Formulation",
    "The Toast Derivation",
    "The Prestidigitation Approximation",
    "The Zarnecki Incursion",
    "The Herb Garden Germination",
    "The Agreement Dissection",
    "The Wildebeest Implementation",
    "The Engagement Reaction",
    "The Roommate Transmogrification"
};

static char* episodeArrayS5[25] = {
    "",
    "The Skank Reflex Analysis",
    "The Infestation Hypothesis",
    "The Pulled Groin Extrapolation",
    "The Wiggly Finger Catalyst",
    "The Russian Rocket Reaction",
    "The Rhinitis Revelation",
    "The Good Guy Fluctuation",
    "The Isolation Permutation",
    "The Ornithophobia Diffusion",
    "The Flaming Spittoon Acquisition",
    "The Speckerman Recurrence",
    "The Shiny Trinket Maneuver",
    "The Recombination Hypothesis",
    "The Beta Test Initiation",
    "The Friendship Contraction",
    "The Vacation Solution",
    "The Rothman Disintegration",
    "The Werewolf Transformation",
	"The Weekend Vortex",
    "The Transporter Malfunction",
    "The Hawking Excitation",
    "The Stag Convergence",
    "The Launch Acceleration",
    "The Countdown Reflection"
};

@implementation TBBTListELCell

@synthesize seasonNum, episodeNum;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark -

- (void)configCell
{
    [self.nameLabel setText:[NSString stringWithFormat:@"Episode %d", [self.episodeNum intValue]]];
    
    NSString* name = nil;
    switch ([seasonNum intValue]) {
        case 1:
            name = [NSString stringWithFormat:@"%s", episodeArrayS1[[episodeNum intValue]]];
            break;
        case 2:
            name = [NSString stringWithFormat:@"%s", episodeArrayS2[[episodeNum intValue]]];
            break;
        case 3:
            name = [NSString stringWithFormat:@"%s", episodeArrayS3[[episodeNum intValue]]];
            break;
        case 4:
            name = [NSString stringWithFormat:@"%s", episodeArrayS4[[episodeNum intValue]]];
            break;
        case 5:
            name = [NSString stringWithFormat:@"%s", episodeArrayS5[[episodeNum intValue]]];
            break;
        default:
            break;
    }
    [self.meaningLabel setText:name];
}

@end
