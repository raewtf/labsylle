-- TODO: make paks
-- TODO: make shapes paks
-- TODO: make maths paks
-- TODO: compile 3-syllable dictionary for quik-word
-- TODO: add more bombs
-- TODO: check impostor/bomb bools are true for each pak

packs = {
	{
		name = 'Tutorial',
		id = 'tutorial',
		subtitle = 'Learn how to play!',
		difficulty = 'Very Easy',
		contains_impostors = true,
		contains_bombs = true,
		puzzles = {
			{
				target = {
					{'tu', 'to', 'ri', 'al'}
				},
 				text = 'Welcome to Labsylle — a fun word game\nall about syllables! Swap syllable blocks to find\na target word from amid the shuffle.\nTry constructing a word from these blocks here!'
			},
			{
				target = {
					{'won', 'der', 'ful', 'ly'}
				},
				text = 'Great work! Let\'s try another one. Your aim is to\nperform as few swaps as you can — your count\nis up in the top-right. If you make a mistake,\nyou can "retry puzzle" from the Slide menu.'
			},
			{
				target = {
					{'be', 'wil', 'der', 'ing', 'ly'}
				},
				text = 'Try one more standard puzzle!\nIf you ever wanna take a break, you\ncan "suspend" from the Slide menu, and\ncome back to the puzzle in progress later.'
			},
			{
				target = {
					{'hel', 'lo', '', 'world'}
				},
				text = 'Some puzzles can have empty "space" blocks, to\nindicate breaks between multiple words.\n\nMake sure these go into the correct places as well!'
			},
			{
				target = {
					{'sus', 'pi', 'cious', 'ly', 'ish'}
				},
				impostor = true,
				text = 'There could also be an "impostor" — a syllable\nthat doesn\'t even belong in the word! If\nyou see something that feels out of place, swap\nit into the box at the far-right.'
			},
			{
				target = {
					{'vol', 'a', 'til', 'i', 'ty'}
				},
				bombs = {
					{
						key = 'i',
						swaps = 4,
						intensity = 0
					},
				},
				text = 'Some syllable blocks also have a short temper.\nIf you swap them too many times, then\nthey\'ll KERPLODE!! ...Meaning you\'ll have\nto restart the level over again.'
			},
			{
				target = {
					{'on', 'ward', '', 'and', '', 'up', 'ward'}
				},
				text = 'That\'s the end of this tutorial!\n\nI hope you enjoy this game — as always, I put\na lot of love into it. Have fun!',
				tilevis = {
					width = 50
				}
			},
		}
	}, -- tutorial
	{
		name = 'Animals I',
		id = 'animals',
		subtitle = 'Standard Pak #1',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = true,
		puzzles = {
			{
				target = {
					{'but', 'ter', 'fly'}
				}
			},
			{
				target = {
					{'zoo', 'kee', 'per'}
				}
			},
			{
				target = {
					{'fla', 'min', 'go'}
				}
			},
			{
				target = {
					{'mo', 'ray', '', 'eel'}
				}
			},
			{
				target = {
					{'yel', 'low', 'jack', 'et'}
				}
			},
			{
				target = {
					{'prai', 'rie', '', 'dog'}
				}
			},
			{
				target = {
					{'ar', 'ma', 'dil', 'lo'}
				}
			},
			{
				target = {
					{'rhi', 'noc', 'er', 'os'}
				}
			},
			{
				target = {
					{'a', 'quar', 'i', 'um'}
				}
			},
			{
				target = {
					{'moun', 'tain', '', 'li', 'on'}
				},
				bombs = {
					{
						key = '',
						swaps = 4,
						intensity = 0
					}
				}
			}
		}
	}, -- animals
	{
		name = 'Food & Drink I',
		id = 'food',
		subtitle = 'Standard Pak #2',
		difficulty = 'Easy',
		contains_impostors = true,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'nu', 'tri', 'tion'}
				}
			},
			{
				target = {
					{'u', 'ma', 'mi'}
				}
			},
			{
				target = {
					{'marsh', 'mal', 'low', 'mel'}
				},
				impostor = true
			},
			{
				target = {
					{'brus', 'sels', '', 'sprouts'}
				}
			},
			{
				target = {
					{'in', 'gre', 'di', 'ents'}
				}
			},
			{
				target = {
					{'om', 'ni', 'vore', 'tex'}
				},
				impostor = true
			},
			{
				target = {
					{'ma', 'ple', '', 'syr', 'up'}
				}
			},
			{
				target = {
					{'mac', 'a', 'ro', 'ni', 'roon'}
				},
				impostor = true
			},
			{
				target = {
					{'ap', 'pe', 'tiz', 'ing'}
				}
			},
			{
				target = {
					{'as', 'par', 'a', 'gus'}
				}
			}
		}
	}, -- food
	{
		name = 'Sports!',
		id = 'sports',
		subtitle = 'Standard Pak #3',
		difficulty = 'Easy',
		contains_impostors = true,
		contains_bombs = true,
		puzzles = {
			{
				target = {
					{'bas', 'ket', 'ball'}
				}
			},
			{
				target = {
					{'mar', 'a', 'thon', 'mare'}
				},
				impostor = true
			},
			{
				target = {
					{'phys', 'i', 'cal'}
				}
			},
			{
				target = {
					{'aer', 'o', 'bics'}
				}
			},
			{
				target = {
					{'ice', '', 'hock', 'ey', 'hawk'}
				},
				impostor = true
			},
			{
				target = {
					{'ta', 'ble', '', 'ten', 'nis'}
				},
				bombs = {
					{
						key = 'ble',
						swaps = 3,
						intensity = 1
					}
				}
			},
			{
				target = {
					{'tri', 'ath', 'lon'}
				}
			},
			{
				target = {
					{'fig', 'ure', '', 'skat', 'ing'}
				},
				bombs = {
					{
						key = 'skat',
						swaps = 4,
						intensity = 0
					}
				}
			},
			{
				target = {
					{'com', 'pe', 'ti', 'tion'}
				}
			},
			{
				target = {
					{'gym', 'na', 'si', 'um'}
				}
			}
		}
	}, -- sports
	{
		name = 'Vehicles',
		id = 'vehicles',
		subtitle = 'Standard Pak #4',
		difficulty = 'Easy',
		contains_impostors = true,
		contains_bombs = true,
		puzzles = {
			{
				target = {
					{'pas', 'sen', 'ger', 'ging'}
				},
				impostor = true
			},
			{
				target = {
					{'lim', 'ou', 'sine'}
				}
			},
			{
				target = {
					{'band', 'wag', 'on'}
				}
			},
			{
				target = {
					{'wa', 'ter', 'craft'}
				}
			},
			{
				target = {
					{'sub','ma', 'rine'}
				}
			},
			{
				target = {
					{'u', 'ni', 'cy', 'cle'}
				}
			},
			{
				target = {
					{'space', '', 'shut', 'tle'}
				}
			},
			{
				target = {
					{'au', 'to', 'mo', 'bile'}
				}
			},
			{
				target = {
					{'pub', 'lic', '', 'tran', 'sit'}
				}
			},
			{
				target = {
					{'trans', 'por', 'ta', 'tion'}
				},
				bombs = {
					{
						key = 'por',
						swaps = 3,
						intensity = 1
					}
				}
			}
		}
	}, -- vehicles
	{
		name = 'Musical I',
		id = 'musical',
		subtitle = 'Standard Pak #5',
		difficulty = 'Easy',
		contains_impostors = true,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'cla', 'ri', 'net'}
				}
			},
			{
				target = {
					{'clas', 'si', 'cal'}
				}
			},
			{
				target = {
					{'man', 'do', 'lin'}
				}
			},
			{
				target = {
					{'ac', 'cor', 'di', 'on', 'ing'}
				},
				impostor = true
			},
			{
				target = {
					{'har', 'mon', 'i', 'ca'}
				}
			},
			{
				target = {
					{'tam', 'bou', 'rine'}
				}
			},
			{
				target = {
					{'u', 'ku', 'le', 'le', 'lay'}
				},
				impostor = true
			},
			{
				target = {
					{'hur', 'dy-', 'gur', 'dy'}
				}
			},
			{
				target = {
					{'al', 'ter', 'na', 'tive', 'ing'}
				},
				impostor = true
			},
			{
				target = {
					{'syn', 'the', 'siz', 'er'}
				}
			}
		}
	}, -- musica;
	{
		name = 'Chemistry',
		id = 'chemistry',
		subtitle = 'Standard Pak #6',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = true,
		puzzles = {
			{
				target = {
					{'a', 'tom', 'ic'}
				}
			},
			{
				target = {
					{'en', 'er', 'gy'}
				}
			},
			{
				target = {
					{'al', 'ka', 'line'}
				}
			},
			{
				target = {
					{'ki', 'net', 'ic'}
				},
				bombs = {
					{
						key = 'net',
						swaps = 3,
						intensity = 1
					}
				}
			},
			{
				target = {
					{'or', 'gan', 'ic'}
				}
			},
			{
				target = {
					{'mo', 'lec', 'u', 'lar'}
				}
			},
			{
				target = {
					{'com', 'bus', 'tion'}
				}
			},
			{
				target = {
					{'ox', 'i', 'da', 'tion'}
				}
			},
			{
				target = {
					{'e', 'lec', 'tric', 'i', 'ty'}
				},
				bombs = {
					{
						key = 'i',
						swaps = 3,
						intensity = 1
					}
				}
			},
			{
				target = {
					{'ab', 'so', 'lute', '', 'ze', 'ro'}
				}
			}
		}
	}, -- chemistry
	{
		name = 'Place Names',
		id = 'places',
		subtitle = 'Standard Pak #7',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'to', 'ron', 'to'}
				}
			},
			{
				target = {
					{'in', 'di', 'a'}
				}
			},
			{
				target = {
					{'to', 'ky', 'o'}
				}
			},
			{
				target = {
					{'is', 'tan', 'bul'}
				}
			},
			{
				target = {
					{'ma', 'lay', 'sia'}
				}
			},
			{
				target = {
					{'bue', 'nos', '', 'ai', 'res'}
				}
			},
			{
				target = {
					{'lux', 'em', 'bourg'}
				}
			},
			{
				target = {
					{'new', '', 'york', '', 'ci', 'ty'}
				},
				tilevis = {
					width = 45
				}
			},
			{
				target = {
					{'al', 'bu', 'quer', 'que'}
				}
			},
			{
				target = {
					{'mas', 'sa', 'chu', 'setts'}
				}
			}
		}
	}, -- places
	{
		name = 'School Supplies',
		id = 'supplies',
		subtitle = 'Standard Pak #8',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'e', 'ras', 'er'}
				}
			},
			{
				target = {
					{'pa', 'per', 'clips'}
				}
			},
			{
				target = {
					{'high', 'light', 'ers'}
				}
			},
			{
				target = {
					{'pro', 'trac', 'tor'}
				}
			},
			{
				target = {
					{'pen', 'cil', '', 'pouch'}
				}
			},
			{
				target = {
					{'stick', 'y', '', 'notes'}
				}
			},
			{
				target = {
					{'spi', 'ral', '', 'note', 'book'}
				}
			},
			{
				target = {
					{'safe', 'ty', '', 'scis', 'sors'}
				}
			},
			{
				target = {
					{'col', 'ored', '', 'pen', 'cils'}
				}
			},
			{
				target = {
					{'con', 'struc', 'tion', '', 'pa', 'per'}
				}
			}
		}
	}, -- supplies
	{
		name = 'TBD',
		id = 'tbd',
		subtitle = 'Standard Pak #9',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}, -- tbd
	{
		name = 'Fun & Games',
		id = 'games',
		subtitle = 'Standard Pak #10',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'rec', 're', 'a', 'tion'}
				}
			},
			{
				target = {
					{'ta', 'ble', 'top'}
				}
			},
			{
				target = {
					{'tour', 'na', 'ment'}
				}
			},
			{
				target = {
					{'con', 'trol', 'ler'}
				}
			},
			{
				target = {
					{'wa', 'ger', 'ing'}
				}
			},
			{
				target = {
					{'mul', 'ti', 'play', 'er'}
				}
			},
			{
				target = {
					{'check', 'er', 'board'}
				}
			},
			{
				target = {
					{'pen-', 'and-', 'pa', 'per'}
				}
			},
			{
				target = {
					{'en', 'ter', 'tain', 'ment'}
				}
			},
			{
				target = {
					{'jig', 'saw', '', 'puz', 'zle'}
				}
			}
		}
	}, -- games
	{
		name = 'Weather Events',
		id = 'weather',
		subtitle = 'Standard Pak #11',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'thun', 'der', 'storm'}
				}
			},
			{
				target = {
					{'hur', 'ri', 'cane'}
				}
			},
			{
				target = {
					{'strat', 'o', 'sphere'}
				}
			},
			{
				target = {
					{'tur', 'bu', 'lence'}
				}
			},
			{
				target = {
					{'tsu', 'na', 'mi'}
				}
			},
			{
				target = {
					{'tem', 'per', 'a', 'ture'}
				}
			},
			{
				target = {
					{'ad', 'vi', 'so', 'ry'}
				}
			},
			{
				target = {
					{'con', 'den', 'sa', 'tion'}
				}
			},
			{
				target = {
					{'hu', 'mid', 'i', 'ty'}
				}
			},
			{
				target = {
					{'con', 'vec', 'tion'}
				}
			},
			{
				target = {
					{'ba', 'rom', 'e', 'ter'}
				}
			},
			{
				target = {
					{'vis', 'i', 'bil', 'i', 'ty'}
				}
			},
			{
				target = {
					{'trop', 'i', 'cal', '', 'storm'}
				}
			},
			{
				target = {
					{'ther', 'mo', 'dy', 'nam', 'ics'}
				},
				tilevis = {
					width = 45
				}
			},
			{
				target = {
					{'pre', 'cip', 'i', 'ta', 'tion'}
				}
			}
		}
	}, -- weather
	{
		name = 'Shapes!',
		id = 'shapes',
		subtitle = 'Standard Pak #12',
		difficulty = 'Tricksy',
		contains_impostors = true,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'tri', 'an', 'gle'}
				}
			},
			{
				target = {
					{'ge', 'om', 'e', 'try'}
				}
			},
			{
				target = {
					{'an', 'gu', 'lar'}
				}
			},
			{
				target = {
					{'rec', 'tan', 'gle'}
				}
			},
			{
				target = {
					{'non', 'a', 'gon'}
				}
			},
			{
				target = {
					{'to', 'pog', 'ra', 'phy'}
				}
			},
			{
				target = {
					{'ap', 'pear', 'ance'}
				}
			},
			{
				target = {
					{'hex', 'ag', 'o', 'nal'}
				}
			},
			{
				target = {
					{'pris', 'mat', 'ic', 'tism'}
				},
				impostor = true
			},
			{
				target = {
					{'sym', 'met', 'ri', 'cal'}
				}
			},
			{
				target = {
					{'e', 'qui', 'lat', 'er', 'al', 'lit'}
				},
				impostor = true
			},
			{
				target = {
					{'per', 'spec', 'tive'}
				}
			},
			{
				target = {
					{'quad', 'ri', 'lat', 'er', 'al'}
				}
			},
			{
				target = {
					{'par', 'al', 'lel', 'o', 'gram', 'la'}
				},
				impostor = true
			},
			{
				target = {
					{'cy', 'lin', 'dri', 'cal'}
				}
			}
		}
	}, -- shapes
	{
		name = 'Animals II',
		id = 'animals2',
		subtitle = 'Standard Pak #13',
		difficulty = 'Tricksy',
		contains_impostors = true,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				},
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- dragonfly(ing)
		-- ornithologist
		-- antelope (can)
		-- komodo dragon (ite)
		-- later alligator (width 45)
		-- labrador retriever (width 45, parallax 15)
		-- hippopotamus
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}, -- animals2
	{
		name = 'Automotive',
		id = 'cars',
		subtitle = 'Standard Pak #14',
		difficulty = 'Tricksy',
		contains_impostors = true,
		contains_bombs = true,
		puzzles = {
			{
				target = {
					{'ig', 'ni', 'tion'}
				}
			},
			{
				target = {
					{'un', 'lead', 'ed'}
				}
			},
			{
				target = {
					{'turn', '', 'sig', 'nal'}
				}
			},
			{
				target = {
					{'com', 'pres', 'sion'}
				}
			},
			{
				target = {
					{'horse', 'pow', 'er'}
				}
			},
			{
				target = {
					{'gas', 'o', 'line'}
				},
				bombs = {
					{
						key = 'o',
						swaps = 3,
						intensity = 1
					},
				}
			},
			{
				target = {
					{'au', 'to', 'mat', 'ic'}
				}
			},
			{
				target = {
					{'trans', 'mis', 'sion'}
				}
			},
			{
				target = {
					{'speed', 'om', 'e', 'ter'}
				}
			},
			{
				target = {
					{'sus', 'pen', 'sion', 'ful'}
				},
				impostor = true
			},
			{
				target = {
					{'al', 'ter', 'na', 'tor'}
				}
			},
			{
				target = {
					{'car', 'bu', 're', 'tor'}
				}
			},
			{
				target = {
					{'hy', 'dro', 'plan', 'ing'}
				},
				bombs = {
					{
						key = 'ing',
						swaps = 3,
						intensity = 1
					},
				}
			},
			{
				target = {
					{'glove', '', 'com', 'part', 'ment', 'a'}
				},
				impostor = true
			},
			{
				target = {
					{'ac', 'cel', 'er', 'a', 'tor'}
				}
			}
		}
	}, -- automotive
	{
		name = 'Outer Space',
		id = 'space',
		subtitle = 'Standard Pak #15',
		difficulty = 'Tricksy',
		contains_impostors = true,
		contains_bombs = true,
		puzzles = {
			{
				target = {
					{'sat', 'el', 'lite'}
				}
			},
			{
				target = {
					{'re', 'splend', 'ent'}
				}
			},
			{
				target = {
					{'as', 'tro', 'naut', 'turf'}
				},
				impostor = true
			},
			{
				target = {
					{'plan', 'e', 'tar', 'y'}
				}
			},
			{
				target = {
					{'me', 'te', 'or', 'ite'}
				},
				bombs = {
					{
						key = 'te',
						swaps = 4,
						intensity = 0
					},
				}
			},
			{
				target = {
					{'as', 'tron', 'o', 'my'}
				}
			},
			{
				target = {
					{'in', 'ter', 'stel', 'lar', 'ou'}
				},
				impostor = true
			},
			{
				target = {
					{'neu', 'tri', 'no'}
				}
			},
			{
				target = {
					{'ob', 'serv', 'a', 'to', 'ry'}
				}
			},
			{
				target = {
					{'gam', 'ma-', 'ray', '', 'burst'}
				}
			},
			{
				target = {
					{'grav', 'i', 'ta', 'tion', 'al'}
				}
			},
			{
				target = {
					{'lu', 'mi', 'nos', 'i', 'ty'}
				}
			},
			{
				target = {
					{'es', 'cape', '', 've', 'loc', 'i', 'ty'}
				},
				bombs = {
					{
						key = 've',
						swaps = 5,
						intensity = 0
					},
				},
				tilevis = {
					width = 45
				}
			},
			{
				target = {
					{'rel', 'ic', '', 'ra', 'di', 'a', 'tion'}
				},
				tilevis = {
					width = 45
				}
			},
			{
				target = {
					{'milk', 'y', '', 'way', '', 'gal', 'ax', 'y'}
				},
				tilevis = {
					width = 45
				}
			}
		}
	}, -- space
	{
		name = 'Wordplay',
		id = 'wordplay',
		subtitle = 'Standard Pak #16',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = true,
		puzzles = {
			{
				target = {
					{'ad', 'jec', 'tive'}
				}
			},
			{
				target = {
					{'di', 'a', 'lect'}
				}
			},
			{
				target = {
					{'syn', 'o', 'nym'}
				}
			},
			{
				target = {
					{'pal', 'in', 'drome'}
				}
			},
			{
				target = {
					{'pho', 'net', 'ics'}
				},
				bombs = {
					{
						key = 'net',
						swaps = 3,
						intensity = 1
					},
				},
			},
			{
				target = {
					{'vo', 'cab', 'u', 'lar', 'y'}
				}
			},
			{
				target = {
					{'def', 'i', 'ni', 'tion'}
				}
			},
			{
				target = {
					{'bi', 'lin', 'gual'}
				}
			},
			{
				target = {
					{'se', 'man', 'tics'}
				}
			},
			{
				target = {
					{'ver', 'nac', 'u', 'lar'}
				}
			},
			{
				target = {
					{'no', 'men', 'cla', 'ture'}
				}
			},
			{
				target = {
					{'pro', 'nun', 'ci', 'a', 'tion'}
				},
				bombs = {
					{
						key = 'nun',
						swaps = 4,
						intensity = 0
					},
				}
			},
			{
				target = {
					{'pol', 'y', 'syl', 'lab', 'ic'}
				}
			},
			{
				target = {
					{'com', 'mu', 'ni', 'ca', 'tion'}
				}
			},
			{
				target = {
					{'lex', 'i', 'cog', 'ra', 'phy'}
				}
			}
		}
	}, -- wordplay
	{
		name = 'Food & Drink II',
		id = 'food2',
		subtitle = 'Standard Pak #17',
		difficulty = 'Tricksy',
		contains_impostors = true,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'bev', 'er', 'age'}
				}
			},
			{
				target = {
					{'sus', 'te', 'nance'}
				}
			},
			{
				target = {
					{'pome', 'gran', 'ate'}
				}
			},
			{
				target = {
					{'tap', 'i', 'o', 'ca'}
				}
			},
			{
				target = {
					{'gin', 'ger', 'bread', '', 'man'}
				}
			},
			{
				target = {
					{'pum', 'per', 'nick', 'el'}
				}
			},
			{
				target = {
					{'meat', '', 'and', '', 'po', 'ta', 'toes'}
				},
				tilevis = {
					width = 45
				}
			},
			{
				target = {
					{'veg', 'e', 'tar', 'i', 'an'}
				}
			},
			{
				target = {
					{'cay', 'enne', '', 'pep', 'per', 'est'}
				},
				impostor = true,
				tilevis = {
					width = 45
				}
			},
			{
				target = {
					{'pres', 'er', 'va', 'tion'}
				}
			},
			{
				target = {
					{'co', 'mes', 'ti', 'ble', 'bule'}
				},
				impostor = true
			},
			{
				target = {
					{'sour', 'dough', '', 'start', 'er'}
				}
			},
			{
				target = {
					{'ag', 'ri', 'cul', 'tur', 'al'}
				}
			},
			{
				target = {
					{'con', 'fec', 'tion', 'er', 'y'}
				}
			},
			{
				target = {
					{'car', 'bo', 'hy', 'drate', 'load'}
				},
				impostor = true
			}
		}
	}, -- food2
	{
		name = 'Wonders of the World',
		id = 'worldwonders',
		subtitle = 'Standard Pak #18',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- catacombs
		-- grand canyon
		-- colosseum
		-- taj mahal
		-- machu picchu
		-- eiffel tower
		-- mount everest
		-- hagia sophia
		-- panama canal
		-- niagara falls
		-- aurora borealis
		-- great wall of china
		-- leaning tower of pisa (zza)
		-- great pyramid of giza
		-- TBD
	}, -- worldwonders
	{
		name = 'Television',
		id = 'television',
		subtitle = 'Standard Pak #19',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'re', 'cord', 'ing'}
				}
			},
			{
				target = {
					{'broad', 'cast', 'ing'}
				}
			},
			{
				target = {
					{'fre', 'quen', 'cy'}
				}
			},
			{
				target = {
					{'sat', 'el', 'lite'}
				}
			},
			{
				target = {
					{'pay-', 'per-', 'view'}
				}
			},
			{
				target = {
					{'se', 'ri', 'al'}
				}
			},
			{
				target = {
					{'on-', 'de', 'mand'}
				}
			},
			{
				target = {
					{'ep', 'i', 'sod', 'ic'}
				}
			},
			{
				target = {
					{'ad', 'ver', 'tise', 'ment'}
				}
			},
			{
				target = {
					{'in', 'ter', 'fer', 'ence'}
				}
			},
			{
				target = {
					{'tel', 'e', 'promp', 'ter'}
				}
			},
			{
				target = {
					{'syn', 'di', 'ca', 'tion'}
				}
			},
			{
				target = {
					{'cath', 'ode', '', 'ray', '', 'tube'}
				},
				tilevis = {
					width = 45
				}
			},
			{
				target = {
					{'vid', 'e', 'og', 'ra', 'pher'}
				}
			},
			{
				target = {
					{'high', '', 'def', 'i', 'ni', 'tion'}
				}
			}
		}
	}, -- television
	{
		name = 'Musical II',
		id = 'musical2',
		subtitle = 'Standard Pak #20',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}, --musical2
	{
		name = 'Technology',
		id = 'tech',
		subtitle = 'Standard Pak #21',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'proc', 'es', 'sor'}
				}
			},
			{
				target = {
					{'net', 'work', 'ing'}
				}
			},
			{
				target = {
					{'de', 'vel', 'op', 'er'}
				}
			},
			{
				target = {
					{'in', 'dus', 'try'}
				}
			},
			{
				target = {
					{'au', 'tom', 'a', 'ton'}
				}
			},
			{
				target = {
					{'in', 'no', 'va', 'tion'}
				}
			},
			{
				target = {
					{'e', 'lec', 'tron', 'ics'}
				}
			},
			{
				target = {
					{'en', 'cryp', 'tion'}
				}
			},
			{
				target = {
					{'o', 'ver', 'clock', 'ing'}
				}
			},
			{
				target = {
					{'te', 'lem', 'e', 'try'}
				}
			},
			{
				target = {
					{'ar', 'ti', 'fi', 'cial'}
				}
			},
			{
				target = {
					{'en', 'gi', 'neer', 'ing', 'near'}
				},
				impostor = true
			},
			{
				target = {
					{'neu', 'ral', '', 'net', 'work'}
				}
			},
			{
				target = {
					{'stand', 'ard', 'i', 'za', 'tion'}
				}
			},
			{
				-- manufacturing
				target = {
					{'man', 'u', 'fac', 'tur', 'ing'}
				}
			},
			{
				-- computational
				target = {
					{'com', 'pu', 'ta', 'tion', 'al'}
				}
			},
			{
				-- accelerometer
				target = {
					{'ac', 'cel', 'er', 'om', 'e', 'ter'}
				},
				tilevis = {
					width = 45
				}
			},
			{
				-- optimization
				target = {
					{'op', 'ti', 'mi', 'za', 'tion'}
				}
			},
			{
				-- operating system
				target = {
					{'op', 'er', 'at', 'ing', '', 'sys', 'tem'}
				},
				tilevis = {
					width = 40
				}
			},
			{
				-- electromagnetism
				target = {
					{'e', 'lec', 'tro', 'mag', 'net', 'ism'}
				},
				tilevis = {
					width = 45
				}
			}
		}
	}, -- tech
	{
		name = 'Prehistoric',
		id = 'prehistoric',
		subtitle = 'Standard Pak #22',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- museum
		-- jurassic
		-- herbivore
		-- egg-laying
		-- triceratops
		-- megalodon
		-- tyrannosaurus
		-- velociraptor
		-- paleontologist
		-- pachycephalosaurus
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}, -- prehistoric
	{
		name = 'A Series of Tubes',
		id = 'internet',
		subtitle = 'Standard Pak #23',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- world wide web
		-- wireless
		-- firewall
		-- cyberspace
		-- compression
		-- search engine (eer)
		-- IP address
		-- executable
		-- information
		-- applications
		-- influencer
		-- superhighway
		-- dial-up modem (del)
		-- social networking
		-- QWERTY (individual letters?!)
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}, -- internet
	{
		name = 'Photography',
		id = 'photography',
		subtitle = 'Standard Pak #24',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}, -- photography
	{
		name = 'TBD',
		id = 'tbd',
		subtitle = 'Standard Pak #25',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}, -- tbd
	{
		name = 'Periodic Elements',
		id = 'elements',
		subtitle = 'Standard Pak #26',
		difficulty = 'Very Tough',
		contains_impostors = true,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'so', 'di', 'um'}
				}
			},
			{
				target = {
					{'lith', 'i', 'um'}
				}
			},
			{
				target = {
					{'he', 'li', 'um'}
				}
			},
			{
				target = {
					{'chem', 'is', 'try'}
				}
			},
			{
				target = {
					{'mer', 'cu', 'ry'}
				}
			},
			{
				target = {
					{'ox', 'y', 'gen'}
				}
			},
			{
				target = {
					{'hy', 'dro', 'gen'}
				}
			},
			{
				target = {
					{'plat', 'i', 'num'}
				}
			},
			{
				target = {
					{'chro', 'mi', 'um'}
				}
			},
			{
				target = {
					{'u', 'ra', 'ni', 'um'}
				}
			},
			{
				target = {
					{'po', 'tas', 'si', 'um'}
				}
			},
			{
				target = {
					{'ar', 'se', 'nic'}
				}
			},
			{
				target = {
					{'non', 'met', 'al', 'lic'}
				}
			},
			{
				target = {
					{'phos', 'pho', 'rus'}
				}
			},
			{
				target = {
					{'man', 'ga', 'nese'}
				}
			},
			{
				target = {
					{'plu', 'to', 'ni', 'um'}
				}
			},
			{
				target = {
					{'yt', 'tri', 'um', 'a'}
				},
				impostor = true
			},
			{
				target = {
					{'ger', 'ma', 'ni', 'um'}
				}
			},
			{
				target = {
					{'clas', 'si', 'fi', 'ca', 'tion'}
				}
			},
			{
				target = {
					{'ne', 'o', 'dym', 'i', 'um'}
				}
			}
		}
	}, -- elements
	{
		name = 'Bones',
		id = 'bones',
		subtitle = 'Standard Pak #27',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}, -- bones
	{
		name = 'Scientific Names',
		id = 'latinnames',
		subtitle = 'Standard Pak #28',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}, -- latinnames
	{
		name = 'TBD',
		id = 'tbd',
		subtitle = 'Standard Pak #29',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}, -- tbd
	{
		name = 'TBD',
		id = 'tbd',
		subtitle = 'Standard Pak #30',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	} -- tbd
}

