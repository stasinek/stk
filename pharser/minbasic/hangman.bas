  100  LET W$ = '' : REM RANDOM WORD
  110  LET F$ = '' : REM LETTERS FOUND
  120  LET N = 0 : REM NUMBER OF WORDS IN LIST
  130  LET T = 0 : REM TRIES
  140  LET T$ = '' : REM LETTERS TRIED

  150  REM *** MAIN ***
  160  GOSUB &INIT
  170  GOSUB &PICK
  190  FOR T = 0 TO 8
  200    GOSUB &PRINT
  210    GOSUB &INPUT
  220    GOSUB &CHECK
  230    IF NOT POS('_', F$) EXIT
  250  NEXT
  260  LET F$ = W$
  270  GOSUB &PRINT
  280  END

  290  LABEL &INPUT
  300  PRINT '> '; : INPUT A$
  310  RETURN

  320  LABEL &CHECK
  330  LOCAL I
  340    IF LEN(A$) > 1 THEN
  350      IF A$ = W$ LET F$ = W$
  360    ELSE
  370      LET T$ = T$ + A$
  380      FOR I = 1 TO LEN(W$)
  390        IF MID$(W$, I, 1) = A$ GOSUB &FOUND WITH I, A$
  400      NEXT
  410    ENDIF
  420  RETURN

  430  LABEL &FOUND : REM I = POS, A$ = CHAR
  440  LOCAL J, G$ = ''
  450    FOR J = 1 TO LEN(F$)
  460      IF J = I THEN
  470        LET G$ = G$ + A$
  480      ELSE
  490        LET G$ = G$ + MID$(F$, J, 1)
  500      ENDIF
  510    NEXT
  520    LET F$ = G$
  530  RETURN

  540  LABEL &PRINT
  550  RESTORE &HANGMEN
  560  LOCAL I, J, A$
  570    LET I = 0
  580    WHILE I < T
  590      FOR J = 1 TO 6
  600        READ A$
  610      NEXT
  620      LET I = I + 1
  630    WEND
  640    FOR I = 1 TO 6
  650      READ A$
  660      PRINT '   '; A$;
  670      IF I = 3 THEN
  680        GOSUB &PRINT.WORD
  690      ELSE
  700        IF I = 5 THEN
  710          PRINT '      TRIED: '; T$
  720        ELSE
  730          PRINT
  740        ENDIF
  750      ENDIF
  760    NEXT
  770  RETURN

  780  LABEL &PRINT.WORD
  790  LOCAL I
  800    PRINT '     ';
  810    FOR I = 1 TO LEN(F$)
  820      PRINT ' '; MID$(F$, I, 1);
  830    NEXT
  840    PRINT
  850  RETURN

  860  LABEL &INIT
  870  RESTORE &VOCABULARY
  880  LET N = 0
  890  READ A$
  900  WHILE A$ <> ''
  910    LET N = N + 1
  920    READ A$
  930  WEND
  940  RETURN

  950  LABEL &PICK
  960  RESTORE &VOCABULARY
  970  LOCAL I, X = RND(N)
  980    FOR I = 1 TO X
  990      READ W$
 1000    NEXT
 1010    LET F$ = ''
 1020    FOR I = 1 TO LEN(W$)
 1030      LET F$ = F$ + '_'
 1040    NEXT
 1050  RETURN

 1060  REM *** HANGMAN
 1070  REM
 1080  LABEL &HANGMEN
 1090  DATA '       '
 1100  DATA '       '
 1110  DATA '       '
 1120  DATA '       '
 1130  DATA '       '
 1140  DATA '       '
 1150  DATA '       '
 1160  DATA '|      '
 1170  DATA '|      '
 1180  DATA '|      '
 1190  DATA '|      '
 1200  DATA '|      '
 1210  DATA '______ '
 1220  DATA '|      '
 1230  DATA '|      '
 1240  DATA '|      '
 1250  DATA '|      '
 1260  DATA '|      '
 1270  DATA '______ '
 1280  DATA '|    | '
 1290  DATA '|      '
 1300  DATA '|      '
 1310  DATA '|      '
 1320  DATA '|      '
 1330  DATA '______ '
 1340  DATA '|    | '
 1350  DATA '|    O '
 1360  DATA '|      '
 1370  DATA '|      '
 1380  DATA '|      '
 1390  DATA '______ '
 1400  DATA '|    | '
 1410  DATA '|    O '
 1420  DATA '|    | '
 1430  DATA '|      '
 1440  DATA '|      '
 1450  DATA '______ '
 1460  DATA '|    | '
 1470  DATA '|    O '
 1480  DATA '|    | '
 1490  DATA '|   /  '
 1500  DATA '|      '
 1510  DATA '______ '
 1520  DATA '|    | '
 1530  DATA '|    O '
 1540  DATA '|    | '
 1550  DATA '|   / \'
 1560  DATA '|      '
 1570  DATA '______ '
 1580  DATA '|    | '
 1590  DATA '|   _O '
 1600  DATA '|    | '
 1610  DATA '|   / \'
 1620  DATA '|      '
 1630  DATA '______ '
 1640  DATA '|    | '
 1650  DATA '|   _O_'
 1660  DATA '|    | '
 1670  DATA '|   / \'
 1680  DATA '|      '

 1690  REM *** WORD LIST
 1700  REM *** BORROWED FROM: HTTP://DELPHIFORFUN.ORG/PROGRAMS/HANGMAN2.HTM
 1710  REM *** THANKS, GARY!
 1720  REM
 1730  LABEL &VOCABULARY
 1740  DATA 'ABBREVIATE', 'ABBREVIATION', 'ABDOMEN', 'ABLE', 'ABOARD'
 1750  DATA 'ABROAD', 'ABSENT', 'ABSOLUTE', 'ABUSE', 'ACADEMIC'
 1760  DATA 'ACADEMY', 'ACCELERATE', 'ACCENT', 'ACCEPT', 'ACCIDENT'
 1770  DATA 'ACCOMPANY', 'ACCORDION', 'ACCOUNT', 'ACCURATE', 'ACCUSE'
 1780  DATA 'ACHIEVE', 'ACID', 'ACORN', 'ACRE', 'ACROBAT', 'ACROBATIC'
 1790  DATA 'ACT', 'ACTOR', 'ACTRESS', 'ACTUAL', 'ADDICT', 'ADDITION'
 1800  DATA 'ADDRESS', 'ADMIRABLE', 'ADMIRAL', 'ADMIRE', 'ADMISSION'
 1810  DATA 'ADMIT', 'ADOPT', 'ADORABLE', 'ADVANCE', 'ADVENTURE'
 1820  DATA 'AFRAID', 'AFTER', 'AFTERNOON', 'AFTERWARD', 'AGAIN'
 1830  DATA 'AGAINST', 'AGE', 'AGENT', 'AGREE', 'AGREEABLE', 'AGREED'
 1840  DATA 'AGRICULTURE', 'AHEAD', 'AIRCRAFT', 'AIRLINE', 'AIRMAIL'
 1850  DATA 'AIRPLANE', 'AIRPORT', 'ALGEBRA', 'ALGORITHM', 'ALL'
 1860  DATA 'ALLEY', 'ALLIGATOR', 'ALLOW', 'ALLOWANCE', 'ALMOND'
 1870  DATA 'ALMOST', 'ALONE', 'ALONG', 'ALPHABET', 'ALREADY'
 1880  DATA 'ALTHOUGH', 'ALWAYS', 'AMONG', 'AMOUNT', 'AND', 'ANGEL'
 1890  DATA 'ANGLE', 'ANGRY', 'ANKLE', 'ANNOY', 'ANOTHER', 'ANSWER'
 1900  DATA 'ANT', 'ANTEATER', 'ANTENNA', 'ANTLER', 'ANY', 'ANYBODY'
 1910  DATA 'ANYHOW', 'ANYMORE', 'ANYONE', 'ANYWAY', 'ANYWHERE'
 1920  DATA 'APOLOGIZE', 'APOLOGY', 'APPEAR', 'APPLE', 'APPRECIATE'
 1930  DATA 'ARE', 'AREA', 'ARGUMENT', 'AROUND', 'ARRANGEMENT'
 1940  DATA 'ARRIVE', 'ART', 'ARTIST', 'ASHAMED', 'ASK', 'ASLEEP'
 1950  DATA 'ASYLUM', 'ATE', 'ATTACK', 'ATTENTION', 'ATTRIBUTE', 'AUNT'
 1960  DATA 'AUTOMOBILE', 'AVOID', 'AWAIT', 'AWAKE', 'AWAY', 'AWE'
 1970  DATA 'AWFUL', 'BABY', 'BACK', 'BAD', 'BADMINTON', 'BAGGAGE'
 1980  DATA 'BANANA', 'BANK', 'BARGAIN', 'BARREL', 'BASE', 'BASEBALL'
 1990  DATA 'BAT', 'BATH', 'BATHROOM', 'BATTER', 'BAZOOKA', 'BEAR'
 2000  DATA 'BEAT', 'BEAUTIFUL', 'BECAUSE', 'BECOME', 'BED', 'BEDTIME'
 2010  DATA 'BEE', 'BEEN', 'BEER', 'BEFORE', 'BEG', 'BEGIN', 'BEHIND'
 2020  DATA 'BEING', 'BELIEVE', 'BELL', 'BELONG', 'BESIDE', 'BEST'
 2030  DATA 'BET', 'BETTER', 'BETWEEN', 'BIG', 'BINOCULAR'
 2040  DATA 'BINOCULARS', 'BIRTHDAY', 'BIT', 'BITTER', 'BLACK', 'BLAME'
 2050  DATA 'BLIZZARD', 'BLOOM', 'BLOOMERS', 'BLOSSOM', 'BLOUSE'
 2060  DATA 'BLOW', 'BOAT', 'BODY', 'BOIL', 'BOND', 'BONE', 'BOOK'
 2070  DATA 'BORE', 'BORN', 'BORROW', 'BOSS', 'BOSSY', 'BOTH', 'BOTHER'
 2080  DATA 'BOUGHT', 'BOUNCE', 'BOY', 'BRACELET', 'BRANCH', 'BRAZEN'
 2090  DATA 'BREAD', 'BREAK', 'BREAKFAST', 'BREAST', 'BREATH'
 2100  DATA 'BREATHE', 'BREED', 'BRIDE', 'BRIGHT', 'BRING', 'BROKE'
 2110  DATA 'BROUGHT', 'BROWN', 'BUCKLE', 'BUFFALO', 'BUILD'
 2120  DATA 'BUILDING', 'BULL', 'BULLDOZER', 'BUNCH', 'BURP', 'BURY'
 2130  DATA 'BUS', 'BUSINESS', 'BUSY', 'BUT', 'BUTLER', 'BUTTER', 'BUY'
 2140  DATA 'CABBAGE', 'CABINET', 'CABLE', 'CAKE', 'CALL', 'CAME'
 2150  DATA 'CAN', 'CANDY', 'CANNOT', 'CAR', 'CARE', 'CAREER'
 2160  DATA 'CAREFULLY', 'CARROT', 'CART', 'CASE', 'CASH', 'CASUAL'
 2170  DATA 'CATCH', 'CATTLE', 'CAUSE', 'CELEBRATE', 'CELLPHONE'
 2180  DATA 'CEMENT', 'CENT', 'CERTAIN', 'CHAIN', 'CHAINSAW', 'CHAIR'
 2190  DATA 'CHANCE', 'CHANGE', 'CHARGE', 'CHAUFFEUR', 'CHEAP'
 2200  DATA 'CHEAPER', 'CHEESE', 'CHEST', 'CHICKEN', 'CHILD'
 2210  DATA 'CHILDHOOD', 'CHILDREN', 'CHOKING', 'CHOSEN', 'CHURCH'
 2220  DATA 'CINEMA', 'CIRCLE', 'CIRCULAR', 'CLAIM', 'CLASS', 'CLEAN'
 2230  DATA 'CLEAR', 'CLEVER', 'CLOCK', 'CLOSE', 'CLOTH', 'CLOTHES'
 2240  DATA 'CLOWN', 'CLUB', 'CLUMSY', 'COAT', 'COAX', 'COFFEE'
 2250  DATA 'COHERENT', 'COLD', 'COLLEGE', 'COLOR', 'COMB', 'COME'
 2260  DATA 'COMFORTABLE', 'COMING', 'COMMON', 'COMPLAIN', 'COMPUTER'
 2270  DATA 'CONCERN', 'CONCRETE', 'CONFESS', 'CONSCIENCE'
 2280  DATA 'CONSISTENT', 'CONSOLE', 'CONTINUE', 'CONTRACT', 'CONVINCE'
 2290  DATA 'COOK', 'COPY', 'CORNFIELD', 'COUGH', 'COULD', 'COUNTRY'
 2300  DATA 'COUPLE', 'COURSE', 'COURT', 'COURTESY', 'COUSIN', 'COWBOY'
 2310  DATA 'COWGIRL', 'CRACK', 'CRANKY', 'CRAWL', 'CRAZY', 'CREEK'
 2320  DATA 'CRIES', 'CRIMINAL', 'CROW', 'CROWD', 'CROWDED', 'CROWN'
 2330  DATA 'CRUSH', 'CRY', 'CRYING', 'CUE', 'CUPCAKE', 'CURIOSITY'
 2340  DATA 'CUSTOMARY', 'CUT', 'CUTTING', 'DAMAGE', 'DANGER'
 2350  DATA 'DANGEROUS', 'DARE', 'DARK', 'DARLING', 'DAY', 'DEAD'
 2360  DATA 'DEADLY', 'DEAL', 'DEAR', 'DEATH', 'DEBT', 'DECIDE', 'DECK'
 2370  DATA 'DEER', 'DEFEND', 'DEFENSE', 'DEFINITE', 'DELIBERATE'
 2380  DATA 'DELIGHTED', 'DEMANDING', 'DENY', 'DESCEND', 'DESERVE'
 2390  DATA 'DESK', 'DESTROY', 'DEVIL', 'DID', 'DIFFERENCE'
 2400  DATA 'DIFFERENT', 'DIG', 'DIME', 'DIMENSION', 'DINNER', 'DIRT'
 2410  DATA 'DIRTY', 'DISCIPLINE', 'DISCONNECT', 'DISPATCH'
 2420  DATA 'DISPOSITION', 'DISTURB', 'DOCTOR', 'DOES', 'DOING', 'DOLL'
 2430  DATA 'DOLLAR', 'DONATE', 'DONE', 'DONKEY', 'DOOR', 'DOORKNOB'
 2440  DATA 'DOSE', 'DOUBT', 'DOWN', 'DRASTIC', 'DRAW', 'DREAD'
 2450  DATA 'DREADFUL', 'DREAM', 'DRESS', 'DRINK', 'DRIVE', 'DROPPED'
 2460  DATA 'DRY', 'DUCHESS', 'DUMB', 'DURING', 'DUST', 'EACH', 'EAR'
 2470  DATA 'EARLY', 'EARN', 'EARNEST', 'EARPLUG', 'EARS', 'EARTH'
 2480  DATA 'EAT', 'EAVESDROP', 'EGG', 'EIGHT', 'EITHER', 'ELBOW'
 2490  DATA 'ELEPHANT', 'ELK', 'ELLIPSE', 'ELOCUTION', 'ELSE', 'EMPTY'
 2500  DATA 'ENCYCLOPEDIA', 'END', 'ENDS', 'ENGAGE', 'ENJOYMENT'
 2510  DATA 'ENOUGH', 'ENTER', 'ENTERTAIN', 'ENTIRE', 'ENTIRELY'
 2520  DATA 'ENVY', 'EQUIP', 'EVEN', 'EVENING', 'EVER', 'EVERY'
 2530  DATA 'EVERYBODY', 'EVERYTHING', 'EVERYWHERE', 'EVIDENT', 'EXACT'
 2540  DATA 'EXACTLY', 'EXAMINATION', 'EXAMPLE', 'EXCELLENT', 'EXCUSE'
 2550  DATA 'EXIST', 'EXPECT', 'EXPECTED', 'EXPLAIN', 'EXPLANATION'
 2560  DATA 'EXTRA', 'EXTRAVAGANT', 'EYE', 'FACE', 'FACT', 'FADED'
 2570  DATA 'FAINT', 'FAINTEST', 'FAKE', 'FAMILY', 'FAMOUS', 'FANCY'
 2580  DATA 'FAR', 'FARM', 'FAST', 'FAT', 'FATHER', 'FATTER', 'FAUCET'
 2590  DATA 'FAULT', 'FAVORITE', 'FEAR', 'FEED', 'FEEL', 'FEET', 'FELT'
 2600  DATA 'FENCE', 'FEVER', 'FEW', 'FIB', 'FIBBER', 'FIELD'
 2610  DATA 'FIFTEEN', 'FIGHT', 'FINAL', 'FINALLY', 'FIND', 'FINE'
 2620  DATA 'FINGER', 'FINISH', 'FIRE', 'FIRST', 'FISH', 'FIT', 'FIVE'
 2630  DATA 'FIX', 'FLAKE', 'FLEA', 'FLOOR', 'FLOUR', 'FLOWER', 'FOND'
 2640  DATA 'FONDER', 'FOOD', 'FOOL', 'FOOLISH', 'FOOT', 'FOOTBALL'
 2650  DATA 'FOOTSTOOL', 'FOR', 'FORCE', 'FOREST', 'FOREVER', 'FORGET'
 2660  DATA 'FORGIVE', 'FORK', 'FORM', 'FORWARD', 'FOUND', 'FOUR'
 2670  DATA 'FOURTH', 'FREAK', 'FREE', 'FREEZE', 'FRIEND', 'FRIGHT'
 2680  DATA 'FRIGHTEN', 'FROM', 'FRONT', 'FRUIT', 'FUDGE', 'FULL'
 2690  DATA 'FUN', 'FUNNY', 'FUSS', 'GAME', 'GARBAGE', 'GAS'
 2700  DATA 'GASOLINE', 'GAVE', 'GAY', 'GET', 'GIFT', 'GIRL', 'GIRLS'
 2710  DATA 'GIVE', 'GIVEN', 'GLAD', 'GLASS', 'GLASSES', 'GLOBAL'
 2720  DATA 'GLORY', 'GOD', 'GOLD', 'GONE', 'GOO', 'GOOD', 'GOOEY'
 2730  DATA 'GOOSE', 'GORILLA', 'GOSSIP', 'GOT', 'GOTTEN', 'GOWN'
 2740  DATA 'GRADE', 'GRAND', 'GRANDCHILD', 'GRANDDAUGHTER', 'GRANDMA'
 2750  DATA 'GRANDMOTHER', 'GRANDSON', 'GRATEFUL', 'GRAY', 'GREAT'
 2760  DATA 'GREATER', 'GREEN', 'GRIN', 'GRIND', 'GRINDER', 'GROOM'
 2770  DATA 'GROUND', 'GROUP', 'GROW', 'GROWL', 'GROWN', 'GRUNT'
 2780  DATA 'GUESS', 'GUILTY', 'GUN', 'HABIT', 'HAD', 'HAIR', 'HALF'
 2790  DATA 'HAM', 'HAMBURGER', 'HAND', 'HANDKERCHIEF', 'HANG'
 2800  DATA 'HAPPEN', 'HAPPY', 'HARD', 'HARM', 'HARMLESS', 'HAS'
 2810  DATA 'HATE', 'HAVE', 'HAWK', 'HEAD', 'HEADACHE', 'HEADPHONE'
 2820  DATA 'HEALTH', 'HEAR', 'HEARD', 'HEART', 'HEAVEN', 'HEAVY'
 2830  DATA 'HELICOPTER', 'HELP', 'HELPED', 'HELPS', 'HER', 'HERE'
 2840  DATA 'HIDDEN', 'HIDE', 'HIGHWAY', 'HILL', 'HIM', 'HIP', 'HIS'
 2850  DATA 'HISTORY', 'HOCKEY', 'HOLES', 'HOLIDAY', 'HOME', 'HOMESICK'
 2860  DATA 'HOMESTEAD', 'HONEST', 'HONEY', 'HONEYMOON', 'HONOR'
 2870  DATA 'HOOK', 'HOOT', 'HOPE', 'HORN', 'HORNET', 'HORRIBLE'
 2880  DATA 'HORSE', 'HOSE', 'HOSPITAL', 'HOT', 'HOUND', 'HOUR'
 2890  DATA 'HOUSE', 'HOW', 'HUMAN', 'HUMILIATE', 'HUNDRED', 'HUNGRY'
 2900  DATA 'HURRICANE', 'HURRY', 'HURT', 'ICE', 'ICECREAM', 'IDEA'
 2910  DATA 'IDEAL', 'IDIOT', 'IMAGINE', 'IMMORTAL', 'IMPERTINENT'
 2920  DATA 'IMPORTANT', 'IMPOSSIBLE', 'IMPRESSION', 'INDEED', 'INFANT'
 2930  DATA 'INFLUENCE', 'INN', 'INSANE', 'INSIDE', 'INSTEAD', 'INTEND'
 2940  DATA 'INTEREST', 'INTERESTED', 'INTERESTING', 'INTERFERE'
 2950  DATA 'INTERRUPT', 'INTO', 'INVENT', 'INVOLVED', 'IRRESPONSIBLE'
 2960  DATA 'ITSELF', 'JAIL', 'JEALOUS', 'JIGSAW', 'JOB', 'JOKE'
 2970  DATA 'JOURNEY', 'JUDGE', 'JUMP', 'JUNK', 'JURY', 'JUST'
 2980  DATA 'JUSTICE', 'KEEP', 'KEEPING', 'KEPT', 'KEY', 'KEYBOARD'
 2990  DATA 'KEYHOLE', 'KICK', 'KICKED', 'KID', 'KIDDING', 'KILL'
 3000  DATA 'KIND', 'KING', 'KISS', 'KITCHEN', 'KNEE', 'KNEW', 'KNIFE'
 3010  DATA 'KNIGHT', 'KNOCK', 'KNOW', 'KNOWLEDGE', 'KNOWN'
 3020  DATA 'LABORATORY', 'LADY', 'LAKE', 'LANGUAGE', 'LAPTOP', 'LAST'
 3030  DATA 'LATCH', 'LATE', 'LATELY', 'LATER', 'LATEST', 'LATIN'
 3040  DATA 'LAWN', 'LAWYER', 'LEAN', 'LEARN', 'LEAST', 'LEAVE', 'LEFT'
 3050  DATA 'LEG', 'LEMON', 'LESSON', 'LET', 'LETTUCE', 'LIAR', 'LIBEL'
 3060  DATA 'LIBRARY', 'LIE', 'LIED', 'LIFE', 'LIGHT', 'LIGHTHOUSE'
 3070  DATA 'LIKABLE', 'LIKE', 'LIKELY', 'LIKES', 'LIME', 'LIMIT'
 3080  DATA 'LINE', 'LINEN', 'LINES', 'LINING', 'LIP', 'LIPS', 'LISTEN'
 3090  DATA 'LITTLE', 'LIVE', 'LIVER', 'LIVING', 'LOADER', 'LOCKET'
 3100  DATA 'LONG', 'LONGER', 'LOOK', 'LOOSE', 'LOSE', 'LOST', 'LOT'
 3110  DATA 'LOUD', 'LOUSE', 'LOUSY', 'LOVE', 'LOYAL', 'LUCKY', 'LUNCH'
 3120  DATA 'LYING', 'MACARONI', 'MAD', 'MADE', 'MAID', 'MAJESTY'
 3130  DATA 'MAKE', 'MAKING', 'MAMMA', 'MAN', 'MANAGE', 'MANY'
 3140  DATA 'MARBLE', 'MARKET', 'MARRIAGE', 'MARRIED', 'MARRY', 'MASON'
 3150  DATA 'MASONRY', 'MASTER', 'MATTER', 'MAY', 'MAYBE', 'MEAL'
 3160  DATA 'MEAN', 'MEANT', 'MEET', 'MELT', 'MEN', 'MERCY', 'MESS'
 3170  DATA 'MESSY', 'MICROSCOPE', 'MIGHT', 'MIGHTY', 'MILD', 'MILE'
 3180  DATA 'MILK', 'MIND', 'MINE', 'MINUTE', 'MISS', 'MISTAKE'
 3190  DATA 'MISTREAT', 'MITH', 'MIXED', 'MIXING', 'MOMENT', 'MONARCH'
 3200  DATA 'MONDAY', 'MONEY', 'MONKEY', 'MONOTONOUS', 'MONTH'
 3210  DATA 'MONTHS', 'MORAL', 'MORE', 'MORNING', 'MORTAR', 'MOST'
 3220  DATA 'MOTHER', 'MOTOR', 'MOUNTAIN', 'MOUSE', 'MOUTH', 'MOVE'
 3230  DATA 'MOVIE', 'MUCH', 'MUFFIN', 'MULE', 'MURDER', 'MUST'
 3240  DATA 'MUZZLE', 'MYSELF', 'NAGGING', 'NAME', 'NAMES', 'NAP'
 3250  DATA 'NASTY', 'NATURAL', 'NAUGHTY', 'NEAR', 'NEARLY', 'NEAT'
 3260  DATA 'NEATLY', 'NECESSARIL', 'NECESSARY', 'NECKLACE', 'NEED'
 3270  DATA 'NEEDED', 'NEEDLE', 'NERVE', 'NET', 'NEVER', 'NEW', 'NEXT'
 3280  DATA 'NICE', 'NICEST', 'NIECE', 'NIGHT', 'NIGHTGOWN'
 3290  DATA 'NIGHTMARE', 'NINE', 'NOBODY', 'NOISE', 'NOISY', 'NONE'
 3300  DATA 'NONSENSE', 'NOPE', 'NOSE', 'NOT', 'NOTEBOOK', 'NOTHING'
 3310  DATA 'NOTION', 'NOTORIETY', 'NOURISH', 'NOW', 'NUISANCE'
 3320  DATA 'NURSE', 'OATH', 'OBJECT', 'OBLIGATION', 'OCCUPY', 'ODD'
 3330  DATA 'OFF', 'OFFERS', 'OFFICE', 'OFTEN', 'OIL', 'OILY', 'OLD'
 3340  DATA 'ONCE', 'ONE', 'ONION', 'ONLY', 'OPEN', 'ORANGE'
 3350  DATA 'ORDINARY', 'OTHER', 'OTHERS', 'OUGHT', 'OUR', 'OURS'
 3360  DATA 'OURSELVES', 'OUT', 'OUTSIDE', 'OVEN', 'OVER', 'OVERCOAT'
 3370  DATA 'OWE', 'OWN', 'PACK', 'PACKED', 'PAID', 'PAIN', 'PAIR'
 3380  DATA 'PAJAMAS', 'PAPER', 'PARACHUTE', 'PARK', 'PART'
 3390  DATA 'PARTICULAR', 'PASSAGE', 'PASSION', 'PAST', 'PATIENCE'
 3400  DATA 'PATIENT', 'PAY', 'PEA', 'PEACE', 'PEAR', 'PEOPLE', 'PEPPY'
 3410  DATA 'PERFECT', 'PERFORMANCE', 'PERHAPS', 'PERIOD', 'PERMISSION'
 3420  DATA 'PERSON', 'PET', 'PETAL', 'PHENOMENON', 'PHONE', 'PICK'
 3430  DATA 'PICKUP', 'PICTURE', 'PIE', 'PIECE', 'PILLOW', 'PINCH'
 3440  DATA 'PINE', 'PIPE', 'PISTOL', 'PITY', 'PLACE', 'PLAN', 'PLAY'
 3450  DATA 'PLEAD', 'PLEASANT', 'PLEASE', 'PLEASURE', 'PLENTY', 'PLOW'
 3460  DATA 'PLUM', 'POINT', 'POISON', 'POLICE', 'POLITE', 'PONY'
 3470  DATA 'POOR', 'POP', 'POSSIBLE', 'POSSIBLY', 'POST', 'POTATO'
 3480  DATA 'POWDER', 'POWER', 'PRAY', 'PRAYER', 'PRAYING', 'PRESENT'
 3490  DATA 'PRETEND', 'PRETTY', 'PRIDE', 'PRISON', 'PROBABLY'
 3500  DATA 'PROBLEM', 'PROMISE', 'PROUD', 'PSYCHOLOGIST', 'PUBLIC'
 3510  DATA 'PULL', 'PUNISH', 'PUSH', 'PUT', 'PUZZLE', 'QUEER'
 3520  DATA 'QUESTION', 'QUICK', 'QUIET', 'QUILT', 'QUIT', 'QUITE'
 3530  DATA 'RABBIT', 'RACKET', 'RADIO', 'RAILROAD', 'RAIN', 'RAISE'
 3540  DATA 'RAISIN', 'RAN', 'RAT', 'RATHER', 'REACH', 'READ', 'READY'
 3550  DATA 'REAL', 'REALIZE', 'REALLY', 'REASON', 'RECOVER'
 3560  DATA 'RECREATION', 'RECTANGLE', 'REFRIGERATOR', 'REFUSE'
 3570  DATA 'REGRET', 'RELATION', 'RELIEF', 'RELIEVE', 'REMARK'
 3580  DATA 'REMEMBER', 'REMIND', 'REPEAT', 'REPUTATION', 'RESENT'
 3590  DATA 'RESENTED', 'REST', 'RESULT', 'RETRIEVE', 'RETRIEVER'
 3600  DATA 'RETURN', 'REVEAL', 'RHUBARB', 'RICH', 'RID', 'RIDE'
 3610  DATA 'RIDICULOUS', 'RIFLE', 'RIGHT', 'RIVER', 'ROAD', 'ROCK'
 3620  DATA 'ROCKER', 'ROCKET', 'ROCKING', 'ROOM', 'ROOSTER', 'ROPE'
 3630  DATA 'ROW', 'RUDE', 'RUIN', 'RULE', 'RUN', 'RUSH', 'RUST', 'SAD'
 3640  DATA 'SAFE', 'SAID', 'SAME', 'SANDWICH', 'SANE', 'SATELLITE'
 3650  DATA 'SATISFY', 'SATURDAY', 'SAUSAGE', 'SAVE', 'SAW', 'SAY'
 3660  DATA 'SCARE', 'SCARLET', 'SCENE', 'SCEPTRE', 'SCHOOL'
 3670  DATA 'SCISSORS', 'SCOLD', 'SCRAMBLE', 'SCRAMBLED', 'SCRAPE'
 3680  DATA 'SCREAM', 'SCRUB', 'SEASON', 'SECOND', 'SECRET', 'SEE'
 3690  DATA 'SEEM', 'SEEMED', 'SEEMS', 'SEEN', 'SELL', 'SELF', 'SEND'
 3700  DATA 'SENSE', 'SENSIBLY', 'SENT', 'SERIOUS', 'SERPENT'
 3710  DATA 'SERVICE', 'SEVEN', 'SEVERAL', 'SEWING', 'SEX', 'SEXUAL'
 3720  DATA 'SEXY', 'SHALL', 'SHALLOW', 'SHAME', 'SHARE', 'SHARP'
 3730  DATA 'SHARPEN', 'SHE', 'SHEET', 'SHIP', 'SHOCK', 'SHOP', 'SHORT'
 3740  DATA 'SHOT', 'SHOULD', 'SHOULDER', 'SHOW', 'SHOWS', 'SHRIEK'
 3750  DATA 'SHUT', 'SICK', 'SIDE', 'SIGN', 'SILLY', 'SILVER', 'SIN'
 3760  DATA 'SINCE', 'SINFUL', 'SINGLE', 'SIR', 'SISSY', 'SIT', 'SIX'
 3770  DATA 'SKIP', 'SLAP', 'SLAVE', 'SLAY', 'SLED', 'SLEEP', 'SLEEPY'
 3780  DATA 'SLEIGH', 'SLIP', 'SLIPPERY', 'SLOPE', 'SMALL', 'SMART'
 3790  DATA 'SMELL', 'SMOKE', 'SNEEZE', 'SNOW', 'SNOWFLAKE', 'SNUB'
 3800  DATA 'SOCCER', 'SOCIETY', 'SODA', 'SOLD', 'SOLDIER', 'SOLEMN'
 3810  DATA 'SOLID', 'SOLITARY', 'SOME', 'SOMEBODY', 'SOMETHING'
 3820  DATA 'SOMETIME', 'SOMEWHERE', 'SON', 'SOON', 'SOONER', 'SORE'
 3830  DATA 'SORRY', 'SORT', 'SOUND', 'SOUP', 'SOUVENIR', 'SPACE'
 3840  DATA 'SPACESHIP', 'SPARE', 'SPARED', 'SPEAK', 'SPEAKER'
 3850  DATA 'SPEECH', 'SPEND', 'SPITE', 'SPLENDID', 'SPOIL', 'SPOON'
 3860  DATA 'SPREAD', 'SPUR', 'SQUARE', 'STAGE', 'STAND', 'START'
 3870  DATA 'STARVE', 'STATE', 'STATION', 'STAY', 'STEAL', 'STEAM'
 3880  DATA 'STETHOSCOPE', 'STICK', 'STICKY', 'STILL', 'STOCK', 'STOLE'
 3890  DATA 'STOLEN', 'STOMACH', 'STONE', 'STOP', 'STORE', 'STORM'
 3900  DATA 'STORY', 'STOVE', 'STRANGE', 'STREET', 'STRING', 'STRONG'
 3910  DATA 'STRUGGLE', 'STUDY', 'STUFF', 'STUPID', 'STYLE', 'SUBMERGE'
 3920  DATA 'SUCH', 'SUDDEN', 'SUFFER', 'SUICIDE', 'SUIT', 'SUITCASE'
 3930  DATA 'SUM', 'SUMMER', 'SUNDAY', 'SUPER', 'SUPPORT', 'SUPPOSE'
 3940  DATA 'SURE', 'SWALLOW', 'SWAY', 'SWEAR', 'SWEET', 'SWELL'
 3950  DATA 'SYMPATHY', 'TABLE', 'TAKE', 'TAKEN', 'TALE', 'TALK'
 3960  DATA 'TALL', 'TANDEM', 'TANK', 'TATTLE', 'TAUGHT', 'TAXI', 'TEA'
 3970  DATA 'TEACH', 'TEETH', 'TELEGRAM', 'TELEPHONE', 'TELESCOPE'
 3980  DATA 'TELEVISION', 'TELL', 'TEMPER', 'TEMPLE', 'TEMPORARY'
 3990  DATA 'TEN', 'TENDER', 'TENNIS', 'TERM', 'TERRIBLE', 'TEST'
 4000  DATA 'TESTIFY', 'THANK', 'THAT', 'THAW', 'THE', 'THEATER'
 4010  DATA 'THEIR', 'THEM', 'THEMSELVES', 'THEN', 'THERE'
 4020  DATA 'THERMOMETER', 'THESE', 'THEY', 'THIEF', 'THING', 'THINGS'
 4030  DATA 'THINK', 'THIRTY', 'THIS', 'THOSE', 'THOUGH', 'THOUGHT'
 4040  DATA 'THOUGHTFUL', 'THOUSAND', 'THREATEN', 'THREE', 'THREW'
 4050  DATA 'THRONE', 'THROUGH', 'THROW', 'THUMB', 'THURSDAY', 'TICK'
 4060  DATA 'TIGHT', 'TIME', 'TIRED', 'TIRESOME', 'TODAY', 'TOE'
 4070  DATA 'TOGETHER', 'TOILET', 'TOLD', 'TOMORROW', 'TONE', 'TONGUE'
 4080  DATA 'TONIGHT', 'TOO', 'TOOK', 'TOOTH', 'TOUCH', 'TOUR', 'TOWN'
 4090  DATA 'TRACTOR', 'TRAIN', 'TRANSLATE', 'TRAVEL', 'TREASURE'
 4100  DATA 'TREATING', 'TREE', 'TRIAL', 'TRIANGLE', 'TRICK', 'TRIED'
 4110  DATA 'TRIP', 'TROUBLE', 'TRUCK', 'TRUE', 'TRUNK', 'TRUST'
 4120  DATA 'TRUTH', 'TRY', 'TUESDAY', 'TURKEY', 'TURN', 'TWENTY'
 4130  DATA 'TWICE', 'TWIG', 'TWO', 'UGLY', 'UNCLE', 'UNCONSCIOUS'
 4140  DATA 'UNDER', 'UNDERSTAND', 'UNFORTUNATE', 'UNHAPPY'
 4150  DATA 'UNNATURAL', 'UNPACK', 'UNPLEASANT', 'UNREAL', 'UNTIL'
 4160  DATA 'UNUSUAL', 'UNWISE', 'UPSTAIRS', 'USE', 'USED', 'USING'
 4170  DATA 'VACATION', 'VASE', 'VERY', 'VICIOUS', 'VILLAGE', 'VIRUS'
 4180  DATA 'VISIT', 'VOICE', 'VOLLEYBALL', 'VOLUME', 'VULGAR'
 4190  DATA 'VULTURE', 'WAGON', 'WAIT', 'WAKE', 'WALK', 'WANT', 'WARM'
 4200  DATA 'WAS', 'WASH', 'WASP', 'WASTE', 'WATCH', 'WATER', 'WAY'
 4210  DATA 'WEAK', 'WEAR', 'WEASEL', 'WEDDING', 'WEDNESDAY', 'WEEK'
 4220  DATA 'WEEKS', 'WEEP', 'WELFARE', 'WELL', 'WELLS', 'WENT', 'WERE'
 4230  DATA 'WEREWOLF', 'WHAT', 'WHATEVER', 'WHEEL', 'WHEN', 'WHENEVER'
 4240  DATA 'WHERE', 'WHEREEVER', 'WHETHER', 'WHICH', 'WHILE'
 4250  DATA 'WHISKEY', 'WHISPER', 'WHITE', 'WHO', 'WHOEVER', 'WHOLE'
 4260  DATA 'WHOSE', 'WHY', 'WICKED', 'WIFE', 'WILD', 'WILL', 'WIN'
 4270  DATA 'WIND', 'WINDOW', 'WINDY', 'WINTER', 'WIRE', 'WISE', 'WISH'
 4280  DATA 'WITH', 'WITHOUT', 'WOMAN', 'WOMEN', 'WONDER', 'WONDERFUL'
 4290  DATA 'WOOD', 'WOOL', 'WORD', 'WORK', 'WORLD', 'WORM', 'WORN'
 4300  DATA 'WORRY', 'WORSE', 'WORST', 'WOULD', 'WRITE', 'WRONG'
 4310  DATA 'WROTE', 'YARD', 'YEAR', 'YEH', 'YELL', 'YES', 'YESTERDAY'
 4320  DATA 'YET', 'YOU', 'YOUNG', 'YOUR', 'YOURSELF', 'ZEBRA'
 4330  DATA ''
