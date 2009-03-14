#------------------------------------------------------------------------
#$Author$
#$Date$ 
#$Revision$
#$URL$
#------------------------------------------------------------------------
#* 
# A list of the spacegroup names with the ITC numbers, long and short
# spelling.
#**

package SpacegroupNames;

use strict;

require Exporter;
@SpacegroupNames::ISA = qw(Exporter);
@SpacegroupNames::EXPORT = qw( @names );

@SpacegroupNames::names = (
[1,	"P 1",	"P 1" ],
[2,	"P -1",	"P -1" ],
[2,	"P 1-",	"P -1" ],
[3,	"P 2",	"P 1 2 1" ],
[4,	"P 21",	"P 1 21 1" ],
[5,	"C 2",	"C 1 2 1" ],
[6,	"P m",	"P 1 m 1" ],
[7,	"P c",	"P 1 c 1" ],
[8,	"C m",	"C 1 m 1" ],
[9,	"C c",	"C 1 c 1" ],
[10,	"P 2/m",	"P 1 2/m 1" ],
[11,	"P 21/m",	"P 1 21/m 1" ],
[12,	"C 2/m",	"C 1 2/m 1" ],
[13,	"P 2/c",	"P 1 2/c 1" ],
[13,	"P 2/a",	"P 1 2/a 1" ],
[13,	"P 2/n",	"P 1 2/n 1" ],
[14,	"P 21/c",	"P 1 21/c 1" ],
[14,	"P 21/a",	"P 1 21/a 1" ],
[14,	"P 21/n",	"P 1 21/n 1" ],
[15,	"C 2/c",	"C 1 2/c 1" ],
[15,    "A 2/n",        "A 1 2/n 1" ],
[15,    "I 2/a",        "I 1 2/a 1" ],
[15,    "A 1 2/a 1",    "A 1 2/a 1" ], # from cctbx via SymopLookup.pm
[15,    "C 1 2/n 1",    "C 1 2/n 1" ], # from cctbx via SymopLookup.pm
[15,    "I 1 2/c 1",    "I 1 2/c 1" ], # from cctbx via SymopLookup.pm
[15,    "A 2/a", 	"A 1 1 2/a" ],
[15,    "B 2/b", 	"B 1 1 2/n" ],
[15,    "I 2/b", 	"I 1 1 2/b" ],
[15,    "B 1 1 2/b",    "B 1 1 2/b" ], # from cctbx via SymopLookup.pm
[15,    "A 1 1 2/n",    "A 1 1 2/n" ], # from cctbx via SymopLookup.pm
[15,    "I 1 1 2/a",    "I 1 1 2/a" ], # from cctbx via SymopLookup.pm
[15,    "B 2/b", 	"B 2/a 1 1" ],
[15,    "C 2/n", 	"C 2/n 1 1" ],
[15,    "I 2/c", 	"I 2/c 1 1" ],
[15,    "C 2/c 1 1",    "C 2/c 1 1" ], # from cctbx via SymopLookup.pm
[15,    "B 2/n 1 1",    "B 2/n 1 1" ], # from cctbx via SymopLookup.pm
[15,    "I 2/b 1 1",    "I 2/b 1 1" ], # from cctbx via SymopLookup.pm
[16,	"P 2 2 2",	"P 2 2 2" ],
[17,	"P 2 2 21",	"P 2 2 21" ],
[18,	"P 21 21 2",	"P 21 21 2" ],
[19,	"P 21 21 21",	"P 21 21 21" ],
[20,	"C 2 2 21",	"C 2 2 21" ],
[21,	"C 2 2 2",	"C 2 2 2" ],
[22,	"F 2 2 2",	"F 2 2 2" ],
[23,	"I 2 2 2",	"I 2 2 2" ],
[24,	"I 21 21 21",	"I 21 21 21" ],
[25,	"P m m 2",	"P m m 2" ],
[26,	"P m c 21",	"P m c 21" ],
[27,	"P c c 2",	"P c c 2" ],
[28,	"P m a 2",	"P m a 2" ],
[29,	"P c a 21",	"P c a 21" ],
[30,	"P n c 2",	"P n c 2" ],
[31,	"P m n 21",	"P m n 21" ],
[32,	"P b a 2",	"P b a 2" ],
[33,	"P n a 21",	"P n a 21" ],
[34,	"P n n 2",	"P n n 2" ],
[35,	"C m m 2",	"C m m 2" ],
[36,	"C m c 21",	"C m c 21" ],
[37,	"C c c 2",	"C c c 2" ],
[38,	"A m m 2",	"A m m 2" ],
[39,	"A b m 2",	"A b m 2" ],
[40,	"A m a 2",	"A m a 2" ],
[41,	"A b a 2",	"A b a 2" ],
[42,	"F m m 2",	"F m m 2" ],
[43,	"F d d 2",	"F d d 2" ],
[44,	"I m m 2",	"I m m 2" ],
[45,	"I b a 2",	"I b a 2" ],
[46,	"I m a 2",	"I m a 2" ],
[47,	"P m m m",	"P 2/m 2/m 2/m" ],
[47,	"P m m m",	"P m m m" ],
[48,	"P n n n",	"P 2/n 2/n 2/n" ],
[48,	"P n n n",	"P n n n" ],
[49,	"P c c m",	"P 2/c 2/c 2/m" ],
[49,	"P c c m",	"P c c m" ],
[50,	"P b a n",	"P 2/b 2/a 2/n" ],
[50,	"P b a n",	"P b a n" ],
[51,	"P m m a",	"P 21/m 2/m 2/a" ],
[51,	"P m m a",	"P m m a" ],
[52,	"P n n a",	"P 2/n 21/n 2/a" ],
[52,	"P n n a",	"P n n a" ],
[53,	"P m n a",	"P 2/m 2/n 21/a" ],
[53,	"P m n a",	"P m n a" ],
[54,	"P c c a",	"P 21/c 2/c 2/a" ],
[54,	"P c c a",	"P c c a" ],
[55,	"P b a m",	"P 21/b 21/a 2/m" ],
[55,	"P b a m",	"P b a m" ],
[56,	"P c c n",	"P 21/c 21/c 2/n" ],
[56,	"P c c n",	"P c c n" ],
[57,	"P b c m",	"P 2/b 21/c 21/m" ],
[57,	"P b c m",	"P b c m" ],
[58,	"P n n m",	"P 21/n 21/n 2/m" ],
[58,	"P n n m",	"P n n m" ],
[59,	"P m m n",	"P 21/m 21/m 2/n" ],
[59,	"P m m n",	"P m m n" ],
[60,	"P b c n",	"P 21/b 2/c 21/n" ],
[60,	"P b c n",	"P b c n" ],
[61,	"P b c a",	"P 21/b 21/c 21/a" ],
[61,	"P b c a",	"P b c a" ],
[61,    "P c a b", 	"P c a b" ],
[62,	"P n m a",	"P 21/n 21/m 21/a" ],
[62,	"P n m a",	"P n m a" ],
[63,	"C m c m",	"C 2/m 2/c 21/m" ],
[63,	"C m c m",	"C m c m" ],
[64,	"C m c a",	"C 2/m 2/c 21/a" ],
[64,	"C m c a",	"C m c a" ],
[65,	"C m m m",	"C 2/m 2/m 2/m" ],
[65,	"C m m m",	"C m m m" ],
[66,	"C c c m",	"C 2/c 2/c 2/m" ],
[66,	"C c c m",	"C c c m" ],
[67,	"C m m a",	"C 2/m 2/m 2/a" ],
[67,	"C m m a",	"C m m a" ],
[68,	"C c c a",	"C 2/c 2/c 2/a" ],
[68,	"C c c a",	"C c c a" ],
[69,	"F m m m",	"F 2/m 2/m 2/m" ],
[69,	"F m m m",	"F m m m" ],
[70,	"F d d d",	"F 2/d 2/d 2/d" ],
[70,	"F d d d",	"F d d d" ],
[71,	"I m m m",	"I 2/m 2/m 2/m" ],
[71,	"I m m m",	"I m m m" ],
[72,	"I b a m",	"I 2/b 2/a 2/m" ],
[72,	"I b a m",	"I b a m" ],
[73,	"I b c a",	"I 21/b 21/c 21/a" ],
[73,	"I b c a",	"I b c a" ],
[74,	"I m m a",	"I 21/m 21/m 21/a" ],
[74,	"I m m a",	"I m m a" ],
[75,	"P 4",	"P 4" ],
[76,	"P 41",	"P 41" ],
[77,	"P 42",	"P 42" ],
[78,	"P 43",	"P 43" ],
[79,	"I 4",	"I 4" ],
[80,	"I 41",	"I 41" ],
[81,	"P -4",	"P -4" ],
[82,	"I -4",	"I -4" ],
[83,	"P 4/m",	"P 4/m" ],
[84,	"P 42/m",	"P 42/m" ],
[85,	"P 4/n",	"P 4/n" ],
[86,	"P 42/n",	"P 42/n" ],
[87,	"I 4/m",	"I 4/m" ],
[88,	"I 41/a",	"I 41/a" ],
[89,	"P 4 2 2",	"P 4 2 2" ],
[90,	"P 4 21 2",	"P 4 21 2" ],
[91,	"P 41 2 2",	"P 41 2 2" ],
[92,	"P 41 21 2",	"P 41 21 2" ],
[93,	"P 42 2 2",	"P 42 2 2" ],
[94,	"P 42 21 2",	"P 42 21 2" ],
[95,	"P 43 2 2",	"P 43 2 2" ],
[96,	"P 43 21 2",	"P 43 21 2" ],
[97,	"I 4 2 2",	"I 4 2 2" ],
[98,	"I 41 2 2",	"I 41 2 2" ],
[99,	"P 4 m m",	"P 4 m m" ],
[100,	"P 4 b m",	"P 4 b m" ],
[101,	"P 42 c m",	"P 42 c m" ],
[102,	"P 42 n m",	"P 42 n m" ],
[103,	"P 4 c c",	"P 4 c c" ],
[104,	"P 4 n c",	"P 4 n c" ],
[105,	"P 42 m c",	"P 42 m c" ],
[106,	"P 42 b c",	"P 42 b c" ],
[107,	"I 4 m m",	"I 4 m m" ],
[108,	"I 4 c m",	"I 4 c m" ],
[109,	"I 41 m d",	"I 41 m d" ],
[110,	"I 41 c d",	"I 41 c d" ],
[111,	"P -4 2 m",	"P -4 2 m" ],
[112,	"P -4 2 c",	"P -4 2 c" ],
[113,	"P -4 21 m",	"P -4 21 m" ],
[114,	"P -4 21 c",	"P -4 21 c" ],
[115,	"P -4 m 2",	"P -4 m 2" ],
[116,	"P -4 c 2",	"P -4 c 2" ],
[117,	"P -4 b 2",	"P -4 b 2" ],
[118,	"P -4 n 2",	"P -4 n 2" ],
[119,	"I -4 m 2",	"I -4 m 2" ],
[120,	"I -4 c 2",	"I -4 c 2" ],
[121,	"I -4 2 m",	"I -4 2 m" ],
[122,	"I -4 2 d",	"I -4 2 d" ],
[123,	"P 4/m m m",	"P 4/m 2/m 2/m" ],
[123,	"P 4/m m m",	"P 4/m m m" ],
[124,	"P 4/m c c",	"P 4/m 2/c 2/c" ],
[124,	"P 4/m c c",	"P 4/m c c" ],
[125,	"P 4/n b m",	"P 4/n 2/b 2/m" ],
[125,	"P 4/n b m",	"P 4/n b m" ],
[126,	"P 4/n n c",	"P 4/n 2/n 2/c" ],
[126,	"P 4/n n c",	"P 4/n n c" ],
[127,	"P 4/m b m",	"P 4/m 21/b 2/m" ],
[127,	"P 4/m b m",	"P 4/m b m" ],
[128,	"P 4/m n c",	"P 4/m 21/n 2/c" ],
[128,	"P 4/m n c",	"P 4/m n c" ],
[129,	"P 4/n m m",	"P 4/n 21/m 2/m" ],
[129,	"P 4/n m m",	"P 4/n m m" ],
[130,	"P 4/n c c",	"P 4/n 2/c 2/c" ],
[130,	"P 4/n c c",	"P 4/n c c" ],
[131,	"P 42/m m c",	"P 42/m 2/m 2/c" ],
[131,	"P 42/m m c",	"P 42/m m c" ],
[132,	"P 42/m c m",	"P 42/m 2/c 2/m" ],
[132,	"P 42/m c m",	"P 42/m c m" ],
[133,	"P 42/n b c",	"P 42/n 2/b 2/c" ],
[133,	"P 42/n b c",	"P 42/n b c" ],
[134,	"P 42/n n m",	"P 42/n 2/n 2/m" ],
[134,	"P 42/n n m",	"P 42/n n m" ],
[135,	"P 42/m b c",	"P 42/m 21/b 2/c" ],
[135,	"P 42/m b c",	"P 42/m b c" ],
[136,	"P 42/m n m",	"P 42/m 21/n 2/m" ],
[136,	"P 42/m n m",	"P 42/m n m" ],
[137,	"P 42/n m c",	"P 42/n 21/m 2/c" ],
[137,	"P 42/n m c",	"P 42/n m c" ],
[138,	"P 42/n c m",	"P 42/n 21/c 2/m" ],
[138,	"P 42/n c m",	"P 42/n c m" ],
[139,	"I 4/m m m",	"I 4/m 2/m 2/m" ],
[139,	"I 4/m m m",	"I 4/m m m" ],
[140,	"I 4/m c m",	"I 4/m 2/c 2/m" ],
[140,	"I 4/m c m",	"I 4/m c m" ],
[141,	"I 41/a m d",	"I 41/a 2/m 2/d" ],
[141,	"I 41/a m d",	"I 41/a m d" ],
[142,	"I 41/a c d",	"I 41/a 2/c 2/d" ],
[142,	"I 41/a c d",	"I 41/a c d" ],
[143,	"P 3",	"P 3" ],
[144,	"P 31",	"P 31" ],
[145,	"P 32",	"P 32" ],
[146,	"H 3",	  "H 3" ],
[146,	"R 3 :H", "R 3 :H" ], # Actually synonymous to 'H 3'
[1146,	"R 3",	  "R 3" ],
[1146,	"R 3 :R", "R 3 :R" ],
[147,	"P -3",	"P -3" ],
[148,	"H -3",	   "H -3" ],
[148,	"R -3 :H", "R -3 :H" ],
[1148,	"R -3",	   "R -3" ],
[1148,	"R -3 :R", "R -3 :R" ],
[149,	"P 3 1 2",	"P 3 1 2" ],
[150,	"P 3 2 1",	"P 3 2 1" ],
[151,	"P 31 1 2",	"P 31 1 2" ],
[152,	"P 31 2 1",	"P 31 2 1" ],
[153,	"P 32 1 2",	"P 32 1 2" ],
[154,	"P 32 2 1",	"P 32 2 1" ],
[155,	"H 3 2",	"H 3 2" ],
[155,	"R 3 2 :H",	"R 3 2 :H" ],
[1155,	"R 3 2",	"R 3 2" ],
[1155,	"R 3 2 :R",	"R 3 2 :R" ],
[156,	"P 3 m 1",	"P 3 m 1" ],
[157,	"P 3 1 m",	"P 3 1 m" ],
[158,	"P 3 c 1",	"P 3 c 1" ],
[159,	"P 3 1 c",	"P 3 1 c" ],
[160,	"H 3 m",	"H 3 m" ],
[160,	"R 3 m :H",	"R 3 m :H" ],
[1160,	"R 3 m",	"R 3 m" ],
[1160,	"R 3 m :R",	"R 3 m :R" ],
[161,	"H 3 c",	"H 3 c" ],
[161,	"R 3 c :H",	"R 3 c :H" ],
[1161,	"R 3 c",	"R 3 c" ],
[1161,	"R 3 c :R",	"R 3 c :R" ],
[162,	"P -3 1 m",	"P -3 1 2/m" ],
[162,	"P -3 1 m",	"P -3 1 m" ],
[163,	"P -3 1 c",	"P -3 1 2/c" ],
[163,	"P -3 1 c",	"P -3 1 c" ],
[164,	"P -3 m 1",	"P -3 2/m 1" ],
[164,	"P -3 m 1",	"P -3 m 1" ],
[165,	"P -3 c 1",	"P -3 2/c 1" ],
[165,	"P -3 c 1",	"P -3 c 1" ],
[166,	"H -3 m",	"H -3 2/m" ],
[166,	"H -3 m",	"H -3 m" ],
[166,	"R -3 m :H",	"R -3 m :H" ],
[1166,	"R -3 m",	"R -3 2/m" ],
[1166,	"R -3 m",	"R -3 m" ],
[1166,	"R -3 m :R",	"R -3 m :R" ],
[167,	"H -3 c",	"H -3 2/c" ],
[167,	"H -3 c",	"H -3 c" ],
[167,	"R -3 c :H",	"R -3 c :H" ],
[1167,	"R -3 c",	"R -3 2/c" ],
[1167,	"R -3 c",	"R -3 c" ],
[1167,	"R -3 c :R",	"R -3 c :R" ],
[168,	"P 6",	"P 6" ],
[169,	"P 61",	"P 61" ],
[170,	"P 65",	"P 65" ],
[171,	"P 62",	"P 62" ],
[172,	"P 64",	"P 64" ],
[173,	"P 63",	"P 63" ],
[174,	"P -6",	"P -6" ],
[175,	"P 6/m",	"P 6/m" ],
[176,	"P 63/m",	"P 63/m" ],
[177,	"P 6 2 2",	"P 6 2 2" ],
[178,	"P 61 2 2",	"P 61 2 2" ],
[179,	"P 65 2 2",	"P 65 2 2" ],
[180,	"P 62 2 2",	"P 62 2 2" ],
[181,	"P 64 2 2",	"P 64 2 2" ],
[182,	"P 63 2 2",	"P 63 2 2" ],
[183,	"P 6 m m",	"P 6 m m" ],
[184,	"P 6 c c",	"P 6 c c" ],
[185,	"P 63 c m",	"P 63 c m" ],
[186,	"P 63 m c",	"P 63 m c" ],
[187,	"P -6 m 2",	"P -6 m 2" ],
[188,	"P -6 c 2",	"P -6 c 2" ],
[189,	"P -6 2 m",	"P -6 2 m" ],
[190,	"P -6 2 c",	"P -6 2 c" ],
[191,	"P 6/m m m",	"P 6/m 2/m 2/m" ],
[191,	"P 6/m m m",	"P 6/m m m" ],
[192,	"P 6/m c c",	"P 6/m 2/c 2/c" ],
[192,	"P 6/m c c",	"P 6/m c c" ],
[193,	"P 63/m c m",	"P 63/m 2/c 2/m" ],
[193,	"P 63/m c m",	"P 63/m c m" ],
[194,	"P 63/m m c",	"P 63/m 2/m 2/c" ],
[194,	"P 63/m m c",	"P 63/m m c" ],
[195,	"P 2 3",	"P 2 3" ],
[196,	"F 2 3",	"F 2 3" ],
[197,	"I 2 3",	"I 2 3" ],
[198,	"P 21 3",	"P 21 3" ],
[199,	"I 21 3",	"I 21 3" ],
[200,	"P m -3",	"P 2/m -3" ],
[200,	"P m -3",	"P m -3" ],
[201,	"P n -3",	"P 2/n -3" ],
[201,	"P n -3",	"P n -3" ],
[202,	"F m -3",	"F 2/m -3" ],
[202,	"F m -3",	"F m -3" ],
[203,	"F d -3",	"F 2/d -3" ],
[203,	"F d -3",	"F d -3" ],
[204,	"I m -3",	"I 2/m -3" ],
[204,	"I m -3",	"I m -3" ],
[205,	"P a -3",	"P 21/a -3" ],
[205,	"P a -3",	"P a -3" ],
[206,	"I a -3",	"I 21/a -3" ],
[206,	"I a -3",	"I a -3" ],
[207,	"P 4 3 2",	"P 4 3 2" ],
[208,	"P 42 3 2",	"P 42 3 2" ],
[209,	"F 4 3 2",	"F 4 3 2" ],
[210,	"F 41 3 2",	"F 41 3 2" ],
[211,	"I 4 3 2",	"I 4 3 2" ],
[212,	"P 43 3 2",	"P 43 3 2" ],
[213,	"P 41 3 2",	"P 41 3 2" ],
[214,	"I 41 3 2",	"I 41 3 2" ],
[215,	"P -4 3 m",	"P -4 3 m" ],
[216,	"F -4 3 m",	"F -4 3 m" ],
[217,	"I -4 3 m",	"I -4 3 m" ],
[218,	"P -4 3 n",	"P -4 3 n" ],
[219,	"F -4 3 c",	"F -4 3 c" ],
[220,	"I -4 3 d",	"I -4 3 d" ],
[221,	"P m -3 m",	"P 4/m -3 2/m" ],
[221,	"P m -3 m",	"P m -3 m" ],
[222,	"P n -3 n",	"P 4/n -3 2/n" ],
[222,	"P n -3 n",	"P n -3 n" ],
[223,	"P m -3 n",	"P 42/m -3 2/n" ],
[223,	"P m -3 n",	"P m -3 n" ],
[224,	"P n -3 m",	"P 42/n -3 2/m" ],
[224,	"P n -3 m",	"P n -3 m" ],
[225,	"F m -3 m",	"F 4/m -3 2/m" ],
[225,	"F m -3 m",	"F m -3 m" ],
[226,	"F m -3 c",	"F 4/m -3 2/c" ],
[226,	"F m -3 c",	"F m -3 c" ],
[227,	"F d -3 m",	"F 41/d -3 2/m" ],
[227,	"F d -3 m",	"F d -3 m" ],
[228,	"F d -3 c",	"F 41/d -3 2/c" ],
[228,	"F d -3 c",	"F d -3 c" ],
[229,	"I m -3 m",	"I 4/m -3 2/m" ],
[229,	"I m -3 m",	"I m -3 m" ],
[230,	"I a -3 d",	"I 41/a -3 2/d" ],
[230,	"I a -3 d",	"I a -3 d" ],
[1003,	"P 1 1 2",	"P 1 1 2" ],
[1004,	"P 1 1 2 1",	"P 1 1 21" ],
[3004,	"I 21",	"I 1 21 1" ],
[1005,	"B 2",	"B 1 1 2" ],
#[1005,	"B 2",	"B 2" ],
[2005,	"A 2",	"A 2 1 1" ],
[3005,	"C 21",	"C 1 21 1" ],
[4005,	"I 2",	"I 1 2 1" ],
[1006,	"P 1 1 m",	"P 1 1 m" ],
[1007,	"P 1 1 b",	"P 1 1 b" ],
[1008,	"B 1 1 m",	"B 1 1 m" ],
[1009,	"B 1 1 b",	"B 1 1 b" ],
[1010,	"P 1 1 2/m",	"P 1 1 2/m" ],
[1011,	"P 1 1 21/m",	"P 1 1 21/m" ],
[1012,	"B 1 1 2/m",	"B 1 1 2/m" ],
[1013,	"P 1 1 2/b",	"P 1 1 2/b" ],
[1014,	"P 1 1 21/b",	"P 1 1 21/b" ],
[1015,	"B 1 1 2/b",	"B 1 1 2/b" ],
[1017,	"P 21 2 2",	"P 21 2 2" ],
[2017,	"P 2 21 2",	"P 2 21 2" ],
[1018,	"P 21 21 2a",	"P 21 21 2 (a)" ],
[2018,	"P 21 2 21",	"P 21 2 21" ],
[3018,	"P 2 21 21",	"P 2 21 21" ],
[1020,	"C 2 2 21a",	"C 2 2 21a)" ],
[1021,	"C 2 2 2a",	"C 2 2 2a" ],
[1022,	"F 2 2 2a",	"F 2 2 2a" ],
[1023,	"I 2 2 2a",	"I 2 2 2a" ],
[1059,	"P m m n2",	"P 21/m 21/m 2/n a" ],
[1094,	"P 42 21 2a",	"P 42 21 2a" ],
[1197,	"I 2 3a",	"I 2 3a" ],

[25, "P 2 m m" , "P 2 m m"  ],
[25, "P m 2 m" , "P m 2 m"  ],
[25, "P m m 2" , "P m m 2"  ],
[26, "P 21 a m", "P 21 a m" ],
[26, "P 21 m a", "P 21 m a" ],
[26, "P b 21 m", "P b 21 m" ],
[26, "P c m 21", "P c m 21" ],
[26, "P m 21 b", "P m 21 b" ],
[27, "P 2 a a" , "P 2 a a"  ],
[27, "P b 2 b" , "P b 2 b"  ],
[27, "P c c 2" , "P c c 2"  ],
[28, "P 2 c m" , "P 2 c m"  ],
[28, "P 2 m b" , "P 2 m b"  ],
[28, "P b m 2" , "P b m 2"  ],
[28, "P m 2 a" , "P m 2 a"  ],
[28, "P m a 2" , "P m a 2"  ],
[29, "P 21 a b", "P 21 a b" ],
[29, "P 21 c a", "P 21 c a" ],
[29, "P b 21 a", "P b 21 a" ],
[29, "P b c 21", "P b c 21" ],
[29, "P c 21 b", "P c 21 b" ],
[30, "P 2 a n" , "P 2 a n"  ],
[30, "P 2 n a" , "P 2 n a"  ],
[30, "P b 2 n" , "P b 2 n"  ],
[30, "P c n 2" , "P c n 2"  ],
[30, "P n 2 b" , "P n 2 b"  ],
[31, "P 21 m n", "P 21 m n" ],
[31, "P 21 n m", "P 21 n m" ],
[31, "P m 21 n", "P m 21 n" ],
[31, "P n 21 m", "P n 21 m" ],
[31, "P n m 21", "P n m 21" ],
[32, "P 2 c b" , "P 2 c b"  ],
[32, "P b a 2" , "P b a 2"  ],
[32, "P c 2 a" , "P c 2 a"  ],
[33, "P 21 c n", "P 21 c n" ],
[33, "P 21 n b", "P 21 n b" ],
[33, "P b n 21", "P b n 21" ],
[33, "P c 21 n", "P c 21 n" ],
[33, "P n 21 a", "P n 21 a" ],
[34, "P 2 n n" , "P 2 n n"  ],
[34, "P n 2 n" , "P n 2 n"  ],
[34, "P n n 2" , "P n n 2"  ],
[35, "A 2 m m" , "A 2 m m"  ],
[35, "B m 2 m" , "B m 2 m"  ],
[35, "C m m 2" , "C m m 2"  ],
[36, "A 21 a m", "A 21 a m" ],
[36, "A 21 m a", "A 21 m a" ],
[36, "B b 21 m", "B b 21 m" ],
[36, "B m 21 b", "B m 21 b" ],
[36, "C c m 21", "C c m 21" ],
[37, "A 2 a a" , "A 2 a a"  ],
[37, "B b 2 b" , "B b 2 b"  ],
[37, "C c c 2" , "C c c 2"  ],
[38, "A m 2 m" , "A m 2 m"  ],
[38, "B 2 m m" , "B 2 m m"  ],
[38, "B m m 2" , "B m m 2"  ],
[38, "C 2 m m" , "C 2 m m"  ],
[38, "C m 2 m" , "C m 2 m"  ],
[39, "A c 2 m" , "A c 2 m"  ],
[39, "B 2 c m" , "B 2 c m"  ],
[39, "B m a 2" , "B m a 2"  ],
[39, "C 2 m b" , "C 2 m b"  ],
[39, "C m 2 a" , "C m 2 a"  ],
[40, "A m 2 a" , "A m 2 a"  ],
[40, "B 2 m b" , "B 2 m b"  ],
[40, "B b m 2" , "B b m 2"  ],
[40, "C 2 c m" , "C 2 c m"  ],
[40, "C c m 2" , "C c m 2"  ],
[41, "A c 2 a" , "A c 2 a"  ],
[41, "B 2 c b" , "B 2 c b"  ],
[41, "B b a 2" , "B b a 2"  ],
[41, "C 2 c b" , "C 2 c b"  ],
[41, "C c 2 a" , "C c 2 a"  ],
[42, "F 2 m m" , "F 2 m m"  ],
[42, "F m 2 m" , "F m 2 m"  ],
[42, "F m m 2" , "F m m 2"  ],
[43, "F 2 d d" , "F 2 d d"  ],
[43, "F d 2 d" , "F d 2 d"  ],
[43, "F d d 2" , "F d d 2"  ],
[44, "I 2 m m" , "I 2 m m"  ],
[44, "I m 2 m" , "I m 2 m"  ],
[44, "I m m 2" , "I m m 2"  ],
[45, "I 2 c b" , "I 2 c b"  ],
[45, "I b a 2" , "I b a 2"  ],
[45, "I c 2 a" , "I c 2 a"  ],
[46, "I 2 c m" , "I 2 c m"  ],
[46, "I 2 m b" , "I 2 m b"  ],
[46, "I b m 2" , "I b m 2"  ],
[46, "I c 2 m" , "I c 2 m"  ],
[46, "I m 2 a" , "I m 2 a"  ],
[47, "P m m m" , "P m m m"  ],
[48, "P n n n" , "P n n n"  ],
[49, "P b m b" , "P b m b"  ],
[49, "P c c m" , "P c c m"  ],
[49, "P m a a" , "P m a a"  ],
[50, "P b a n" , "P b a n"  ],
[50, "P c n a" , "P c n a"  ],
[50, "P n c b" , "P n c b"  ],
[51, "P b m m" , "P b m m"  ],
[51, "P c m m" , "P c m m"  ],
[51, "P m a m" , "P m a m"  ],
[51, "P m c m" , "P m c m"  ],
[51, "P m m b" , "P m m b"  ],
[52, "P b n n" , "P b n n"  ],
[52, "P c n n" , "P c n n"  ],
[52, "P n a n" , "P n a n"  ],
[52, "P n c n" , "P n c n"  ],
[52, "P n n b" , "P n n b"  ],
[53, "P b m n" , "P b m n"  ],
[53, "P c n m" , "P c n m"  ],
[53, "P m a n" , "P m a n"  ],
[53, "P n c m" , "P n c m"  ],
[53, "P n m b" , "P n m b"  ],
[54, "P b a a" , "P b a a"  ],
[54, "P b a b" , "P b a b"  ],
[54, "P b c b" , "P b c b"  ],
[54, "P c a a" , "P c a a"  ],
[54, "P c c b" , "P c c b"  ],
[55, "P b a m" , "P b a m"  ],
[55, "P c m a" , "P c m a"  ],
[55, "P m c b" , "P m c b"  ],
[56, "P b n a" , "P b n a"  ],
[56, "P b n b" , "P b n b"  ],
[56, "P c c n" , "P c c n"  ],
[56, "P n a a" , "P n a a"  ],
[57, "P b m a" , "P b m a"  ],
[57, "P c a m" , "P c a m"  ],
[57, "P c m b" , "P c m b"  ],
[57, "P m a b" , "P m a b"  ],
[57, "P m c a" , "P m c a"  ],
[58, "P m n n" , "P m n n"  ],
[58, "P n m n" , "P n m n"  ],
[58, "P n n m" , "P n n m"  ],
[59, "P m m n" , "P m m n"  ],
[59, "P m n m" , "P m n m"  ],
[59, "P n m m" , "P n m m"  ],
[60, "P b n a" , "P b n a"  ],
[60, "P c a n" , "P c a n"  ],
[60, "P c n b" , "P c n b"  ],
[60, "P n a b" , "P n a b"  ],
[60, "P n c a" , "P n c a"  ],
[61, "P b c a" , "P b c a"  ],
[61, "P c a b" , "P c a b"  ],
[62, "P b n m" , "P b n m"  ],
[62, "P c m n" , "P c m n"  ],
[62, "P m c n" , "P m c n"  ],
[62, "P m n b" , "P m n b"  ],
[62, "P n a m" , "P n a m"  ],
[63, "A m a m" , "A m a m"  ],
[63, "A m m a" , "A m m a"  ],
[63, "B b m m" , "B b m m"  ],
[63, "B m m b" , "B m m b"  ],
[63, "C c m m" , "C c m m"  ],
[64, "A b m a" , "A b m a"  ],
[64, "A c a m" , "A c a m"  ],
[64, "B b c m" , "B b c m"  ],
[64, "B m a b" , "B m a b"  ],
[64, "C c m b" , "C c m b"  ],
[65, "A m m m" , "A m m m"  ],
[65, "B m m m" , "B m m m"  ],
[65, "C m m m" , "C m m m"  ],
[66, "A m a a" , "A m a a"  ],
[66, "B b m b" , "B b m b"  ],
[66, "C c c m" , "C c c m"  ],
[67, "A b m m" , "A b m m"  ],
[67, "A c m m" , "A c m m"  ],
[67, "B m a m" , "B m a m"  ],
[67, "B m c m" , "B m c m"  ],
[67, "C m m b" , "C m m b"  ],
[68, "A b a a" , "A b a a"  ],
[68, "A c a a" , "A c a a"  ],
[68, "B b a b" , "B b a b"  ],
[68, "B b c b" , "B b c b"  ],
[68, "C c c b" , "C c c b"  ],
[69, "F m m m" , "F m m m"  ],
[70, "F d d d" , "F d d d"  ],
[71, "I m m m" , "I m m m"  ],
[72, "I b a m" , "I b a m"  ],
[72, "I c m a" , "I c m a"  ],
[72, "I m c b" , "I m c b"  ],
[73, "I b c a" , "I b c a"  ],
[73, "I c a b" , "I c a b"  ],
[74, "I b m m" , "I b m m"  ],
[74, "I c m m" , "I c m m"  ],
[74, "I m a m" , "I m a m"  ],
[74, "I m c m" , "I m c m"  ],
[74, "I m m b" , "I m m b"  ],

#[ 75, "P 4",  "C 4" ],
#[ 76, "P 41", "C 41" ],
#[ 77, "P 42", "C 42" ],
#[ 78, "P 43", "C 43" ],
#[ 79, "I 4",  "F 4" ],

[3, "P 1 1 2",  "P 1 1 2" ],
[3, "P 2 1 1",  "P 2 1 1" ],

[4, "P 1 1 21", "P 1 1 21" ],
[4, "P 21 1 1", "P 21 1 1" ],

[5, "A 1 1 2", "A 1 1 2" ],
[5, "A 1 2 1", "A 1 2 1" ],

[5, "B 1 1 2", "B 1 1 2" ],
[5, "B 2 1 1", "B 2 1 1" ],

[5, "I 1 1 2", "I 1 1 2" ],
[5, "I 1 2 1", "I 1 2 1" ],
[5, "I 2 1 1", "I 2 1 1" ],

[6, "P 1 1 m", "P 1 1 m" ],
[6, "P 1 m 1", "P 1 m 1" ],
[6, "P m 1 1", "P m 1 1" ],

[7, "P 1 1 a", "P 1 1 a" ],
[7, "P 1 1 b", "P 1 1 b" ],
[7, "P 1 1 a", "P 1 1 n" ],
[7, "P a",     "P 1 a 1" ],
[7, "P n",     "P 1 n 1" ],
[7, "P b",     "P b 1 1" ],
[7, "P c 1 1", "P c 1 1" ],
[7, "P n 1 1", "P n 1 1" ],

[8, "A 1 1 m", "A 1 1 m" ],
[8, "A m",     "A 1 m 1" ],
[8, "B 1 1 m", "B 1 1 m" ],
[8, "B m 1 1", "B m 1 1" ],

[8, "C m 1 1", "C m 1 1" ],
[8, "I 1 1 m", "I 1 1 m" ],
[8, "I m",     "I 1 m 1" ],
[8, "I m 1 1", "I m 1 1" ],

[9, "A a", "A 1 1 a" ],
[9, "A n", "A 1 n 1" ],
[9, "B n", "B 1 1 n" ],
[9, "B b", "B b 1 1" ],
[9, "C n", "C n 1 1" ],
[9, "I b", "I 1 1 b" ],
[9, "I a", "I 1 a 1" ],
[9, "I c", "I c 1 1" ],

);

1;