bonus = {
	{
		name = 'Simple Shapes',
		id = 'shapes_simple',
		subtitle = 'Shapes Pak #1',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'none circ0', 'circ0 squa0', 'squa0 circ0', 'circ0 none'}
				},
				text = 'Welcome to the Shapes Paks!\nHere, you need to assemble the blocks such\nthat the shapes make a continuous chain.\nTry it out with this simple puzzle!'
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- none circ0, circ0 squa0, squa0 circ0, circ0 none — explain how shapes pak works
		-- none tria0, tria0 rect0, rect0 circ0, circ0 none
		-- none circ0, circ0 rect0, rect0 squa0, squa0 tria0, tria0 none
		-- none rect0, rect0 circ0, circ0 squa0, squa0 none0, (circ0 none) — explain how impostors work again just in case
		-- none squa0, squa0 tria0, tria0 circ0, circ0 circ0, circ0 rect0, rect0 none
	},
	{
		name = 'Spicing up the Shapes',
		id = 'shapes_spice',
		subtitle = 'Shapes Pak #2',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'More Shapes!',
		id = 'shapes_more',
		subtitle = 'Shapes Pak #3',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Polygons Only',
		id = 'shapes_polygons',
		subtitle = 'Shapes Pak #4',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Introduction to "Colors"',
		id = 'shapes_colors',
		subtitle = 'Shapes Pak #5',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Even More "Colors"!',
		id = 'shapes_morecolors',
		subtitle = 'Shapes Pak #6',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Shapes Aplenty',
		id = 'shapes_aplenty',
		subtitle = 'Shapes Pak #7',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Wraparound',
		id = 'shapes_wrap',
		subtitle = 'Shapes Pak #8',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Mind the Gap',
		id = 'shapes_gap',
		subtitle = 'Shapes Pak #9',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'All Together Now!',
		id = 'shapes_all',
		subtitle = 'Shapes Pak #10',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Basic Addition',
		id = 'math_add',
		subtitle = 'Math Pak #1',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{'1', '+', '1', '=', '2'}
				},
				text = 'Welcome to the Math Paks!\nYour goal is to assemble the blocks to\ncreate a logical, correct equation.\nTry this easy one first!',
				tilevis = {
					font = 'doubledisco'
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Basic Subtraction',
		id = 'math_subtract',
		subtitle = 'Math Pak #2',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Basic Multiplication',
		id = 'math_multiply',
		subtitle = 'Math Pak #3',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Basic Division',
		id = 'math_divide',
		subtitle = 'Math Pak #4',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Decimal Addition',
		id = 'math_decimaladd',
		subtitle = 'Math Pak #5',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Fractional Division',
		id = 'math_fractiondivide',
		subtitle = 'Math Pak #6',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = '',
		id = '',
		subtitle = 'Math Pak #7',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = '',
		id = '',
		subtitle = 'Math Pak #8',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Algebraic',
		id = 'math_algebra',
		subtitle = 'Math Pak #9',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Polynomials',
		id = 'math_polynomials',
		subtitle = 'Math Pak #10',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			},
			{
				target = {
					{''}
				}
			}
		}
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	}
}

quikwords = {
	{'add', 'some', 'words!'}
}

return packs, bonus, quikwords