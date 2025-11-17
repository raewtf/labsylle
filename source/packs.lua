-- TODO: make standard paks
-- TODO: make tricky paks a bit tougher
-- TODO: move periodic elements to tricky
-- TODO: remove tbds

-- TODO: make shapes paks

-- TODO: make maths paks


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
	}, -- musical
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
					{'to', 'ky', 'o'},
					{'ky', 'o', 'to'}
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
		id = 'tbd',
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
		id = 'tbd',
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
		id = 'tbd',
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
		contains_impostors = true,
		contains_bombs = true,
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
				},
				bombs = {
					{
						key = 'vel',
						swaps = 4,
						intensity = 1
					},
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
				},
				bombs = {
					{
						key = 'net',
						swaps = 4,
						intensity = 0
					},
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
		id = 'tbd',
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
		id = 'tbd',
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
		id = 'tbd',
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
		id = 'tbd',
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
		id = 'tbd',
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
	{'in', 'for', 'ma', 'tion'},
	{'a', 'vail', 'a', 'ble'},
	{'de', 'vel', 'op', 'ment'},
	{'ed', 'u', 'ca', 'tion'},
	{'com', 'mu', 'ni', 'ty'},
	{'tech', 'nol', 'o', 'gy'},
	{'se', 'cu', 'ri', 'ty'},
	{'di', 'rec', 'to', 'ry'},
	{'cat', 'e', 'go', 'ry'},
	{'ap', 'pli', 'ca', 'tion'},
	{'ex', 'pe', 'ri', 'ence'},
	{'ad', 'di', 'tion', 'al'},
	{'a', 'nal', 'y', 'sis'},
	{'pro', 'fes', 'sion', 'al'},
	{'de', 'liv', 'er', 'y'},
	{'o', 'rig', 'i', 'nal'},
	{'en', 'ter', 'tain', 'ment'},
	{'so', 'ci', 'e', 'ty'},
	{'e', 'lec', 'tron', 'ics'},
	{'en', 'vi', 'ron', 'ment'},
	{'ma', 'te', 'ri', 'al'},
	{'u', 'su', 'al', 'ly'},
	{'e', 'co', 'nom', 'ic'},
	{'ad', 'ver', 'tis', 'ing'},
	{'en', 'gi', 'neer', 'ing'},
	{'ma', 'te', 'ri', 'als'},
	{'po', 'lit', 'i', 'cal'},
	{'ac', 'tiv', 'i', 'ty'},
	{'e', 'lec', 'tron', 'ic'},
	{'cor', 'po', 'ra', 'tion'},
	{'ex', 'ec', 'u', 'tive'},
	{'nec', 'es', 'sar', 'y'},
	{'par', 'tic', 'u', 'lar'},
	{'ap', 'pro', 'pri', 'ate'},
	{'ac', 'tu', 'al', 'ly'},
	{'reg', 'is', 'tra', 'tion'},
	{'dis', 'tri', 'bu', 'tion'},
	{'in', 'dus', 'tri', 'al'},
	{'re', 'spon', 'si', 'ble'},
	{'in', 'de', 'pend', 'ent'},
	{'pop', 'u', 'la', 'tion'},
	{'nav', 'i', 'ga', 'tion'},
	{'in', 'tro', 'duc', 'tion'},
	{'es', 'pe', 'cial', 'ly'},
	{'op', 'er', 'a', 'tion'},
	{'sig', 'nif', 'i', 'cant'},
	{'au', 'thor', 'i', 'ty'},
	{'al', 'ter', 'na', 'tive'},
	{'res', 'o', 'lu', 'tion'},
	{'pub', 'li', 'ca', 'tion'},
	{'pho', 'tog', 'ra', 'phy'},
	{'ac', 'a', 'dem', 'ic'},
	{'trans', 'por', 'ta', 'tion'},
	{'a', 'bil', 'i', 'ty'},
	{'tel', 'e', 'vi', 'sion'},
	{'in', 'ter', 'est', 'ed'},
	{'va', 'ri', 'e', 'ty'},
	{'un', 'der', 'stand', 'ing'},
	{'ca', 'pac', 'i', 'ty'},
	{'re', 'la', 'tion', 'ship'},
	{'tra', 'di', 'tion', 'al'},
	{'in', 'ter', 'est', 'ing'},
	{'lit', 'er', 'a', 'ture'},
	{'e', 'con', 'o', 'my'},
	{'def', 'i', 'ni', 'tion'},
	{'sec', 're', 'tar', 'y'},
	{'in', 'stal', 'la', 'tion'},
	{'fa', 'cil', 'i', 'ty'},
	{'cer', 'tif', 'i', 'cate'},
	{'au', 'to', 'mo', 'tive'},
	{'sit', 'u', 'a', 'tion'},
	{'e', 'mer', 'gen', 'cy'},
	{'de', 'vel', 'op', 'ing'},
	{'tem', 'per', 'a', 'ture'},
	{'his', 'tor', 'i', 'cal'},
	{'sci', 'en', 'tif', 'ic'},
	{'ar', 'chi', 'tec', 'ture'},
	{'dic', 'tion', 'ar', 'y'},
	{'gen', 'er', 'al', 'ly'},
	{'gen', 'er', 'a', 'tion'},
	{'com', 'pe', 'ti', 'tion'},
	{'gen', 'er', 'at', 'ed'},
	{'af', 'fil', 'i', 'ate'},
	{'des', 'ig', 'nat', 'ed'},
	{'re', 'cov', 'er', 'y'},
	{'in', 'te', 'grat', 'ed'},
	{'com', 'pre', 'hen', 'sive'},
	{'u', 'ni', 'ver', 'sal'},
	{'pres', 'en', 'ta', 'tion'},
	{'in', 'ter', 'ac', 'tive'},
	{'de', 'vel', 'op', 'er'},
	{'i', 'den', 'ti', 'fy'},
	{'com', 'par', 'i', 'son'},
	{'var', 'i', 'a', 'ble'},
	{'ad', 'ver', 'tise', 'ment'},
	{'e', 'lec', 'tri', 'cal'},
	{'ap', 'pli', 'ca', 'ble'},
	{'ded', 'i', 'cat', 'ed'},
	{'i', 'den', 'ti', 'fied'},
	{'pri', 'or', 'i', 'ty'},
	{'es', 'ti', 'mat', 'ed'},
	{'a', 'non', 'y', 'mous'},
	{'in', 'te', 'gra', 'tion'},
	{'cri', 'te', 'ri', 'a'},
	{'as', 'so', 'ci', 'ate'},
	{'el', 'i', 'gi', 'ble'},
	{'re', 'al', 'i', 'ty'},
	{'des', 'ti', 'na', 'tion'},
	{'in', 'tel', 'li', 'gence'},
	{'res', 'i', 'den', 'tial'},
	{'e', 'co', 'nom', 'ics'},
	{'com', 'pat', 'i', 'ble'},
	{'rec', 're', 'a', 'tion'},
	{'leg', 'is', 'la', 'tion'},
	{'ac', 'cu', 'ra', 'cy'},
	{'a', 'cad', 'e', 'my'},
	{'ag', 'ri', 'cul', 'ture'},
	{'port', 'fo', 'li', 'o'},
	{'in', 'fra', 'struc', 'ture'},
	{'phi', 'los', 'o', 'phy'},
	{'reg', 'u', 'la', 'tion'},
	{'sec', 'ond', 'ar', 'y'},
	{'au', 'to', 'mat', 'ic'},
	{'ma', 'jor', 'i', 'ty'},
	{'u', 'til', 'i', 'ty'},
	{'com', 'bi', 'na', 'tion'},
	{'dis', 'trib', 'ut', 'ed'},
	{'in', 'te', 'ri', 'or'},
	{'i', 'den', 'ti', 'ty'},
	{'rea', 'son', 'a', 'ble'},
	{'ev', 'o', 'lu', 'tion'},
	{'op', 'er', 'a', 'tor'},
	{'con', 'tin', 'u', 'ing'},
	{'com', 'pet', 'i', 'tive'},
	{'prep', 'a', 'ra', 'tion'},
	{'an', 'no', 'ta', 'tion'},
	{'math', 'e', 'mat', 'ics'},
	{'com', 'pen', 'sa', 'tion'},
	{'im', 'me', 'di', 'ate'},
	{'par', 'tic', 'i', 'pate'},
	{'ex', 'pe', 'ri', 'enced'},
	{'in', 'sti', 'tu', 'tion'},
	{'e', 'quiv', 'a', 'lent'},
	{'ad', 'vi', 'so', 'ry'},
	{'cur', 'ric', 'u', 'lum'},
	{'psy', 'chol', 'o', 'gy'},
	{'un', 'lim', 'it', 'ed'},
	{'ce', 'leb', 'ri', 'ty'},
	{'bi', 'ol', 'o', 'gy'},
	{'bi', 'og', 'ra', 'phy'},
	{'ef', 'fi', 'cien', 'cy'},
	{'dis', 'cov', 'er', 'y'},
	{'in', 'ven', 'to', 'ry'},
	{'in', 'di', 'cat', 'ed'},
	{'dem', 'o', 'crat', 'ic'},
	{'pa', 'ram', 'e', 'ter'},
	{'rec', 'og', 'ni', 'tion'},
	{'ter', 'ri', 'to', 'ry'},
	{'con', 'tin', 'u', 'ous'},
	{'ex', 'e', 'cu', 'tion'},
	{'af', 'ford', 'a', 'ble'},
	{'res', 'er', 'va', 'tion'},
	{'ab', 'so', 'lute', 'ly'},
	{'cal', 'cu', 'la', 'tor'},
	{'tem', 'po', 'rar', 'y'},
	{'con', 'tri', 'bu', 'tion'},
	{'con', 'sti', 'tu', 'tion'},
	{'re', 'li', 'a', 'ble'},
	{'con', 'sul', 'ta', 'tion'},
	{'de', 'moc', 'ra', 'cy'},
	{'me', 'mo', 'ri', 'al'},
	{'spir', 'it', 'u', 'al'},
	{'sat', 'is', 'fac', 'tion'},
	{'su', 'pe', 'ri', 'or'},
	{'com', 'fort', 'a', 'ble'},
	{'in', 'ter', 'ac', 'tion'},
	{'ef', 'fec', 'tive', 'ly'},
	{'rev', 'o', 'lu', 'tion'},
	{'me', 'chan', 'i', 'cal'},
	{'ac', 'qui', 'si', 'tion'},
	{'di', 'ver', 'si', 'ty'},
	{'ac', 'ces', 'si', 'ble'},
	{'ac', 'ces', 'so', 'ry'},
	{'typ', 'i', 'cal', 'ly'},
	{'leg', 'is', 'la', 'tive'},
	{'mo', 'lec', 'u', 'lar'},
	{'sus', 'tain', 'a', 'ble'},
	{'sta', 'tis', 'ti', 'cal'},
	{'in', 'no', 'va', 'tion'},
	{'suc', 'cess', 'ful', 'ly'},
	{'pri', 'mar', 'i', 'ly'},
	{'con', 'sid', 'er', 'ing'},
	{'in', 'no', 'va', 'tive'},
	{'tu', 'to', 'ri', 'al'},
	{'mod', 'er', 'a', 'tor'},
	{'val', 'u', 'a', 'ble'},
	{'an', 'i', 'ma', 'tion'},
	{'a', 'vi', 'a', 'tion'},
	{'com', 'mis', 'sion', 'er'},
	{'re', 'spec', 'tive', 'ly'},
	{'di', 'ag', 'no', 'sis'},
	{'cal', 'cu', 'lat', 'ed'},
	{'al', 'lo', 'cat', 'ed'},
	{'mu', 'nic', 'i', 'pal'},
	{'sim', 'u', 'la', 'tion'},
	{'con', 'cen', 'tra', 'tion'},
	{'ex', 'hi', 'bi', 'tion'},
	{'e', 'val', 'u', 'ate'},
	{'com', 'po', 'si', 'tion'},
	{'def', 'i', 'nite', 'ly'},
	{'com', 'men', 'tar', 'y'},
	{'im', 'mi', 'gra', 'tion'},
	{'ap', 'par', 'ent', 'ly'},
	{'ob', 'vi', 'ous', 'ly'},
	{'fun', 'da', 'men', 'tal'},
	{'cham', 'pi', 'on', 'ship'},
	{'im', 'pos', 'si', 'ble'},
	{'ex', 'pla', 'na', 'tion'},
	{'mo', 'tor', 'cy', 'cle'},
	{'es', 'tab', 'lish', 'ment'},
	{'oc', 'cu', 'pa', 'tion'},
	{'ra', 'di', 'a', 'tion'},
	{'se', 'ri', 'ous', 'ly'},
	{'con', 'serv', 'a', 'tive'},
	{'ef', 'fec', 'tive', 'ness'},
	{'ex', 'per', 'i', 'ment'},
	{'fed', 'er', 'a', 'tion'},
	{'eve', 'ry', 'bod', 'y'},
	{'ac', 'cept', 'a', 'ble'},
	{'med', 'i', 'ca', 'tion'},
	{'or', 'di', 'nar', 'y'},
	{'sta', 'bil', 'i', 'ty'},
	{'in', 'de', 'pend', 'ence'},
	{'me', 'tab', 'o', 'lism'},
	{'per', 'son', 'al', 'ly'},
	{'in', 'tel', 'li', 'gent'},
	{'ob', 'li', 'ga', 'tion'},
	{'a', 'lu', 'mi', 'num'},
	{'re', 'pub', 'li', 'can'},
	{'ap', 'pre', 'ci', 'ate'},
	{'reg', 'u', 'lar', 'ly'},
	{'con', 'ver', 'sa', 'tion'},
	{'con', 'tri', 'but', 'ed'},
	{'re', 'pro', 'duc', 'tion'},
	{'mi', 'nor', 'i', 'ty'},
	{'con', 'se', 'quenc', 'es'},
	{'ge', 'og', 'ra', 'phy'},
	{'in', 'teg', 'ri', 'ty'},
	{'e', 'mo', 'tion', 'al'},
	{'ge', 'o', 'graph', 'ic'},
	{'pro', 'mo', 'tion', 'al'},
	{'gen', 'er', 'a', 'tor'},
	{'com', 'mu', 'ni', 'cate'},
	{'ma', 'chin', 'er', 'y'},
	{'il', 'lus', 'trat', 'ed'},
	{'con', 'ti', 'nen', 'tal'},
	{'au', 'to', 'mat', 'ed'},
	{'lit', 'er', 'ar', 'y'},
	{'ju', 'ris', 'dic', 'tion'},
	{'dec', 'la', 'ra', 'tion'},
	{'au', 'to', 'ma', 'tion'},
	{'re', 'cip', 'i', 'ent'},
	{'de', 'ter', 'min', 'ing'},
	{'con', 'di', 'tion', 'ing'},
	{'un', 'u', 'su', 'al'},
	{'in', 'creas', 'ing', 'ly'},
	{'ba', 'si', 'cal', 'ly'},
	{'con', 'ven', 'tion', 'al'},
	{'an', 'i', 'mat', 'ed'},
	{'dif', 'fi', 'cul', 'ty'},
	{'co', 'a', 'li', 'tion'},
	{'ob', 'ser', 'va', 'tion'},
	{'res', 'to', 'ra', 'tion'},
	{'op', 'po', 'si', 'tion'},
	{'con', 'fir', 'ma', 'tion'},
	{'su', 'per', 'vi', 'sor'},
	{'di', 'am', 'e', 'ter'},
	{'lit', 'er', 'a', 'cy'},
	{'in', 'ter', 'ven', 'tion'},
	{'com', 'pi', 'la', 'tion'},
	{'pol', 'y', 'phon', 'ic'},
	{'ad', 'just', 'a', 'ble'},
	{'al', 'lo', 'ca', 'tion'},
	{'dem', 'on', 'strat', 'ed'},
	{'vol', 'un', 'tar', 'y'},
	{'pho', 'tog', 'ra', 'pher'},
	{'trans', 'for', 'ma', 'tion'},
	{'fa', 'cil', 'i', 'tate'},
	{'in', 'cred', 'i', 'ble'},
	{'rep', 'u', 'ta', 'tion'},
	{'var', 'i', 'a', 'tion'},
	{'dis', 'trib', 'u', 'tor'},
	{'un', 'der', 'ly', 'ing'},
	{'di', 'ag', 'nos', 'tic'},
	{'au', 'to', 'mo', 'bile'},
	{'con', 'fi', 'den', 'tial'},
	{'in', 'i', 'tial', 'ly'},
	{'in', 'di', 'ca', 'tor'},
	{'e', 'lim', 'i', 'nate'},
	{'cem', 'e', 'ter', 'y'},
	{'ex', 'plo', 'ra', 'tion'},
	{'as', 'tron', 'o', 'my'},
	{'lit', 'i', 'ga', 'tion'},
	{'hor', 'i', 'zon', 'tal'},
	{'mo', 'bil', 'i', 'ty'},
	{'ul', 'ti', 'mate', 'ly'},
	{'ar', 'ti', 'fi', 'cial'},
	{'spec', 'tac', 'u', 'lar'},
	{'ac', 'ti', 'va', 'tion'},
	{'nat', 'u', 'ral', 'ly'},
	{'di', 'men', 'sion', 'al'},
	{'com', 'plex', 'i', 'ty'},
	{'leg', 'is', 'la', 'ture'},
	{'an', 'y', 'bod', 'y'},
	{'ter', 'mi', 'na', 'tion'},
	{'vir', 'tu', 'al', 'ly'},
	{'sit', 'u', 'at', 'ed'},
	{'com', 'par', 'a', 'tive'},
	{'ex', 'pend', 'i', 'ture'},
	{'sim', 'i', 'lar', 'ly'},
	{'in', 'ves', 'ti', 'gate'},
	{'sig', 'nif', 'i', 'cance'},
	{'sce', 'nar', 'i', 'o'},
	{'sym', 'po', 'si', 'um'},
	{'cor', 're', 'spond', 'ence'},
	{'su', 'per', 'vi', 'sion'},
	{'sep', 'a', 'ra', 'tion'},
	{'tes', 'ti', 'mo', 'ny'},
	{'man', 'da', 'to', 'ry'},
	{'cel', 'e', 'bra', 'tion'},
	{'im', 'pe', 'ri', 'al'},
	{'sep', 'a', 'rat', 'ed'},
	{'in', 'struc', 'tion', 'al'},
	{'cal', 'cu', 'la', 'tion'},
	{'ex', 'cep', 'tion', 'al'},
	{'anx', 'i', 'e', 'ty'},
	{'an', 'nu', 'al', 'ly'},
	{'ad', 'vo', 'ca', 'cy'},
	{'es', 'sen', 'tial', 'ly'},
	{'pres', 'er', 'va', 'tion'},
	{'i', 'so', 'lat', 'ed'},
	{'in', 'ten', 'si', 'ty'},
	{'an', 'ti', 'vi', 'rus'},
	{'dem', 'on', 'stra', 'tion'},
	{'gov', 'ern', 'men', 'tal'},
	{'man', 'u', 'fac', 'tured'},
	{'grad', 'u', 'a', 'tion'},
	{'ex', 'te', 'ri', 'or'},
	{'e', 'col', 'o', 'gy'},
	{'un', 'em', 'ploy', 'ment'},
	{'ve', 'loc', 'i', 'ty'},
	{'i', 'den', 'ti', 'cal'},
	{'pe', 'tro', 'le', 'um'},
	{'par', 'tic', 'i', 'pant'},
	{'cer', 'e', 'mo', 'ny'},
	{'ad', 'ver', 'tis', 'er'},
	{'man', 'u', 'fac', 'ture'},
	{'mor', 'tal', 'i', 'ty'},
	{'ther', 'a', 'peu', 'tic'},
	{'ac', 'cord', 'ing', 'ly'},
	{'re', 'lo', 'ca', 'tion'},
	{'ex', 'e', 'cut', 'ed'},
	{'re', 'al', 'is', 'tic'},
	{'gen', 'er', 'at', 'ing'},
	{'con', 'gres', 'sion', 'al'},
	{'pho', 'to', 'graph', 'ic'},
	{'mil', 'len', 'ni', 'um'},
	{'e', 'qual', 'i', 'ty'},
	{'dec', 'o', 'ra', 'tive'},
	{'in', 'dig', 'e', 'nous'},
	{'val', 'i', 'da', 'tion'},
	{'cho', 'les', 'ter', 'ol'},
	{'dif', 'fer', 'en', 'tial'},
	{'nev', 'er', 'the', 'less'},
	{'rea', 'son', 'a', 'bly'},
	{'mon', 'e', 'tar', 'y'},
	{'in', 'di', 'cat', 'ing'},
	{'co', 'or', 'di', 'nate'},
	{'ex', 'clu', 'sive', 'ly'},
	{'lim', 'i', 'ta', 'tion'},
	{'il', 'lus', 'tra', 'tion'},
	{'in', 'spi', 'ra', 'tion'},
	{'com', 'pli', 'cat', 'ed'},
	{'dec', 'o', 'rat', 'ing'},
	{'hu', 'mid', 'i', 'ty'},
	{'con', 'tri', 'but', 'ing'},
	{'cir', 'cu', 'la', 'tion'},
	{'can', 'cel', 'la', 'tion'},
	{'nu', 'mer', 'i', 'cal'},
	{'ac', 'com', 'pa', 'nied'},
	{'in', 'vi', 'ta', 'tion'},
	{'sub', 'stan', 'tial', 'ly'},
	{'ge', 'om', 'e', 'try'},
	{'cor', 're', 'la', 'tion'},
	{'vo', 'ca', 'tion', 'al'},
	{'in', 'tro', 'duc', 'ing'},
	{'reg', 'u', 'lat', 'ed'},
	{'com', 'pa', 'ra', 'ble'},
	{'cop', 'y', 'right', 'ed'},
	{'vul', 'ner', 'a', 'ble'},
	{'ma', 'ter', 'ni', 'ty'},
	{'be', 'hav', 'ior', 'al'},
	{'of', 'fi', 'cial', 'ly'},
	{'con', 'sor', 'ti', 'um'},
	{'bac', 'te', 'ri', 'a'},
	{'veg', 'e', 'ta', 'ble'},
	{'mo', 'ti', 'va', 'tion'},
	{'con', 'sist', 'ent', 'ly'},
	{'sub', 'se', 'quent', 'ly'},
	{'in', 'cor', 'po', 'rate'},
	{'hu', 'man', 'i', 'ty'},
	{'a', 'nat', 'o', 'my'},
	{'un', 'cer', 'tain', 'ty'},
	{'re', 'con', 'struc', 'tion'},
	{'en', 'cour', 'ag', 'ing'},
	{'ben', 'e', 'fi', 'cial'},
	{'lit', 'er', 'al', 'ly'},
	{'per', 'i', 'od', 'ic'},
	{'re', 'mark', 'a', 'ble'},
	{'ac', 'ti', 'vat', 'ed'},
	{'ac', 'com', 'mo', 'date'},
	{'di', 'e', 'tar', 'y'},
	{'i', 'so', 'la', 'tion'},
	{'ap', 'prox', 'i', 'mate'},
	{'in', 'her', 'it', 'ed'},
	{'le', 'git', 'i', 'mate'},
	{'en', 'tre', 'pre', 'neur'},
	{'val', 'u', 'a', 'tion'},
	{'un', 'ex', 'pect', 'ed'},
	{'con', 'se', 'quent', 'ly'},
	{'quan', 'ti', 'ta', 'tive'},
	{'sub', 'di', 'vi', 'sion'},
	{'te', 'leph', 'o', 'ny'},
	{'med', 'i', 'ta', 'tion'},
	{'in', 'stru', 'men', 'tal'},
	{'or', 'gan', 'iz', 'ing'},
	{'in', 'vis', 'i', 'ble'},
	{'com', 'mod', 'i', 'ty'},
	{'in', 'di', 'ca', 'tion'},
	{'co', 'or', 'di', 'nates'},
	{'phys', 'i', 'cal', 'ly'},
	{'con', 'sec', 'u', 'tive'},
	{'pen', 'in', 'su', 'la'},
	{'ac', 'cu', 'rate', 'ly'},
	{'sys', 'tem', 'at', 'ic'},
	{'trou', 'ble', 'shoot', 'ing'},
	{'con', 'spir', 'a', 'cy'},
	{'or', 'gan', 'iz', 'er'},
	{'com', 'bi', 'na', 'tions'},
	{'cu', 'mu', 'la', 'tive'},
	{'am', 'pli', 'fi', 'er'},
	{'ar', 'bi', 'trar', 'y'},
	{'ti', 'ta', 'ni', 'um'},
	{'oc', 'ca', 'sion', 'al'},
	{'ex', 'plic', 'it', 'ly'},
	{'cit', 'i', 'zen', 'ship'},
	{'in', 'form', 'a', 'tive'},
	{'hi', 'er', 'ar', 'chy'},
	{'sce', 'nar', 'i', 'os'},
	{'el', 'e', 'va', 'tion'},
	{'cal', 'i', 'bra', 'tion'},
	{'ef', 'fi', 'cient', 'ly'},
	{'en', 'ter', 'tain', 'ing'},
	{'pre', 'req', 'ui', 'site'},
	{'hy', 'poth', 'e', 'sis'},
	{'in', 'ter', 'sec', 'tion'},
	{'con', 'sist', 'en', 'cy'},
	{'as', 'trol', 'o', 'gy'},
	{'sup', 'ple', 'men', 'tal'},
	{'in', 'ter', 'fer', 'ence'},
	{'at', 'mos', 'pher', 'ic'},
	{'pub', 'lic', 'i', 'ty'},
	{'prop', 'o', 'si', 'tion'},
	{'des', 'ig', 'na', 'tion'},
	{'cri', 'te', 'ri', 'on'},
	{'va', 'lid', 'i', 'ty'},
	{'ge', 'ol', 'o', 'gy'},
	{'am', 'bas', 'sa', 'dor'},
	{'veg', 'e', 'ta', 'tion'},
	{'phe', 'nom', 'e', 'non'},
	{'dif', 'fer', 'ent', 'ly'},
	{'in', 'te', 'grat', 'ing'},
	{'char', 'i', 'ta', 'ble'},
	{'an', 'no', 'tat', 'ed'},
	{'char', 'ac', 'ter', 'ized'},
	{'qual', 'i', 'fy', 'ing'},
	{'es', 'ti', 'ma', 'tion'},
	{'pe', 'di', 'at', 'ric'},
	{'sta', 'tion', 'er', 'y'},
	{'un', 'au', 'thor', 'ized'},
	{'an', 'ti', 'bod', 'y'},
	{'con', 'trib', 'u', 'tor'},
	{'grad', 'u', 'al', 'ly'},
	{'de', 'sir', 'a', 'ble'},
	{'de', 'vi', 'a', 'tion'},
	{'ir', 'ri', 'ga', 'tion'},
	{'man', 'u', 'al', 'ly'},
	{'im', 'por', 'tant', 'ly'},
	{'ap', 'pa', 'rat', 'us'},
	{'nom', 'i', 'na', 'tion'},
	{'em', 'pir', 'i', 'cal'},
	{'pol', 'y', 'es', 'ter'},
	{'spe', 'cial', 'iz', 'ing'},
	{'re', 'pro', 'duc', 'tive'},
	{'dis', 'po', 'si', 'tion'},
	{'nav', 'i', 'ga', 'tor'},
	{'fas', 'ci', 'nat', 'ing'},
	{'com', 'pu', 'ta', 'tion'},
	{'ar', 'bi', 'tra', 'tion'},
	{'re', 'mov', 'a', 'ble'},
	{'ed', 'u', 'cat', 'ed'},
	{'ne', 'ces', 'si', 'ty'},
	{'na', 'tion', 'al', 'ly'},
	{'con', 'vert', 'i', 'ble'},
	{'ad', 'o', 'les', 'cent'},
	{'de', 'mo', 'graph', 'ic'},
	{'hel', 'i', 'cop', 'ter'},
	{'grad', 'u', 'at', 'ed'},
	{'ex', 'pi', 'ra', 'tion'},
	{'pe', 'riph', 'er', 'al'},
	{'nom', 'i', 'nat', 'ed'},
	{'e', 'lec', 'tor', 'al'},
	{'con', 'tro', 'ver', 'sial'},
	{'prac', 'ti', 'tion', 'er'},
	{'mo', 'ti', 'vat', 'ed'},
	{'ex', 'am', 'in', 'ing'},
	{'rev', 'e', 'la', 'tion'},
	{'del', 'e', 'ga', 'tion'},
	{'dic', 'tion', 'ar', 'ies'},
	{'trans', 'par', 'en', 'cy'},
	{'psy', 'chi', 'a', 'try'},
	{'a', 'quar', 'i', 'um'},
	{'mag', 'nif', 'i', 'cent'},
	{'ad', 'ap', 'ta', 'tion'},
	{'dis', 'ap', 'point', 'ed'},
	{'col', 'lect', 'i', 'ble'},
	{'mys', 'te', 'ri', 'ous'},
	{'li', 'brar', 'i', 'an'},
	{'re', 'lax', 'a', 'tion'},
	{'rep', 'li', 'ca', 'tion'},
	{'in', 'ex', 'pen', 'sive'},
	{'ev', 'a', 'nes', 'cence'},
	{'con', 'tro', 'ver', 'sy'},
	{'leg', 'end', 'ar', 'y'},
	{'beau', 'ti', 'ful', 'ly'},
	{'an', 'ti', 'bod', 'ies'},
	{'de', 'part', 'men', 'tal'},
	{'re', 'struc', 'tur', 'ing'},
	{'con', 'di', 'tion', 'al'},
	{'con', 'cep', 'tu', 'al'},
	{'in', 'su', 'la', 'tion'},
	{'se', 'ver', 'i', 'ty'},
	{'em', 'broi', 'der', 'y'},
	{'at', 'trib', 'ut', 'ed'},
	{'mem', 'o', 'ran', 'dum'},
	{'in', 'cred', 'i', 'bly'},
	{'un', 'of', 'fi', 'cial'},
	{'un', 'der', 'wa', 'ter'},
	{'re', 'peat', 'ed', 'ly'},
	{'i', 'tal', 'i', 'cized'},
	{'in', 'ad', 'e', 'quate'},
	{'in', 'suf', 'fi', 'cient'},
	{'for', 'mu', 'la', 'tion'},
	{'en', 'joy', 'a', 'ble'},
	{'ne', 'go', 'ti', 'ate'},
	{'per', 'ma', 'nent', 'ly'},
	{'con', 'cen', 'trat', 'ed'},
	{'in', 'gre', 'di', 'ent'},
	{'ex', 'pe', 'di', 'tion'},
	{'op', 'er', 'a', 'tive'},
	{'ma', 'tur', 'i', 'ty'},
	{'pros', 'e', 'cu', 'tion'},
	{'what', 'so', 'ev', 'er'},
	{'ter', 'mi', 'nat', 'ed'},
	{'sanc', 'tu', 'ar', 'y'},
	{'tox', 'ic', 'i', 'ty'},
	{'re', 'sid', 'u', 'al'},
	{'kin', 'der', 'gar', 'ten'},
	{'prof', 'it', 'a', 'ble'},
	{'de', 'riv', 'a', 'tive'},
	{'oc', 'cu', 'pan', 'cy'},
	{'post', 'grad', 'u', 'ate'},
	{'dec', 'o', 'ra', 'tion'},
	{'de', 'fin', 'i', 'tive'},
	{'reg', 'u', 'la', 'tor'},
	{'u', 'ti', 'liz', 'ing'},
	{'me', 'di', 'a', 'tion'},
	{'ec', 'o', 'sys', 'tem'},
	{'sim', 'plic', 'i', 'ty'},
	{'in', 'fin', 'i', 'ty'},
	{'dis', 'con', 'tin', 'ued'},
	{'cel', 'e', 'brat', 'ing'},
	{'ven', 'ti', 'la', 'tion'},
	{'mem', 'o', 'ra', 'ble'},
	{'re', 'fi', 'nanc', 'ing'},
	{'de', 'fi', 'cien', 'cy'},
	{'bin', 'oc', 'u', 'lars'},
	{'aux', 'il', 'ia', 'ry'},
	{'in', 'i', 'ti', 'ate'},
	{'el', 'e', 'vat', 'ed'},
	{'sta', 'tion', 'ar', 'y'},
	{'cel', 'e', 'brat', 'ed'},
	{'co', 'ef', 'fi', 'cient'},
	{'du', 'pli', 'ca', 'tion'},
	{'ad', 'e', 'quate', 'ly'},
	{'dec', 'o', 'rat', 'ed'},
	{'sim', 'u', 'la', 'tor'},
	{'dis', 'ser', 'ta', 'tion'},
	{'en', 'thu', 'si', 'asm'},
	{'sur', 'pris', 'ing', 'ly'},
	{'prac', 'ti', 'cal', 'ly'},
	{'ded', 'i', 'ca', 'tion'},
	{'an', 'a', 'lyz', 'ing'},
	{'ef', 'fi', 'ca', 'cy'},
	{'prox', 'im', 'i', 'ty'},
	{'sim', 'u', 'lat', 'ed'},
	{'cul', 'i', 'nar', 'y'},
	{'mit', 'i', 'ga', 'tion'},
	{'de', 'pend', 'en', 'cy'},
	{'re', 'mod', 'el', 'ing'},
	{'in', 'tu', 'i', 'tive'},
	{'qual', 'i', 'ta', 'tive'},
	{'re', 'charge', 'a', 'ble'},
	{'un', 'der', 'tak', 'ing'},
	{'not', 'with', 'stand', 'ing'},
	{'bo', 'tan', 'i', 'cal'},
	{'hy', 'per', 'ten', 'sion'},
	{'el', 'e', 'va', 'tor'},
	{'pro', 'vi', 'sion', 'al'},
	{'tran', 'si', 'tion', 'al'},
	{'sub', 'sti', 'tu', 'tion'},
	{'o', 'ver', 'whelm', 'ing'},
	{'al', 'to', 'geth', 'er'},
	{'i', 'de', 'al', 'ly'},
	{'com', 'pul', 'so', 'ry'},
	{'fa', 'vor', 'a', 'ble'},
	{'in', 'her', 'it', 'ance'},
	{'af', 'firm', 'a', 'tive'},
	{'pe', 'ti', 'tion', 'er'},
	{'res', 'i', 'den', 'cy'},
	{'for', 'tu', 'nate', 'ly'},
	{'cal', 'cu', 'lat', 'ing'},
	{'pro', 'por', 'tion', 'al'},
	{'dep', 're', 'cat', 'ed'},
	{'ex', 'pec', 'ta', 'tion'},
	{'lib', 'er', 'a', 'tion'},
	{'di', 'ag', 'nos', 'tics'},
	{'lux', 'u', 'ri', 'ous'},
	{'in', 'di', 'rect', 'ly'},
	{'il', 'lus', 'tra', 'tor'},
	{'po', 'tas', 'si', 'um'},
	{'pres', 'i', 'den', 'cy'},
	{'an', 'a', 'lyz', 'er'},
	{'ac', 'ci', 'den', 'tal'},
	{'pref', 'er', 'a', 'bly'},
	{'my', 'thol', 'o', 'gy'},
	{'cor', 'o', 'nar', 'y'},
	{'me', 'di', 'at', 'ed'},
	{'spec', 'i', 'fy', 'ing'},
	{'the', 'at', 'ri', 'cal'},
	{'in', 'ter', 'pret', 'er'},
	{'an', 'a', 'lyt', 'ics'},
	{'rec', 'og', 'niz', 'ing'},
	{'au', 'ton', 'o', 'mous'},
	{'col', 'lat', 'er', 'al'},
	{'tech', 'ni', 'cal', 'ly'},
	{'de', 'liv', 'er', 'ies'},
	{'mo', 'nop', 'o', 'ly'},
	{'cor', 're', 'spond', 'ent'},
	{'prop', 'a', 'ga', 'tion'},
	{'vi', 'cin', 'i', 'ty'},
	{'pros', 'per', 'i', 'ty'},
	{'in', 'con', 'sist', 'ent'},
	{'ad', 'min', 'is', 'ter'},
	{'bi', 'lat', 'er', 'al'},
	{'dis', 'pos', 'a', 'ble'},
	{'non', 'lin', 'e', 'ar'},
	{'me', 'rid', 'i', 'an'},
	{'ex', 'e', 'cut', 'ing'},
	{'ren', 'o', 'va', 'tion'},
	{'dip', 'lo', 'mat', 'ic'},
	{'in', 'ter', 'nal', 'ly'},
	{'plan', 'e', 'tar', 'y'},
	{'ge', 'o', 'met', 'ric'},
	{'tax', 'on', 'o', 'my'},
	{'pa', 'tri', 'ot', 'ic'},
	{'con', 'gre', 'ga', 'tion'},
	{'ed', 'u', 'ca', 'tor'},
	{'vis', 'u', 'al', 'ly'},
	{'fab', 'ri', 'ca', 'tion'},
	{'im', 'mu', 'ni', 'ty'},
	{'flu', 'o', 'res', 'cent'},
	{'pro', 'gram', 'ma', 'ble'},
	{'rec', 'tan', 'gu', 'lar'},
	{'en', 'thu', 'si', 'ast'},
	{'pos', 'i', 'tive', 'ly'},
	{'ex', 'am', 'in', 'er'},
	{'in', 'flu', 'en', 'tial'},
	{'pan', 'o', 'ram', 'a'},
	{'fi', 'del', 'i', 'ty'},
	{'ex', 'ten', 'sive', 'ly'},
	{'ac', 'count', 'a', 'ble'},
	{'dis', 'cog', 'ra', 'phy'},
	{'pe', 'di', 'at', 'rics'},
	{'ri', 'dic', 'u', 'lous'},
	{'pro', 'fi', 'cien', 'cy'},
	{'u', 'ra', 'ni', 'um'},
	{'con', 'sol', 'i', 'date'},
	{'dis', 'trib', 'ut', 'ing'},
	{'es', 'ti', 'mat', 'ing'},
	{'pre', 'sum', 'a', 'bly'},
	{'pre', 'par', 'ed', 'ness'},
	{'de', 'duct', 'i', 'ble'},
	{'ac', 'com', 'pa', 'ny'},
	{'dep', 'o', 'si', 'tion'},
	{'pe', 'des', 'tri', 'an'},
	{'con', 'di', 'tion', 'er'},
	{'con', 'ven', 'ient', 'ly'},
	{'pro', 'hi', 'bi', 'tion'},
	{'hi', 'lar', 'i', 'ous'},
	{'mag', 'ne', 'si', 'um'},
	{'un', 'for', 'tu', 'nate'},
	{'com', 'pet', 'i', 'tor'},
	{'to', 'pol', 'o', 'gy'},
	{'mo', 'ral', 'i', 'ty'},
	{'hon', 'or', 'a', 'ble'},
	{'dem', 'on', 'strat', 'ing'},
	{'met', 'a', 'bol', 'ic'},
	{'an', 'thol', 'o', 'gy'},
	{'pros', 'e', 'cu', 'tor'},
	{'e', 'ter', 'ni', 'ty'},
	{'res', 'ur', 'rec', 'tion'},
	{'e', 'lab', 'o', 'rate'},
	{'no', 'to', 'ri', 'ous'},
	{'cas', 'u', 'al', 'ty'},
	{'con', 'trac', 'tu', 'al'},
	{'ir', 'rel', 'e', 'vant'},
	{'mu', 'tu', 'al', 'ly'},
	{'af', 'fin', 'i', 'ty'},
	{'un', 'spec', 'i', 'fied'},
	{'gen', 'er', 'al', 'ized'},
	{'fi', 'nan', 'cial', 'ly'},
	{'san', 'i', 'ta', 'tion'},
	{'col', 'lec', 'tive', 'ly'},
	{'in', 'hi', 'bi', 'tion'},
	{'al', 'leg', 'ed', 'ly'},
	{'mod', 'i', 'fy', 'ing'},
	{'in', 'hib', 'i', 'tor'},
	{'knowl', 'edge', 'a', 'ble'},
	{'crit', 'i', 'cal', 'ly'},
	{'re', 'cip', 'ro', 'cal'},
	{'ac', 'cel', 'er', 'ate'},
	{'dis', 'cov', 'er', 'ies'},
	{'mi', 'cros', 'co', 'py'},
	{'en', 'cour', 'age', 'ment'},
	{'di', 'rec', 'to', 'rate'},
	{'se', 'ren', 'i', 'ty'},
	{'san', 'i', 'tar', 'y'},
	{'co', 'op', 'er', 'ate'},
	{'ep', 'i', 'dem', 'ic'},
	{'re', 'port', 'ed', 'ly'},
	{'com', 'pe', 'ten', 'cy'},
	{'cor', 're', 'lat', 'ed'},
	{'com', 'mer', 'cial', 'ly'},
	{'ir', 'reg', 'u', 'lar'},
	{'in', 'cre', 'men', 'tal'},
	{'re', 'dis', 'trib', 'ute'},
	{'ab', 'dom', 'i', 'nal'},
	{'in', 'ci', 'den', 'tal'},
	{'spon', 'ta', 'ne', 'ous'},
	{'e', 'ques', 'tri', 'an'},
	{'re', 'la', 'tion', 'al'},
	{'di', 'rec', 'tion', 'al'},
	{'ter', 'res', 'tri', 'al'},
	{'for', 'mu', 'lat', 'ed'},
	{'sub', 'sti', 'tut', 'ed'},
	{'con', 'tin', 'u', 'um'},
	{'spec', 'tros', 'co', 'py'},
	{'un', 'reg', 'is', 'tered'},
	{'eq', 'ui', 'ta', 'ble'},
	{'in', 'flam', 'ma', 'tion'},
	{'at', 'tri', 'bu', 'tion'},
	{'im', 'pris', 'on', 'ment'},
	{'his', 'to', 'ri', 'an'},
	{'fac', 'sim', 'i', 'le'},
	{'lo', 'cal', 'i', 'ty'},
	{'e', 'the', 're', 'al'},
	{'au', 'ton', 'o', 'my'},
	{'un', 're', 'lat', 'ed'},
	{'spec', 'u', 'la', 'tion'},
	{'en', 'light', 'en', 'ment'},
	{'a', 'rith', 'me', 'tic'},
	{'sup', 'pos', 'ed', 'ly'},
	{'an', 'tic', 'i', 'pate'},
	{'dis', 'ad', 'van', 'taged'},
	{'di', 'ag', 'o', 'nal'},
	{'sov', 'er', 'eign', 'ty'},
	{'su', 'per', 'mar', 'ket'},
	{'com', 'pre', 'hen', 'sion'},
	{'per', 'son', 'al', 'ised'},
	{'ex', 'hib', 'i', 'tor'},
	{'aug', 'men', 'ta', 'tion'},
	{'ra', 'di', 'a', 'tor'},
	{'al', 'ter', 'a', 'tion'},
	{'cen', 'ten', 'ni', 'al'},
	{'ref', 'er', 'en', 'dum'},
	{'mod', 'u', 'la', 'tion'},
	{'dem', 'o', 'li', 'tion'},
	{'em', 'pow', 'er', 'ment'},
	{'ac', 'knowl', 'edge', 'ment'},
	{'en', 'er', 'get', 'ic'},
	{'op', 'ti', 'mis', 'tic'},
	{'con', 'tin', 'gen', 'cy'},
	{'ma', 'hog', 'a', 'ny'},
	{'al', 'low', 'a', 'ble'},
	{'op', 'ti', 'miz', 'ing'},
	{'in', 'su', 'lat', 'ed'},
	{'phi', 'los', 'o', 'pher'},
	{'con', 'form', 'i', 'ty'},
	{'em', 'u', 'la', 'tion'},
	{'con', 'tig', 'u', 'ous'},
	{'in', 'ac', 'cu', 'rate'},
	{'un', 'doubt', 'ed', 'ly'},
	{'psy', 'chol', 'o', 'gist'},
	{'per', 'pet', 'u', 'al'},
	{'so', 'lic', 'i', 'tor'},
	{'in', 'con', 'ven', 'ience'},
	{'vac', 'ci', 'na', 'tion'},
	{'pre', 'dict', 'a', 'ble'},
	{'sus', 'cep', 'ti', 'ble'},
	{'pe', 'rim', 'e', 'ter'},
	{'hon', 'or', 'ar', 'y'},
	{'ag', 'gre', 'ga', 'tion'},
	{'sat', 'u', 'rat', 'ed'},
	{'in', 'flat', 'a', 'ble'},
	{'mod', 'er', 'ate', 'ly'},
	{'re', 'pet', 'i', 'tive'},
	{'pan', 'o', 'ram', 'ic'},
	{'im', 'per', 'a', 'tive'},
	{'prob', 'lem', 'at', 'ic'},
	{'di', 'ver', 'si', 'fied'},
	{'fer', 'ti', 'liz', 'er'},
	{'an', 'a', 'lyt', 'ic'},
	{'a', 'dor', 'a', 'ble'},
	{'a', 'pol', 'o', 'gize'},
	{'reg', 'u', 'lat', 'ing'},
	{'am', 'mu', 'ni', 'tion'},
	{'ar', 'til', 'ler', 'y'},
	{'ren', 'o', 'vat', 'ed'},
	{'col', 'lab', 'o', 'rate'},
	{'res', 'ig', 'na', 'tion'},
	{'in', 'fe', 'ri', 'or'},
	{'in', 'dic', 'a', 'tive'},
	{'up', 'hol', 'ster', 'y'},
	{'aq', 'ua', 'cul', 'ture'},
	{'ox', 'i', 'da', 'tion'},
	{'en', 'ti', 'tle', 'ment'},
	{'ac', 'count', 'an', 'cy'},
	{'in', 'ter', 'rupt', 'ed'},
	{'pol', 'i', 'ti', 'cian'},
	{'u', 'nan', 'i', 'mous'},
	{'ex', 'er', 'cis', 'ing'},
	{'dis', 'ad', 'vant', 'age'},
	{'tes', 'tos', 'ter', 'one'},
	{'cul', 'ti', 'va', 'tion'},
	{'ques', 'tion', 'a', 'ble'},
	{'dig', 'it', 'al', 'ly'},
	{'per', 'son', 'al', 'ize'},
	{'un', 'der', 'go', 'ing'},
	{'com', 'pu', 'ter', 'ized'},
	{'dis', 'ap', 'point', 'ment'},
	{'dev', 'as', 'tat', 'ing'},
	{'in', 'var', 'i', 'ant'},
	{'or', 'di', 'na', 'tion'},
	{'de', 'lib', 'er', 'ate'},
	{'mul', 'ti', 'lin', 'gual'},
	{'des', 'per', 'ate', 'ly'},
	{'re', 'me', 'di', 'al'},
	{'cat', 'e', 'go', 'rized'},
	{'re', 'ceiv', 'a', 'ble'},
	{'car', 'bo', 'hy', 'drate'},
	{'me', 'dic', 'i', 'nal'},
	{'re', 'al', 'iz', 'ing'},
	{'cem', 'e', 'ter', 'ies'},
	{'av', 'er', 'ag', 'ing'},
	{'in', 'ven', 'to', 'ries'},
	{'com', 'men', 'tar', 'ies'},
	{'re', 'fund', 'a', 'ble'},
	{'in', 'tes', 'ti', 'nal'},
	{'di', 'plo', 'ma', 'cy'},
	{'cap', 'i', 'tal', 'ist'},
	{'seg', 'men', 'ta', 'tion'},
	{'ed', 'u', 'cat', 'ing'},
	{'re', 'vers', 'i', 'ble'},
	{'un', 'clas', 'si', 'fied'},
	{'con', 'se', 'quen', 'tial'},
	{'com', 'fort', 'a', 'bly'},
	{'fed', 'er', 'al', 'ly'},
	{'re', 'dun', 'dan', 'cy'},
	{'grad', 'u', 'at', 'ing'},
	{'em', 'u', 'la', 'tor'},
	{'mi', 'cro', 'bi', 'al'},
	{'in', 'cor', 'rect', 'ly'},
	{'a', 'li', 'as', 'es'},
	{'max', 'i', 'miz', 'ing'},
	{'fash', 'ion', 'a', 'ble'},
	{'vi', 'tal', 'i', 'ty'},
	{'a', 'nal', 'o', 'gy'},
	{'in', 'som', 'ni', 'a'},
	{'con', 'stit', 'u', 'ent'},
	{'al', 'ge', 'bra', 'ic'},
	{'con', 'sti', 'tut', 'ed'},
	{'ret', 'ro', 'spec', 'tive'},
	{'flu', 'o', 'res', 'cence'},
	{'li', 'quid', 'i', 'ty'},
	{'in', 'ten', 'tion', 'al'},
	{'mer', 'chan', 'dis', 'ing'},
	{'meas', 'ur', 'a', 'ble'},
	{'a', 'poc', 'a', 'lypse'},
	{'mor', 'phol', 'o', 'gy'},
	{'in', 'or', 'gan', 'ic'},
	{'ex', 'po', 'si', 'tion'},
	{'lam', 'i', 'nat', 'ed'},
	{'or', 'gan', 'iz', 'ing'},
	{'a', 'syn', 'chro', 'nous'},
	{'per', 'en', 'ni', 'al'},
	{'em', 'bod', 'i', 'ment'},
	{'sat', 'u', 'ra', 'tion'},
	{'chro', 'nol', 'o', 'gy'},
	{'ther', 'mom', 'e', 'ter'},
	{'er', 'go', 'nom', 'ic'},
	{'it', 'er', 'a', 'tion'},
	{'sep', 'a', 'rat', 'ing'},
	{'re', 'in', 'force', 'ment'},
	{'sym', 'pa', 'thet', 'ic'},
	{'in', 'i', 'tial', 'ize'},
	{'ter', 'mi', 'na', 'tor'},
	{'char', 'ac', 'ter', 'ize'},
	{'ex', 'po', 'nen', 'tial'},
	{'in', 'flu', 'enc', 'ing'},
	{'rep', 'u', 'ta', 'ble'},
	{'o', 'ver', 'lap', 'ping'},
	{'eq', 'ui', 'va', 'lence'},
	{'mis', 'er', 'a', 'ble'},
	{'un', 'suc', 'cess', 'ful'},
	{'rev', 'o', 'ca', 'tion'},
	{'mod', 'er', 'a', 'tion'},
	{'un', 're', 'strict', 'ed'},
	{'in', 'ef', 'fec', 'tive'},
	{'cul', 'tur', 'al', 'ly'},
	{'rec', 'la', 'ma', 'tion'},
	{'ex', 'pe', 'dit', 'ed'},
	{'a', 'pol', 'o', 'gy'},
	{'ex', 'ca', 'va', 'tion'},
	{'in', 'ter', 'rup', 'tion'},
	{'re', 'tract', 'a', 'ble'},
	{'del', 'e', 'gat', 'ed'},
	{'in', 'au', 'gu', 'ral'},
	{'me', 'trop', 'o', 'lis'},
	{'ar', 'te', 'ri', 'al'},
	{'man', 'i', 'fes', 'to'},
	{'lon', 'gev', 'i', 'ty'},
	{'dis', 'so', 'lu', 'tion'},
	{'a', 'wak', 'en', 'ing'},
	{'o', 'ver', 'com', 'ing'},
	{'in', 'ter', 'mit', 'tent'},
	{'budg', 'et', 'ar', 'y'},
	{'prac', 'ti', 'ca', 'ble'},
	{'ca', 'non', 'i', 'cal'},
	{'im', 'i', 'ta', 'tion'},
	{'neg', 'a', 'tive', 'ly'},
	{'liq', 'ui', 'da', 'tion'},
	{'pred', 'e', 'ces', 'sor'},
	{'phi', 'lan', 'thro', 'py'},
	{'ad', 'e', 'qua', 'cy'},
	{'cus', 'to', 'di', 'an'},
	{'o', 'ce', 'an', 'ic'},
	{'sep', 'a', 'ra', 'tor'},
	{'am', 'big', 'u', 'ous'},
	{'cat', 'er', 'pil', 'lar'},
	{'ben', 'e', 'fit', 'ed'},
	{'im', 'pli', 'ca', 'tion'},
	{'rep', 'e', 'ti', 'tion'},
	{'con', 'tra', 'dic', 'tion'},
	{'won', 'der', 'ful', 'ly'},
	{'no', 'tice', 'a', 'ble'},
	{'ev', 'i', 'dent', 'ly'},
	{'fab', 'ri', 'cat', 'ed'},
	{'min', 'i', 'miz', 'ing'},
	{'gen', 'u', 'ine', 'ly'},
	{'wa', 'ter', 'col', 'or'},
	{'sto', 'ry', 'tell', 'ing'},
	{'ac', 'com', 'plish', 'ment'},
	{'cus', 'tom', 'ar', 'y'},
	{'ver', 'ti', 'cal', 'ly'},
	{'ir', 'ri', 'ta', 'tion'},
	{'op', 'tion', 'al', 'ly'},
	{'con', 'serv', 'a', 'tory'},
	{'il', 'le', 'gal', 'ly'},
	{'re', 'spect', 'ful', 'ly'},
	{'e', 'ven', 'tu', 'al'},
	{'un', 'fa', 'mil', 'iar'},
	{'ex', 'pect', 'an', 'cy'},
	{'co', 'in', 'ci', 'dence'},
	{'per', 'mis', 'si', 'ble'},
	{'cur', 'ric', 'u', 'lar'},
	{'prin', 'ci', 'pal', 'ly'},
	{'de', 'pend', 'a', 'ble'},
	{'al', 'ter', 'nat', 'ing'},
	{'syn', 'di', 'cat', 'ed'},
	{'ap', 'pren', 'tice', 'ship'},
	{'com', 'pen', 'sat', 'ed'},
	{'cir', 'cu', 'lat', 'ed'},
	{'pic', 'to', 'ri', 'al'},
	{'ar', 'o', 'mat', 'ic'},
	{'em', 'po', 'ri', 'um'},
	{'in', 'her', 'ent', 'ly'},
	{'mon', 'o', 'phon', 'ic'},
	{'a', 'maz', 'ing', 'ly'},
	{'a', 'nal', 'o', 'gous'},
	{'par', 'tic', 'u', 'late'},
	{'ne', 'go', 'tia', 'ble'},
	{'a', 'gil', 'i', 'ty'},
	{'clin', 'i', 'cal', 'ly'},
	{'el', 'e', 'ment', 'al'},
	{'so', 'ci', 'e', 'tal'},
	{'co', 'ax', 'i', 'al'},
	{'ex', 'em', 'pla', 'ry'},
	{'ver', 'i', 'fy', 'ing'},
	{'in', 'tu', 'i', 'tion'},
	{'cir', 'cu', 'lat', 'ing'},
	{'con', 'fron', 'ta', 'tion'},
	{'ca', 'pac', 'i', 'tor'},
	{'sub', 'or', 'di', 'nate'},
	{'ar', 'tic', 'u', 'late'},
	{'me', 'di', 'a', 'tor'},
	{'cul', 'ti', 'vat', 'ed'},
	{'dis', 'con', 'nect', 'ed'},
	{'or', 'tho', 'pe', 'dic'},
	{'dis', 'a', 'gree', 'ment'},
	{'er', 'ro', 'ne', 'ous'},
	{'un', 'sup', 'port', 'ed'},
	{'in', 'tan', 'gi', 'ble'},
	{'com', 'pas', 'sion', 'ate'},
	{'cat', 'a', 'stroph', 'ic'},
	{'re', 'us', 'a', 'ble'},
	{'chem', 'i', 'cal', 'ly'},
	{'non', 'com', 'mer', 'cial'},
	{'dep', 'ri', 'va', 'tion'},
	{'u', 'ni', 'form', 'ly'},
	{'fa', 'vor', 'a', 'ble'},
	{'ac', 'cu', 'mu', 'late'},
	{'frag', 'men', 'ta', 'tion'},
	{'par', 'a', 'nor', 'mal'},
	{'pref', 'er', 'a', 'ble'},
	{'a', 'dren', 'a', 'line'},
	{'mam', 'ma', 'li', 'an'},
	{'au', 'di', 'to', 'ry'},
	{'con', 'cen', 'trat', 'ing'},
	{'du', 'pli', 'cat', 'ed'},
	{'re', 'lo', 'cat', 'ing'},
	{'a', 'nom', 'a', 'ly'},
	{'u', 'biq', 'ui', 'tous'},
	{'un', 'der', 'cov', 'er'},
	{'con', 'tin', 'u', 'al'},
	{'top', 'o', 'graph', 'ic'},
	{'punc', 'tu', 'a', 'tion'},
	{'a', 'fore', 'men', 'tioned'},
	{'zo', 'ol', 'o', 'gy'},
	{'vi', 'sion', 'ar', 'y'},
	{'dis', 'crim', 'i', 'nate'},
	{'trans', 'na', 'tion', 'al'},
	{'or', 'na', 'men', 'tal'},
	{'col', 'lect', 'a', 'ble'},
	{'con', 'tex', 'tu', 'al'},
	{'su', 'per', 'fi', 'cial'},
	{'cryp', 'tog', 'ra', 'phy'},
	{'ul', 'tra', 'son', 'ic'},
	{'qual', 'i', 'fi', 'er'},
	{'al', 'le', 'vi', 'ate'},
	{'de', 'for', 'ma', 'tion'},
	{'ex', 'ter', 'nal', 'ly'},
	{'su', 'per', 'vis', 'ing'},
	{'sol', 'i', 'tar', 'y'},
	{'ev', 'er', 'last', 'ing'},
	{'ge', 'o', 'phys', 'ics'},
	{'mi', 'cro', 'scop', 'ic'},
	{'tra', 'jec', 'to', 'ry'},
	{'bu', 'reauc', 'ra', 'cy'},
	{'as', 'tro', 'phys', 'ics'},
	{'neg', 'li', 'gi', 'ble'},
	{'ex', 'pand', 'a', 'ble'},
	{'dis', 'tin', 'guish', 'ing'},
	{'ven', 'tric', 'u', 'lar'},
	{'trans', 'fer', 'a', 'ble'},
	{'as', 'ton', 'ish', 'ing'},
	{'con', 'sult', 'a', 'tive'},
	{'proc', 'la', 'ma', 'tion'},
	{'im', 'po', 'si', 'tion'},
	{'dis', 'sem', 'i', 'nate'},
	{'spec', 'u', 'la', 'tive'},
	{'in', 'ti', 'ma', 'cy'},
	{'der', 'i', 'va', 'tion'},
	{'re', 'fin', 'er', 'y'},
	{'mar', 'ga', 'ri', 'ta'},
	{'men', 'tal', 'i', 'ty'},
	{'gen', 'er', 'ous', 'ly'},
	{'sa', 'lin', 'i', 'ty'},
	{'spe', 'cial', 'iz', 'ing'},
	{'det', 'ri', 'men', 'tal'},
	{'to', 'pog', 'ra', 'phy'},
	{'con', 'tem', 'plat', 'ed'},
	{'ad', 'o', 'les', 'cence'},
	{'ag', 'gres', 'sive', 'ly'},
	{'vis', 'cos', 'i', 'ty'},
	{'es', 'ti', 'ma', 'tor'},
	{'con', 'cur', 'rent', 'ly'},
	{'ca', 'tas', 'tro', 'phe'},
	{'e', 'lec', 'tri', 'cian'},
	{'un', 'au', 'thor', 'ised'},
	{'stu', 'pid', 'i', 'ty'},
	{'in', 'ca', 'pa', 'ble'},
	{'ac', 'knowl', 'edg', 'ment'},
	{'tri', 'an', 'gu', 'lar'},
	{'ex', 'ci', 'ta', 'tion'},
	{'bi', 'o', 'met', 'ric'},
	{'in', 'cu', 'ba', 'tion'},
	{'a', 'sym', 'met', 'ric'},
	{'log', 'i', 'cal', 'ly'},
	{'an', 'a', 'lys', 'ing'},
	{'or', 'gan', 'iz', 'er'},
	{'un', 'par', 'al', 'leled'},
	{'pref', 'er', 'en', 'tial'},
	{'ar', 'bi', 'tra', 'tor'},
	{'dras', 'ti', 'cal', 'ly'},
	{'aer', 'o', 'naut', 'ics'},
	{'pre', 'his', 'tor', 'ic'},
	{'in', 'ef', 'fi', 'cient'},
	{'ther', 'a', 'peu', 'tics'},
	{'con', 'stel', 'la', 'tion'},
	{'rem', 'i', 'nis', 'cent'},
	{'re', 'spon', 'sive', 'ness'},
	{'nav', 'i', 'gat', 'ing'},
	{'dis', 'sat', 'is', 'fied'},
	{'ag', 'gre', 'gat', 'ed'},
	{'au', 'then', 'ti', 'cate'},
	{'rad', 'i', 'cal', 'ly'},
	{'ter', 'mi', 'nat', 'ing'},
	{'cus', 'to', 'di', 'al'},
	{'in', 'te', 'gra', 'tor'},
	{'em', 'pha', 'siz', 'ing'},
	{'phe', 'nom', 'e', 'nal'},
	{'re', 'con', 'sid', 'er'},
	{'in', 'vo', 'ca', 'tion'},
	{'di', 'vin', 'i', 'ty'},
	{'er', 'go', 'nom', 'ics'},
	{'ob', 'liv', 'i', 'on'},
	{'ad', 'vis', 'a', 'ble'},
	{'ref', 'er', 'enc', 'ing'},
	{'os', 'cil', 'la', 'tor'},
	{'in', 'con', 'ti', 'nence'},
	{'un', 'beat', 'a', 'ble'},
	{'pro', 'gres', 'sive', 'ly'},
	{'ac', 'ti', 'vat', 'ing'},
	{'cal', 'i', 'brat', 'ed'},
	{'mis', 'de', 'mean', 'or'},
	{'im', 'plic', 'it', 'ly'},
	{'co', 'me', 'di', 'an'},
	{'sub', 'con', 'trac', 'tor'},
	{'psy', 'chi', 'a', 'trist'},
	{'al', 'li', 'ga', 'tor'},
	{'no', 'men', 'cla', 'ture'},
	{'vis', 'u', 'al', 'ize'},
	{'me', 'di', 'o', 'cre'},
	{'ref', 'or', 'ma', 'tion'},
	{'hy', 'poc', 'ri', 'sy'},
	{'com', 'pen', 'di', 'um'},
	{'tran', 'scrip', 'tion', 'al'},
	{'lo', 'co', 'mo', 'tive'},
	{'con', 'serv', 'an', 'cy'},
	{'el', 'lip', 'ti', 'cal'},
	{'stip', 'u', 'lat', 'ed'},
	{'o', 'rig', 'i', 'nate'},
	{'re', 'spect', 'a', 'ble'},
	{'dis', 'ap', 'pear', 'ance'},
	{'plu', 'ral', 'i', 'ty'},
	{'ad', 'ven', 'tur', 'ous'},
	{'dis', 'crep', 'an', 'cy'},
	{'re', 'lo', 'cat', 'ed'},
	{'di', 'vi', 'sion', 'al'},
	{'ac', 'knowl', 'edg', 'ing'},
	{'in', 'ter', 'pre', 'tive'},
	{'su', 'per', 'he', 'ro'},
	{'suf', 'fi', 'cien', 'cy'},
	{'cy', 'lin', 'dri', 'cal'},
	{'moun', 'tain', 'eer', 'ing'},
	{'de', 'o', 'dor', 'ant'},
	{'pho', 'to', 'cop', 'y'},
	{'in', 'ter', 'view', 'er'},
	{'il', 'lus', 'tra', 'tive'},
	{'pros', 'e', 'cut', 'ed'},
	{'ad', 'vo', 'cat', 'ing'},
	{'dys', 'lex', 'i', 'a'},
	{'mul', 'ti', 'pli', 'er'},
	{'pat', 'ri', 'ot', 'ism'},
	{'cap', 'i', 'tal', 'ized'},
	{'re', 'cep', 'tion', 'ist'},
	{'in', 'def', 'i', 'nite'},
	{'ir', 'ra', 'tion', 'al'},
	{'mi', 'gra', 'to', 'ry'},
	{'mis', 'un', 'der', 'stood'},
	{'ba', 'rom', 'e', 'ter'},
	{'pro', 'voc', 'a', 'tive'},
	{'se', 'lec', 'ta', 'ble'},
	{'in', 'fil', 'tra', 'tion'},
	{'or', 'thog', 'o', 'nal'},
	{'man', 'age', 'a', 'ble'},
	{'hu', 'mil', 'i', 'ty'},
	{'char', 'ac', 'ter', 'ised'},
	{'mod', 'i', 'fi', 'er'},
	{'bi', 'en', 'ni', 'al'},
	{'re', 'con', 'nais', 'sance'},
	{'ser', 'o', 'to', 'nin'},
	{'de', 'tach', 'a', 'ble'},
	{'con', 'dem', 'na', 'tion'},
	{'for', 'mi', 'da', 'ble'},
	{'po', 'lar', 'i', 'ty'},
	{'im', 'prop', 'er', 'ly'},
	{'fu', 'tur', 'is', 'tic'},
	{'ro', 'ta', 'tion', 'al'},
	{'se', 'lec', 'tive', 'ly'},
	{'al', 'le', 'ga', 'tion'},
	{'in', 'fi', 'nite', 'ly'},
	{'syn', 'the', 'siz', 'er'},
	{'gym', 'na', 'si', 'um'},
	{'res', 'ti', 'tu', 'tion'},
	{'ger', 'i', 'at', 'ric'},
	{'sub', 'sti', 'tut', 'ing'},
	{'cryp', 'to', 'graph', 'ic'},
	{'dis', 'con', 'tin', 'ue'},
	{'con', 'tam', 'i', 'nant'},
	{'glad', 'i', 'a', 'tor'},
	{'re', 'in', 'sur', 'ance'},
	{'en', 'er', 'giz', 'er'},
	{'bi', 'o', 'met', 'rics'},
	{'it', 'er', 'a', 'tive'},
	{'gram', 'mat', 'i', 'cal'},
	{'cin', 'e', 'mat', 'ic'},
	{'ad', 'mi', 'ra', 'tion'},
	{'en', 'force', 'a', 'ble'},
	{'nom', 'i', 'nat', 'ing'},
	{'cha', 'me', 'le', 'on'},
	{'pre', 'dom', 'i', 'nant'},
	{'em', 'bar', 'rass', 'ment'},
	{'met', 'a', 'phys', 'ics'},
	{'res', 'pi', 'ra', 'tion'},
	{'cal', 'lig', 'ra', 'phy'},
	{'ad', 'van', 'ta', 'geous'},
	{'as', 'par', 'a', 'gus'},
	{'il', 'lus', 'trat', 'ing'},
	{'ad', 'mit', 'ted', 'ly'},
	{'na', 'tiv', 'i', 'ty'},
	{'e', 'lec', 'tor', 'ate'},
	{'re', 'con', 'struct', 'ed'},
	{'par', 'a', 'noi', 'a'},
	{'fas', 'ci', 'nat', 'ed'},
	{'su', 'per', 'sed', 'ed'},
	{'im', 'por', 'ta', 'tion'},
	{'ac', 'cor', 'di', 'on'},
	{'min', 'i', 'mal', 'ly'},
	{'im', 'mac', 'u', 'late'},
	{'in', 'te', 'gra', 'tive'},
	{'ad', 'vo', 'cat', 'ed'},
	{'de', 'vo', 'tion', 'al'},
	{'hy', 'dro', 'log', 'ic'},
	{'clar', 'i', 'fy', 'ing'},
	{'du', 'al', 'i', 'ty'},
	{'sen', 'sa', 'tion', 'al'},
	{'bin', 'oc', 'u', 'lar'},
	{'de', 'tect', 'a', 'ble'},
	{'in', 'cli', 'na', 'tion'},
	{'a', 'men', 'i', 'ty'},
	{'mul', 'ti', 'ply', 'ing'},
	{'pho', 'tom', 'e', 'try'},
	{'di', 'ag', 'nos', 'ing'},
	{'cor', 'ru', 'gat', 'ed'},
	{'cer', 'ti', 'fy', 'ing'},
	{'fe', 'lic', 'i', 'ty'},
	{'as', 'ymp', 'tot', 'ic'},
	{'fas', 'ci', 'na', 'tion'},
	{'pre', 'ven', 'ta', 'tive'},
	{'des', 'per', 'a', 'tion'},
	{'cat', 'e', 'go', 'rised'},
	{'mon', 'u', 'men', 'tal'},
	{'un', 'af', 'fect', 'ed'},
	{'en', 'ter', 'tain', 'er'},
	{'ir', 'ri', 'tat', 'ing'},
	{'har', 'mon', 'i', 'ca'},
	{'es', 'pi', 'o', 'nage'},
	{'in', 'cu', 'ba', 'tor'},
	{'dev', 'as', 'ta', 'tion'},
	{'in', 'dif', 'fer', 'ent'},
	{'al', 'lo', 'cat', 'ing'},
	{'bu', 'reau', 'crat', 'ic'},
	{'su', 'prem', 'a', 'cy'},
	{'rep', 'li', 'cat', 'ed'},
	{'dev', 'as', 'tat', 'ed'},
	{'mo', 'ti', 'vat', 'ing'},
	{'in', 'hab', 'it', 'ed'},
	{'ob', 'serv', 'a', 'ble'},
	{'vig', 'or', 'ous', 'ly'},
	{'in', 'ter', 'fer', 'ing'},
	{'des', 'ig', 'nat', 'ing'},
	{'as', 'pi', 'ra', 'tion'},
	{'a', 'vi', 'a', 'tor'},
	{'im', 'pli', 'cat', 'ed'},
	{'se', 'ri', 'ous', 'ness'},
	{'con', 'for', 'ma', 'tion'},
	{'syn', 'on', 'y', 'mous'},
	{'ac', 'ti', 'va', 'tor'},
	{'in', 'dem', 'ni', 'fy'},
	{'ab', 'o', 'li', 'tion'},
	{'a', 'chiev', 'a', 'ble'},
	{'in', 'ter', 'cep', 'tion'},
	{'con', 'den', 'sa', 'tion'},
	{'com', 'men', 'ta', 'tor'},
	{'o', 'ver', 'see', 'ing'},
	{'es', 'ca', 'la', 'tion'},
	{'pol', 'y', 'mor', 'phism'},
	{'pa', 'ter', 'ni', 'ty'},
	{'ex', 'cel', 'si', 'or'},
	{'cap', 'i', 'tal', 'ize'},
	{'con', 'grat', 'u', 'late'},
	{'leg', 'is', 'la', 'tor'},
	{'tax', 'o', 'nom', 'ic'},
	{'no', 'ti', 'fy', 'ing'},
	{'de', 'lin', 'quen', 'cy'},
	{'sen', 'ti', 'ment', 'al'},
	{'un', 'suit', 'a', 'ble'},
	{'es', 'o', 'ter', 'ic'},
	{'graph', 'i', 'cal', 'ly'},
	{'in', 'debt', 'ed', 'ness'},
	{'ad', 'ver', 'sar', 'y'},
	{'per', 'cep', 'tu', 'al'},
	{'fer', 'men', 'ta', 'tion'},
	{'in', 'com', 'pe', 'tent'},
	{'ac', 'tu', 'a', 'tor'},
	{'sim', 'pli', 'fy', 'ing'},
	{'fore', 'see', 'a', 'ble'},
	{'le', 'gal', 'i', 'ty'},
	{'bi', 'ol', 'o', 'gist'},
	{'ad', 'mi', 'ral', 'ty'},
	{'plu', 'to', 'ni', 'um'},
	{'ca', 'pac', 'i', 'tance'},
	{'un', 'au', 'dit', 'ed'},
	{'un', 'de', 'cid', 'ed'},
	{'e', 'piph', 'a', 'ny'},
	{'mel', 'an', 'chol', 'y'},
	{'in', 'dif', 'fer', 'ence'},
	{'in', 'car', 'na', 'tion'},
	{'ad', 'mis', 'si', 'ble'},
	{'ter', 'ri', 'fy', 'ing'},
	{'sea', 'son', 'al', 'ly'},
	{'rhe', 'tor', 'i', 'cal'},
	{'e', 'qual', 'iz', 'er'},
	{'com', 'pli', 'ca', 'tion'},
	{'a', 'dapt', 'a', 'ble'},
	{'trans', 'ac', 'tion', 'al'},
	{'com', 'pro', 'mis', 'ing'},
	{'pro', 'gram', 'mat', 'ic'},
	{'bar', 'ra', 'cu', 'da'},
	{'con', 'tem', 'plat', 'ing'},
	{'tran', 'quil', 'i', 'ty'},
	{'re', 'in', 'state', 'ment'},
	{'ag', 'ri', 'busi', 'ness'},
	{'hes', 'i', 'ta', 'tion'},
	{'ve', 'hic', 'u', 'lar'},
	{'cor', 'o', 'na', 'tion'},
	{'e', 'nor', 'mous', 'ly'},
	{'com', 'ple', 'ment', 'ed'},
	{'o', 'pac', 'i', 'ty'},
	{'cen', 'te', 'nar', 'y'},
	{'in', 'ter', 'ven', 'ing'},
	{'un', 'in', 'tend', 'ed'},
	{'un', 'at', 'tend', 'ed'},
	{'dis', 'si', 'pa', 'tion'},
	{'af', 'fir', 'ma', 'tion'},
	{'per', 'tur', 'ba', 'tion'},
	{'eu', 'ca', 'lyp', 'tus'},
	{'au', 'to', 'mat', 'ing'},
	{'sen', 'ior', 'i', 'ty'},
	{'re', 'cep', 'ta', 'cle'},
	{'o', 'ver', 'rid', 'ing'},
	{'for', 'mu', 'lat', 'ing'},
	{'con', 'spic', 'u', 'ous'},
	{'bar', 'bar', 'i', 'an'},
	{'par', 'a', 'sit', 'ic'},
	{'or', 'tho', 'pe', 'dics'},
	{'ap', 'pe', 'tiz', 'er'},
	{'te', 'lem', 'e', 'try'},
	{'con', 'sum', 'a', 'ble'},
	{'sta', 'bi', 'liz', 'er'},
	{'cre', 'a', 'tive', 'ly'},
	{'tre', 'men', 'dous', 'ly'},
	{'os', 'cil', 'la', 'tion'},
	{'au', 'tom', 'a', 'ta'},
	{'mi', 'rac', 'u', 'lous'},
	{'ex', 'ceed', 'ing', 'ly'},
	{'un', 'pro', 'tect', 'ed'},
	{'re', 'stor', 'a', 'tive'},
	{'de', 'cen', 'tral', 'ized'},
	{'rec', 'og', 'nis', 'ing'},
	{'mal', 'nu', 'tri', 'tion'},
	{'func', 'tion', 'al', 'ly'},
	{'cap', 'puc', 'ci', 'no'},
	{'trans', 'at', 'lan', 'tic'},
	{'in', 'su', 'lat', 'ing'},
	{'an', 'tiq', 'ui', 'ties'},
	{'seg', 're', 'gat', 'ed'},
	{'tech', 'nol', 'o', 'gist'},
	{'a', 'quar', 'i', 'ums'},
	{'ir', 'ri', 'ta', 'ble'},
	{'lo', 'gis', 'ti', 'cal'},
	{'tem', 'per', 'a', 'ment'},
	{'char', 'is', 'mat', 'ic'},
	{'a', 'sym', 'me', 'try'},
	{'av', 'o', 'ca', 'do'},
	{'dis', 'qual', 'i', 'fied'},
	{'lib', 'er', 'at', 'ed'},
	{'vic', 'to', 'ri', 'ous'},
	{'al', 'pha', 'bet', 'ic'},
	{'mo', 'der', 'ni', 'ty'},
	{'neu', 'tral', 'i', 'ty'},
	{'re', 'pro', 'duc', 'ing'},
	{'im', 'prob', 'a', 'ble'},
	{'a', 'typ', 'i', 'cal'},
	{'ex', 'ces', 'sive', 'ly'},
	{'fa', 'vor', 'a', 'bly'},
	{'a', 'nom', 'a', 'lous'},
	{'su', 'per', 'no', 'va'},
	{'mul', 'ti', 'pur', 'pose'},
	{'re', 'u', 'nit', 'ed'},
	{'con', 'so', 'la', 'tion'},
	{'al', 'ter', 'nate', 'ly'},
	{'an', 'tag', 'o', 'nist'},
	{'e', 'lec', 'tro', 'lyte'},
	{'piz', 'ze', 'ri', 'a'},
	{'el', 'e', 'gant', 'ly'},
	{'ir', 'ri', 'gat', 'ed'},
	{'rel', 'e', 'van', 'cy'},
	{'ty', 'pog', 'ra', 'phy'},
	{'mar', 'ket', 'a', 'ble'},
	{'re', 'cord', 'a', 'ble'},
	{'def', 'a', 'ma', 'tion'},
	{'per', 'fo', 'rat', 'ed'},
	{'in', 'ten', 'si', 'fied'},
	{'re', 'spon', 'si', 'bly'},
	{'com', 'mem', 'o', 'rate'},
	{'cap', 'tiv', 'i', 'ty'},
	{'sin', 'cer', 'i', 'ty'},
	{'im', 'ag', 'in', 'ing'},
	{'re', 'gion', 'al', 'ly'},
	{'con', 'ceiv', 'a', 'ble'},
	{'ob', 'jec', 'tive', 'ly'},
	{'in', 'no', 'va', 'tor'},
	{'guard', 'i', 'an', 'ship'},
	{'cap', 'ti', 'vat', 'ing'},
	{'pros', 'e', 'cut', 'ing'},
	{'ag', 'i', 'ta', 'tion'},
	{'lin', 'e', 'ar', 'ly'},
	{'pun', 'ish', 'a', 'ble'},
	{'mod', 'u', 'la', 'tor'},
	{'un', 'de', 'ter', 'mined'},
	{'cir', 'cum', 'fer', 'ence'},
	{'ven', 'er', 'a', 'ble'},
	{'ad', 'mi', 'ra', 'ble'},
	{'il', 'lu', 'mi', 'nate'},
	{'wa', 'ter', 'mel', 'on'},
	{'sim', 'u', 'lat', 'ing'},
	{'no', 'bil', 'i', 'ty'},
	{'non', 'com', 'pli', 'ance'},
	{'con', 'fi', 'dent', 'ly'},
	{'dan', 'ger', 'ous', 'ly'},
	{'de', 'hy', 'dra', 'tion'},
	{'con', 'sti', 'tut', 'ing'},
	{'in', 'com', 'plete', 'ness'},
	{'e', 'lec', 'tri', 'fied'},
	{'du', 'pli', 'cat', 'ing'},
	{'kil', 'o', 'me', 'ter'},
	{'re', 'luc', 'tant', 'ly'},
	{'cen', 'trif', 'u', 'gal'},
	{'de', 'cid', 'ed', 'ly'},
	{'sto', 'ry', 'tell', 'er'},
	{'pe', 'riph', 'er', 'y'},
	{'con', 'tem', 'pla', 'tion'},
	{'lam', 'i', 'nat', 'ing'},
	{'symp', 'to', 'mat', 'ic'},
	{'su', 'per', 'sti', 'tion'},
	{'an', 'ec', 'do', 'tal'},
	{'ac', 'cu', 'sa', 'tion'},
	{'dec', 'o', 'ra', 'tor'},
	{'har', 'mo', 'ni', 'ous'},
	{'sym', 'met', 'ri', 'cal'},
	{'mo', 'dal', 'i', 'ty'},
	{'par', 'a', 'med', 'ic'},
	{'com', 'men', 'su', 'rate'},
	{'sum', 'ma', 'riz', 'ing'},
	{'un', 'qual', 'i', 'fied'},
	{'rec', 'ol', 'lec', 'tion'},
	{'sub', 'lim', 'i', 'nal'},
	{'ex', 'cla', 'ma', 'tion'},
	{'bal', 'le', 'ri', 'na'},
	{'con', 'sci', 'en', 'tious'},
	{'fa', 'tal', 'i', 'ty'},
	{'se', 'quen', 'tial', 'ly'},
	{'per', 'se', 'ver', 'ance'},
	{'a', 'gree', 'a', 'ble'},
	{'in', 'ter', 'fac', 'ing'},
	{'fig', 'ur', 'a', 'tive'},
	{'un', 'pop', 'u', 'lar'},
	{'un', 'dis', 'cov', 'ered'},
	{'dil', 'i', 'gent', 'ly'},
	{'il', 'log', 'i', 'cal'},
	{'car', 'tog', 'ra', 'phy'},
	{'e', 'lon', 'gat', 'ed'},
	{'as', 'tron', 'o', 'mer'},
	{'in', 'com', 'pe', 'tence'},
	{'sta', 'bi', 'liz', 'ing'},
	{'ret', 'ro', 'ac', 'tive'},
	{'cas', 'u', 'al', 'ly'},
	{'im', 'prac', 'ti', 'cal'},
	{'ef', 'fort', 'less', 'ly'},
	{'in', 'for', 'mal', 'ly'},
	{'al', 'ter', 'na', 'tor'},
	{'un', 'der', 'writ', 'er'},
	{'guar', 'an', 'tee', 'ing'},
	{'e', 'phem', 'er', 'a'},
	{'min', 'i', 'mal', 'ist'},
	{'pro', 'tag', 'o', 'nist'},
	{'pro', 'pen', 'si', 'ty'},
	{'jour', 'nal', 'is', 'tic'},
	{'pa', 'pa', 'raz', 'zi'},
	{'in', 'ter', 'cep', 'tor'},
	{'im', 'pov', 'er', 'ished'},
	{'o', 'ri', 'ga', 'mi'},
	{'re', 'set', 'tle', 'ment'},
	{'mis', 'tak', 'en', 'ly'},
	{'ra', 'di', 'a', 'tive'},
	{'ex', 'trem', 'i', 'ty'},
	{'clas', 'si', 'fi', 'er'},
	{'col', 'os', 'se', 'um'},
	{'stip', 'u', 'la', 'tion'},
	{'con', 'ju', 'gat', 'ed'},
	{'pow', 'er', 'ful', 'ly'},
	{'clas', 'si', 'fy', 'ing'},
	{'un', 'der', 'min', 'ing'},
	{'dis', 'hon', 'es', 'ty'},
	{'struc', 'tur', 'al', 'ly'},
	{'mod', 'u', 'lat', 'ed'},
	{'ka', 'lei', 'do', 'scope'},
	{'hol', 'o', 'graph', 'ic'},
	{'mer', 'ce', 'nar', 'ies'},
	{'ap', 'pre', 'hen', 'sion'},
	{'ad', 'ver', 'si', 'ty'},
	{'be', 'liev', 'a', 'ble'},
	{'cu', 'ri', 'ous', 'ly'},
	{'cul', 'mi', 'nat', 'ing'},
	{'mel', 'a', 'to', 'nin'},
	{'mon', 'o', 'lith', 'ic'},
	{'ha', 'bit', 'u', 'al'},
	{'du', 'pli', 'ca', 'tor'},
	{'con', 'glom', 'er', 'ate'},
	{'pro', 'por', 'tion', 'ate'},
	{'a', 'cid', 'i', 'ty'},
	{'fluc', 'tu', 'a', 'tion'},
	{'u', 'ni', 'fy', 'ing'},
	{'es', 'ca', 'lat', 'ing'},
	{'in', 'ter', 'stel', 'lar'},
	{'mag', 'ni', 'fy', 'ing'},
	{'path', 'o', 'gen', 'ic'},
	{'po', 'si', 'tion', 'al'},
	{'a', 'pol', 'o', 'gise'},
	{'ex', 'is', 'ten', 'tial'},
	{'un', 'trans', 'lat', 'ed'},
	{'hy', 'per', 'bol', 'ic'},
	{'pleas', 'ur', 'a', 'ble'},
	{'ap', 'por', 'tion', 'ment'},
	{'cat', 'e', 'go', 'rize'},
	{'in', 'can', 'des', 'cent'},
	{'i', 'so', 'lat', 'ing'},
	{'ir', 'ri', 'tat', 'ed'},
	{'div', 'i', 'na', 'tion'},
	{'cul', 'ti', 'vat', 'ing'},
	{'re', 'fin', 'er', 'ies'},
	{'dor', 'mi', 'to', 'ry'},
	{'con', 'fis', 'cat', 'ed'},
	{'re', 'in', 'stat', 'ed'},
	{'eu', 'pho', 'ri', 'a'},
	{'se', 'ri', 'al', 'ized'},
	{'com', 'bus', 'ti', 'ble'},
	{'log', 'a', 'rith', 'mic'},
	{'dis', 'til', 'la', 'tion'},
	{'car', 'i', 'ca', 'ture'},
	{'ap', 'pli', 'ca', 'tor'},
	{'mu', 'si', 'cal', 'ly'},
	{'in', 'ten', 'si', 'fy'},
	{'dis', 'in', 'fec', 'tion'},
	{'req', 'ui', 'si', 'tion'},
	{'in', 'vin', 'ci', 'ble'},
	{'fa', 'mil', 'iar', 'ize'},
	{'con', 'tin', 'u', 'ance'},
	{'un', 'rec', 'og', 'nized'},
	{'af', 'fec', 'tion', 'ate'},
	{'trans', 'la', 'tion', 'al'},
	{'un', 'im', 'por', 'tant'},
	{'in', 'ter', 'sti', 'tial'},
	{'su', 'per', 'son', 'ic'},
	{'per', 'se', 'cut', 'ed'},
	{'de', 'cid', 'u', 'ous'},
	{'phil', 'an', 'throp', 'ic'},
	{'su', 'per', 'pow', 'er'},
	{'im', 'pec', 'ca', 'ble'},
	{'un', 'dis', 'put', 'ed'},
	{'di', 'ver', 'si', 'fy'},
	{'qua', 'ter', 'nar', 'y'},
	{'crit', 'i', 'ciz', 'ing'},
	{'pas', 'sion', 'ate', 'ly'},
	{'ex', 'cel', 'len', 'cy'},
	{'jus', 'ti', 'fy', 'ing'},
	{'mois', 'tur', 'iz', 'er'},
	{'vir', 'tu', 'o', 'so'},
	{'an', 'a', 'mor', 'phic'},
	{'re', 'al', 'iz', 'ing'},
	{'dex', 'ter', 'i', 'ty'},
	{'il', 'lit', 'er', 'ate'},
	{'pre', 'ma', 'ture', 'ly'},
	{'ad', 'ven', 'tur', 'er'},
	{'ex', 'em', 'pli', 'fied'},
	{'mac', 'a', 'ro', 'ni'},
	{'e', 'vac', 'u', 'ate'},
	{'con', 'com', 'i', 'tant'},
	{'vac', 'ci', 'nat', 'ed'},
	{'dis', 'ap', 'prov', 'al'},
	{'per', 'mu', 'ta', 'tion'},
	{'an', 'a', 'con', 'da'},
	{'mil', 'li', 'me', 'ter'},
	{'de', 'com', 'pres', 'sion'},
	{'ol', 'fac', 'to', 'ry'},
	{'ver', 'nac', 'u', 'lar'},
	{'sub', 'di', 'vid', 'ed'},
	{'re', 'gen', 'er', 'ate'},
	{'re', 'de', 'fin', 'ing'},
	{'trans', 'lo', 'ca', 'tion'},
	{'in', 'con', 'ven', 'ient'},
	{'re', 'in', 'vest', 'ment'},
	{'pol', 'y', 'sty', 'rene'},
	{'chi', 'ro', 'prac', 'tor'},
	{'vi', 'bra', 'tion', 'al'},
	{'ob', 'sid', 'i', 'an'},
	{'cul', 'mi', 'na', 'tion'},
	{'com', 'par', 'a', 'tor'},
	{'the', 'o', 'ret', 'ic'},
	{'in', 'ver', 'te', 'brate'},
	{'spec', 'tro', 'scop', 'ic'},
	{'met', 'al', 'work', 'ing'},
	{'tel', 'e', 'scop', 'ic'},
	{'ret', 'ri', 'bu', 'tion'},
	{'for', 'ti', 'fy', 'ing'},
	{'re', 'con', 'struc', 'tive'},
	{'mo', 'men', 'tar', 'y'},
	{'par', 'a', 'bol', 'ic'},
	{'tab', 'u', 'la', 'tion'},
	{'ob', 'liv', 'i', 'ous'},
	{'cau', 'li', 'flow', 'er'},
	{'un', 'bear', 'a', 'ble'},
	{'per', 'pe', 'trat', 'ed'},
	{'moz', 'za', 'rel', 'la'},
	{'ap', 'pre', 'cia', 'tive'},
	{'vol', 'u', 'met', 'ric'},
	{'il', 'lus', 'tri', 'ous'},
	{'mag', 'i', 'cal', 'ly'},
	{'chron', 'i', 'cal', 'ly'},
	{'in', 'fes', 'ta', 'tion'},
	{'to', 'tal', 'i', 'ty'},
	{'au', 'to', 'pi', 'lot'},
	{'ex', 'ca', 'vat', 'ed'},
	{'ex', 'ca', 'vat', 'ing'},
	{'re', 'cov', 'er', 'ies'},
	{'ra', 'di', 'at', 'ed'},
	{'ex', 'trav', 'a', 'gant'},
	{'in', 'val', 'i', 'date'},
	{'cau', 'sal', 'i', 'ty'},
	{'at', 'trac', 'tive', 'ness'},
	{'ca', 'lam', 'i', 'ty'},
	{'re', 'peat', 'a', 'ble'},
	{'quan', 'ti', 'za', 'tion'},
	{'dis', 'lo', 'ca', 'tion'},
	{'os', 'ten', 'si', 'bly'},
	{'o', 'reg', 'a', 'no'},
	{'quin', 'tes', 'sen', 'tial'},
	{'me', 'te', 'or', 'ite'},
	{'ex', 'pe', 'di', 'ent'},
	{'nav', 'i', 'ga', 'ble'},
	{'mag', 'ni', 'fi', 'er'},
	{'in', 'ter', 'mis', 'sion'},
	{'in', 'den', 'ta', 'tion'},
	{'mar', 'i', 'nat', 'ed'},
	{'sub', 'mers', 'i', 'ble'},
	{'un', 'de', 'feat', 'ed'},
	{'un', 'sus', 'pect', 'ing'},
	{'un', 'der', 'stat', 'ed'},
	{'com', 'pan', 'ion', 'ship'},
	{'tran', 'scen', 'den', 'tal'},
	{'ex', 'tin', 'guish', 'er'},
	{'com', 'pen', 'sat', 'ing'},
	{'o', 'ver', 'rat', 'ed'},
	{'es', 'tu', 'ar', 'ies'},
	{'o', 'ver', 'rid', 'den'},
	{'ver', 'i', 'fi', 'er'},
	{'im', 'per', 'vi', 'ous'},
	{'an', 'a', 'lys', 'er'},
	{'al', 'go', 'rith', 'mic'},
	{'rec', 'ti', 'fi', 'er'},
	{'per', 'pe', 'tra', 'tor'},
	{'ac', 'tion', 'a', 'ble'},
	{'un', 'break', 'a', 'ble'},
	{'e', 'ter', 'nal', 'ly'},
	{'ven', 'ti', 'la', 'tor'},
	{'me', 'tic', 'u', 'lous'},
	{'un', 'us', 'a', 'ble'},
	{'ad', 'ver', 'sar', 'ies'},
	{'sal', 'a', 'man', 'der'},
	{'sys', 'tem', 'at', 'ics'},
	{'o', 'be', 'di', 'ent'},
	{'stat', 'i', 'cal', 'ly'},
	{'au', 'tom', 'a', 'ton'},
	{'in', 'su', 'la', 'tor'},
	{'nu', 'mer', 'a', 'tor'},
	{'car', 'bu', 're', 'tor'},
	{'re', 'a', 'lign', 'ment'},
	{'su', 'per', 'flu', 'ous'},
	{'un', 'reach', 'a', 'ble'},
	{'pa', 'ren', 'the', 'sis'},
	{'re', 'or', 'gan', 'ized'},
	{'in', 'fir', 'ma', 'ry'},
	{'au', 'dac', 'i', 'ty'},
	{'un', 're', 'al', 'ized'},
	{'in', 'fre', 'quent', 'ly'},
	{'un', 'for', 'giv', 'en'},
	{'re', 'as', 'sur', 'ance'},
	{'mil', 'len', 'ni', 'a'},
	{'sep', 'a', 'ra', 'ble'},
	{'hex', 'ag', 'o', 'nal'},
	{'bi', 'no', 'mi', 'al'},
	{'in', 'co', 'her', 'ent'},
	{'pur', 'ga', 'to', 'ry'},
	{'non', 'ex', 'ist', 'ent'},
	{'liq', 'ui', 'dat', 'ed'},
	{'trag', 'i', 'cal', 'ly'},
	{'mul', 'ti', 'col', 'or'},
	{'pro', 'pri', 'e', 'ty'},
	{'de', 'clar', 'a', 'tive'},
	{'at', 'tain', 'a', 'ble'},
	{'ob', 'scu', 'ri', 'ty'},
	{'co', 'ri', 'an', 'der'},
	{'e', 'voc', 'a', 'tive'},
	{'am', 'phib', 'i', 'an'},
	{'in', 'dig', 'na', 'tion'},
	{'re', 'it', 'er', 'ate'},
	{'al', 'ien', 'at', 'ed'},
	{'lib', 'er', 'at', 'ing'},
	{'con', 'sid', 'er', 'ate'},
	{'ex', 'tra', 'ne', 'ous'},
	{'mul', 'ti', 'lay', 'er'},
	{'con', 'cen', 'tra', 'tor'},
	{'dis', 'cour', 'ag', 'ing'},
	{'pre', 'serv', 'a', 'tive'},
	{'trib', 'u', 'la', 'tion'},
	{'con', 'trol', 'la', 'ble'},
	{'de', 'hy', 'drat', 'ed'},
	{'gen', 'er', 'al', 'ize'},
	{'mis', 'con', 'cep', 'tion'},
	{'im', 'pres', 'sion', 'ist'},
	{'rel', 'e', 'gat', 'ed'},
	{'pu', 'ri', 'fy', 'ing'},
	{'a', 'pol', 'o', 'gized'},
	{'ag', 'i', 'tat', 'ed'},
	{'rig', 'or', 'ous', 'ly'},
	{'em', 'a', 'nat', 'ing'},
	{'un', 'ed', 'it', 'ed'},
	{'am', 'phib', 'i', 'ous'},
	{'hes', 'i', 'tat', 'ed'},
	{'pre', 'car', 'i', 'ous'},
	{'en', 'ig', 'mat', 'ic'},
	{'in', 'tim', 'i', 'date'},
	{'con', 'sti', 'tu', 'tive'},
	{'or', 'ches', 'trat', 'ed'},
	{'im', 'pres', 'sion', 'ism'},
	{'ab', 'surd', 'i', 'ty'},
	{'ro', 'man', 'ti', 'cism'},
	{'cau', 'tion', 'ar', 'y'},
	{'un', 'think', 'a', 'ble'},
	{'an', 'ti', 'so', 'cial'},
	{'foun', 'da', 'tion', 'al'},
	{'un', 'war', 'rant', 'ed'},
	{'ter', 'mi', 'nal', 'ly'},
	{'re', 'vi', 'tal', 'ize'},
	{'per', 'me', 'a', 'ble'},
	{'ad', 'o', 'ra', 'tion'},
	{'chlo', 'rin', 'at', 'ed'},
	{'hy', 'poth', 'e', 'sized'},
	{'su', 'per', 'im', 'posed'},
	{'tab', 'u', 'lat', 'ed'},
	{'dan', 'de', 'li', 'on'},
	{'vis', 'u', 'al', 'ized'},
	{'os', 'cil', 'lo', 'scope'},
	{'in', 'au', 'di', 'ble'},
	{'fran', 'ti', 'cal', 'ly'},
	{'per', 'pet', 'u', 'ate'},
	{'in', 'ter', 'wo', 'ven'},
	{'a', 'bun', 'dant', 'ly'},
	{'dec', 'li', 'na', 'tion'},
	{'cam', 'er', 'a', 'man'},
	{'ren', 'o', 'vat', 'ing'},
	{'op', 'er', 'a', 'ble'},
	{'ag', 'gra', 'vat', 'ing'},
	{'un', 'mod', 'i', 'fied'},
	{'sa', 'tir', 'i', 'cal'},
	{'phe', 'no', 'typ', 'ic'},
	{'em', 'u', 'lat', 'ed'},
	{'tol', 'er', 'a', 'ble'},
	{'pro', 'ver', 'bi', 'al'},
	{'tran', 'quil', 'li', 'ty'},
	{'quan', 'ti', 'fy', 'ing'},
	{'re', 'fu', 'el', 'ing'},
	{'id', 'i', 'ot', 'ic'},
	{'di', 'chot', 'o', 'my'},
	{'grav', 'i', 'ta', 'tion'},
	{'pri', 'mor', 'di', 'al'},
	{'pre', 'con', 'di', 'tion'},
	{'con', 'sum', 'er', 'ism'},
	{'im', 'pu', 'ri', 'ty'},
	{'spec', 'u', 'lat', 'ed'},
	{'cop', 'y', 'writ', 'er'},
	{'per', 'sist', 'ent', 'ly'},
	{'fab', 'ri', 'cat', 'ing'},
	{'sub', 'li', 'ma', 'tion'},
	{'gen', 'er', 'al', 'ist'},
	{'gas', 'tron', 'o', 'my'},
	{'huck', 'le', 'ber', 'ry'},
	{'pre', 'dic', 'a', 'ment'},
	{'gra', 'tu', 'i', 'tous'},
	{'e', 'phem', 'er', 'al'},
	{'dis', 'sim', 'i', 'lar'},
	{'fluc', 'tu', 'at', 'ing'},
	{'cul', 'mi', 'nat', 'ed'},
	{'i', 'on', 'iz', 'ing'},
	{'ne', 'ces', 'si', 'tate'},
	{'rec', 'on', 'cil', 'ing'},
	{'des', 'o', 'la', 'tion'},
	{'me', 'di', 'at', 'ing'},
	{'res', 'o', 'na', 'tor'},
	{'dis', 'or', 'der', 'ly'},
	{'o', 'ver', 'pay', 'ment'},
	{'ver', 'i', 'ta', 'ble'},
	{'pos', 'ter', 'i', 'ty'},
	{'ab', 'nor', 'mal', 'ly'},
	{'re', 'frig', 'er', 'ate'},
	{'per', 'son', 'al', 'ise'},
	{'os', 'cil', 'lat', 'ing'},
	{'un', 'as', 'sist', 'ed'},
	{'in', 'sid', 'i', 'ous'},
	{'im', 'mu', 'ta', 'ble'},
	{'sem', 'i', 'co', 'lon'},
	{'sub', 'stan', 'ti', 'ate'},
	{'en', 'ter', 'pris', 'ing'},
	{'hab', 'i', 'ta', 'tion'},
	{'de', 'light', 'ful', 'ly'},
	{'co', 'in', 'cid', 'ed'},
	{'dig', 'i', 'tiz', 'ing'},
	{'trans', 'par', 'ent', 'ly'},
	{'del', 'i', 'cate', 'ly'},
	{'prov', 'o', 'ca', 'tion'},
	{'hor', 'ri', 'fy', 'ing'},
	{'in', 'ad', 'vert', 'ent'},
	{'clas', 'si', 'cal', 'ly'},
	{'cab', 'i', 'net', 'ry'},
	{'in', 'stinc', 'tive', 'ly'},
	{'per', 'ish', 'a', 'ble'},
	{'in', 'sa', 'tia', 'ble'},
	{'ex', 'qui', 'site', 'ly'},
	{'un', 'read', 'a', 'ble'},
	{'fa', 'nat', 'i', 'cal'},
	{'pred', 'i', 'cat', 'ed'},
	{'pre', 'his', 'to', 'ry'},
	{'dis', 'trib', 'u', 'tive'},
	{'bi', 'car', 'bo', 'nate'},
	{'pre', 'oc', 'cu', 'pied'},
	{'o', 'dom', 'e', 'ter'},
	{'grat', 'i', 'fy', 'ing'},
	{'de', 'lir', 'i', 'ous'},
	{'un', 'law', 'ful', 'ly'},
	{'un', 'stop', 'pa', 'ble'},
	{'com', 'mu', 'ta', 'tive'},
	{'ra', 'tion', 'al', 'ly'},
	{'re', 'as', 'sess', 'ment'},
	{'gen', 'er', 'a', 'tive'},
	{'dis', 'in', 'fect', 'ant'},
	{'un', 'jus', 'ti', 'fied'},
	{'u', 'ku', 'le', 'le'},
	{'re', 'lent', 'less', 'ly'},
	{'syn', 'chro', 'niz', 'ing'},
	{'un', 'or', 'tho', 'dox'},
	{'fer', 'ti', 'lis', 'er'},
	{'bi', 'o', 'log', 'ic'},
	{'sanc', 'tu', 'ar', 'ies'},
	{'un', 'der', 'state', 'ment'},
	{'lo', 'co', 'mo', 'tion'},
	{'ep', 'i', 'sod', 'ic'},
	{'in', 'tro', 'spec', 'tion'},
	{'un', 'di', 'vid', 'ed'},
	{'as', 'ton', 'ish', 'ment'},
	{'con', 'vo', 'lut', 'ed'},
	{'kin', 'e', 'mat', 'ic'},
	{'un', 'su', 'per', 'vised'},
	{'con', 'tem', 'pla', 'tive'},
	{'con', 'ju', 'ga', 'tion'},
	{'in', 'ten', 'sive', 'ly'},
	{'suc', 'ces', 'sive', 'ly'},
	{'pre', 'dict', 'a', 'bly'},
	{'dis', 'con', 'nec', 'tion'},
	{'un', 'con', 'scious', 'ly'},
	{'pro', 'hib', 'i', 'tive'},
	{'ro', 'tis', 'ser', 'ie'},
	{'pre', 'cip', 'i', 'tate'},
	{'col', 'laps', 'i', 'ble'},
	{'un', 'will', 'ing', 'ness'},
	{'de', 'fin', 'a', 'ble'},
	{'im', 'per', 'son', 'al'},
	{'fu', 'ri', 'ous', 'ly'},
	{'e', 'pit', 'o', 'me'},
	{'ac', 'tu', 'ar', 'ies'},
	{'reg', 'i', 'men', 'tal'},
	{'sig', 'ni', 'fy', 'ing'},
	{'un', 'sat', 'is', 'fied'},
	{'gen', 'er', 'al', 'ised'},
	{'sem', 'i', 'fi', 'nal'},
	{'de', 'ac', 'tiv', 'ate'},
	{'un', 'de', 'tect', 'ed'},
	{'mi', 'cro', 'struc', 'ture'},
	{'dis', 'as', 'sem', 'bly'},
	{'whole', 'heart', 'ed', 'ly'},
	{'in', 'e', 'las', 'tic'},
	{'le', 'vi', 'a', 'than'},
	{'pop', 'u', 'lar', 'ly'},
	{'min', 'i', 'mis', 'ing'},
	{'bi', 'fur', 'ca', 'tion'},
	{'nat', 'u', 'ral', 'ized'},
	{'in', 'flex', 'i', 'ble'},
	{'dis', 'till', 'er', 'y'},
	{'dis', 'en', 'gage', 'ment'},
	{'ir', 'rev', 'er', 'ent'},
	{'es', 'ca', 'lat', 'ed'},
	{'con', 'vo', 'lu', 'tion'},
	{'mis', 'man', 'age', 'ment'},
	{'con', 'vinc', 'ing', 'ly'},
	{'com', 'pla', 'cen', 'cy'},
	{'nec', 'ro', 'man', 'cer'},
	{'sub', 'con', 'ti', 'nent'},
	{'ab', 'er', 'ra', 'tion'},
	{'spec', 'i', 'fi', 'er'},
	{'con', 'clu', 'sive', 'ly'},
	{'hon', 'ey', 'suck', 'le'},
	{'eth', 'ni', 'cal', 'ly'},
	{'so', 'cial', 'iz', 'ing'},
	{'sed', 'en', 'tar', 'y'},
	{'trans', 'po', 'si', 'tion'},
	{'en', 'tan', 'gle', 'ment'},
	{'mis', 'er', 'a', 'bly'},
	{'nu', 'tri', 'tion', 'ist'},
	{'un', 'cor', 'rect', 'ed'},
	{'as', 'sim', 'i', 'late'},
	{'un', 're', 'port', 'ed'},
	{'ci', 'vil', 'i', 'ty'},
	{'in', 'trac', 'ta', 'ble'},
	{'e', 'nu', 'mer', 'ate'},
	{'cit', 'i', 'zen', 'ry'},
	{'re', 'deem', 'a', 'ble'},
	{'com', 'men', 'da', 'tion'},
	{'sur', 'gi', 'cal', 'ly'},
	{'ra', 'tion', 'al', 'ize'},
	{'in', 'con', 'clu', 'sive'},
	{'com', 'plic', 'i', 'ty'},
	{'al', 'le', 'go', 'ry'},
	{'cer', 'e', 'bel', 'lum'},
	{'ra', 'di', 'at', 'ing'},
	{'tax', 'i', 'der', 'my'},
	{'e', 'lu', 'ci', 'date'},
	{'am', 'pu', 'ta', 'tion'},
	{'cred', 'it', 'a', 'ble'},
	{'del', 'i', 'ca', 'cy'},
	{'fu', 'til', 'i', 'ty'},
	{'pol', 'li', 'na', 'tion'},
	{'in', 'to', 'na', 'tion'},
	{'hos', 'pi', 'ta', 'ble'},
	{'or', 'ches', 'tra', 'tion'},
	{'re', 'as', 'sign', 'ment'},
	{'di', 'vis', 'i', 'ble'},
	{'con', 'fis', 'ca', 'tion'},
	{'de', 'lin', 'e', 'ate'},
	{'path', 'o', 'log', 'ic'},
	{'com', 'mend', 'a', 'ble'},
	{'de', 'li', 'cious', 'ly'},
	{'un', 'ver', 'i', 'fied'},
	{'oc', 'a', 'ri', 'na'},
	{'ir', 'i', 'des', 'cent'},
	{'un', 'oc', 'cu', 'pied'},
	{'ra', 'pid', 'i', 'ty'},
	{'ob', 'so', 'let', 'ed'},
	{'re', 'ar', 'range', 'ment'},
	{'neu', 'tral', 'iz', 'ing'},
	{'for', 'mal', 'i', 'ty'},
	{'dec', 'i', 'ma', 'tion'},
	{'serv', 'ice', 'a', 'ble'},
	{'in', 'di', 'ges', 'tion'},
	{'de', 'lec', 'ta', 'ble'},
	{'ag', 'gre', 'gat', 'ing'},
	{'mon', 'o', 'ton', 'ic'},
	{'in', 'ter', 'cit', 'y'},
	{'car', 'to', 'graph', 'ic'},
	{'be', 'nev', 'o', 'lence'},
	{'sus', 'pi', 'cious', 'ly'},
	{'oc', 'cu', 'pi', 'er'},
	{'in', 'un', 'dat', 'ed'},
	{'ve', 'rac', 'i', 'ty'},
	{'en', 'er', 'giz', 'ing'},
	{'un', 'wit', 'ting', 'ly'},
	{'an', 'te', 'ced', 'ent'},
	{'vo', 'lup', 'tu', 'ous'},
	{'i', 'so', 'met', 'ric'},
	{'ex', 'ac', 'er', 'bate'},
	{'a', 'nem', 'o', 'ne'},
	{'de', 'ter', 'min', 'ism'},
	{'pan', 'a', 'ce', 'a'},
	{'nor', 'mal', 'i', 'ty'},
	{'per', 'fo', 'ra', 'tion'},
	{'ho', 'mog', 'e', 'nous'},
	{'med', 'i', 'cat', 'ed'},
	{'ex', 'pe', 'di', 'tious'},
	{'re', 'fill', 'a', 'ble'},
	{'prof', 'it', 'a', 'bly'},
	{'un', 'at', 'trac', 'tive'},
	{'ref', 'er', 'en', 'tial'},
	{'in', 'cog', 'ni', 'to'},
	{'ex', 'ca', 'va', 'tor'},
	{'pro', 'gen', 'i', 'tor'},
	{'un', 'speak', 'a', 'ble'},
	{'ar', 'ma', 'dil', 'lo'},
	{'pac', 'i', 'fi', 'er'},
	{'rel', 'a', 'tiv', 'ism'},
	{'de', 'bat', 'a', 'ble'},
	{'co', 'pol', 'y', 'mer'},
	{'sco', 'li', 'o', 'sis'},
	{'de', 'ci', 'sive', 'ly'},
	{'em', 'i', 'nent', 'ly'},
	{'de', 'vel', 'op', 'ment'},
	{'mer', 'ci', 'less', 'ly'},
	{'fi', 'na', 'liz', 'ing'},
	{'in', 'fal', 'li', 'ble'},
	{'ta', 'ran', 'tu', 'la'},
	{'ben', 'e', 'fac', 'tor'},
	{'tran', 'si', 'to', 'ry'},
	{'in', 'stan', 'ti', 'ate'},
	{'im', 'mo', 'bi', 'lized'},
	{'co', 'in', 'ci', 'dent'},
	{'en', 'vi', 'a', 'ble'},
	{'el', 'o', 'quent', 'ly'},
	{'ac', 'tu', 'at', 'ed'},
	{'am', 'biv', 'a', 'lent'},
	{'cap', 'ti', 'vat', 'ed'},
	{'lam', 'i', 'na', 'tion'},
	{'col', 'lo', 'ca', 'tion'},
	{'as', 'sur', 'ed', 'ly'},
	{'vig', 'i', 'lan', 'te'},
	{'dem', 'on', 'stra', 'tor'},
	{'dis', 're', 'spect', 'ful'},
	{'lat', 'er', 'al', 'ly'},
	{'el', 'e', 'vat', 'ing'},
	{'de', 'lu', 'sion', 'al'},
	{'per', 'spi', 'ra', 'tion'},
	{'liq', 'ui', 'da', 'tor'},
	{'fac', 'to', 'ri', 'al'},
	{'me', 'di', 'e', 'val'},
	{'met', 'a', 'mor', 'phic'},
	{'dis', 'lo', 'cat', 'ed'},
	{'con', 'ceiv', 'a', 'bly'},
	{'ex', 'u', 'ber', 'ant'},
	{'pen', 'in', 'su', 'lar'},
	{'an', 'aes', 'thet', 'ic'},
	{'dis', 'qual', 'i', 'fy'},
	{'dis', 'si', 'pat', 'ed'},
	{'mas', 'quer', 'ad', 'ing'},
	{'dis', 'cern', 'i', 'ble'},
	{'ep', 'i', 'der', 'mis'},
	{'trans', 'form', 'a', 'tive'},
	{'ra', 'vi', 'o', 'li'},
	{'tel', 'e', 'scop', 'ing'},
	{'tu', 'mul', 'tu', 'ous'},
	{'sym', 'bi', 'ot', 'ic'},
	{'o', 'ver', 'se', 'er'},
	{'cen', 'ti', 'me', 'ter'},
	{'fa', 'vor', 'a', 'bly'},
	{'hy', 'dro', 'ther', 'mal'},
	{'dis', 'cov', 'er', 'er'},
	{'ag', 'i', 'ta', 'tor'},
	{'strat', 'o', 'spher', 'ic'},
	{'tap', 'i', 'o', 'ca'},
	{'in', 'quis', 'i', 'tive'},
	{'me', 'nag', 'er', 'ie'},
	{'ap', 'pre', 'hen', 'sive'},
	{'mul', 'ti', 'thread', 'ed'},
	{'re', 'e', 'lec', 'tion'},
	{'pal', 'at', 'a', 'ble'},
	{'con', 'ser', 'va', 'tor'},
	{'e', 'las', 'to', 'mer'},
	{'hy', 'per', 'ac', 'tive'},
	{'non', 'vi', 'o', 'lence'},
	{'ex', 'pend', 'a', 'ble'},
	{'com', 'pli', 'cat', 'ing'},
	{'un', 'ob', 'tru', 'sive'},
	{'fra', 'gil', 'i', 'ty'},
	{'mul', 'tim', 'e', 'ter'},
	{'ox', 'y', 'mo', 'ron'},
	{'in', 'tro', 'spec', 'tive'},
	{'ag', 'gra', 'va', 'tion'},
	{'di', 'a', 'bol', 'ic'},
	{'de', 'mon', 'stra', 'ble'},
	{'con', 'struc', 'tive', 'ly'},
	{'des', 'pic', 'a', 'ble'},
	{'lib', 'er', 'a', 'tor'},
	{'re', 'dis', 'cov', 'er'},
	{'un', 're', 'spon', 'sive'},
	{'ep', 'i', 'cen', 'ter'},
	{'i', 'de', 'al', 'ized'},
	{'ex', 'change', 'a', 'ble'},
	{'neu', 'rol', 'o', 'gist'},
	{'es', 'ca', 'la', 'tor'},
	{'per', 'i', 'win', 'kle'},
	{'gra', 'tu', 'i', 'ty'},
	{'re', 'or', 'gan', 'ize'},
	{'re', 'cal', 'cu', 'late'},
	{'nu', 'cle', 'a', 'tion'},
	{'su', 'per', 'la', 'tive'},
	{'tet', 'ra', 'he', 'dron'},
	{'pro', 'fes', 'sor', 'ship'},
	{'mu', 'ti', 'lat', 'ed'},
	{'in', 'sti', 'tut', 'ing'},
	{'in', 'no', 'cent', 'ly'},
	{'in', 'te', 'gra', 'ble'},
	{'im', 'i', 'tat', 'ing'},
	{'ul', 'ti', 'ma', 'tum'},
	{'un', 'hap', 'pi', 'ness'},
	{'me', 'thod', 'i', 'cal'},
	{'mo', 'not', 'o', 'nous'},
	{'re', 'ju', 've', 'nate'},
	{'op', 'er', 'at', 'ic'},
	{'ma', 'lev', 'o', 'lent'},
	{'ad', 'ja', 'cen', 'cy'},
	{'an', 'tag', 'o', 'nism'},
	{'un', 'pro', 'duc', 'tive'},
	{'ne', 'far', 'i', 'ous'},
	{'no', 'ti', 'fi', 'er'},
	{'id', 'i', 'o', 'cy'},
	{'tan', 'ta', 'liz', 'ing'},
	{'rhi', 'noc', 'er', 'os'},
	{'to', 'pi', 'ar', 'y'},
	{'ex', 'tend', 'a', 'ble'},
	{'un', 'der', 'val', 'ued'},
	{'crim', 'i', 'nal', 'ly'},
	{'na', 'no', 'me', 'ter'},
	{'mar', 'i', 'on', 'ette'},
	{'in', 'dus', 'tri', 'als'},
	{'it', 'er', 'at', 'ed'},
	{'in', 'noc', 'u', 'ous'},
	{'e', 'vap', 'o', 'rate'},
	{'speed', 'om', 'e', 'ter'},
	{'non', 'sen', 'si', 'cal'},
	{'con', 'tam', 'i', 'nate'},
	{'vi', 'sion', 'ar', 'ies'},
	{'hi', 'ber', 'na', 'tion'},
	{'hul', 'la', 'ba', 'loo'},
	{'med', 'i', 'tat', 'ing'},
	{'a', 'troc', 'i', 'ty'},
	{'un', 'der', 'writ', 'ten'},
	{'re', 'gret', 'ta', 'bly'},
	{'non', 'at', 'tain', 'ment'},
	{'hy', 'per', 'bo', 'le'},
	{'ste', 'ril', 'i', 'ty'},
	{'lu', 'mi', 'nar', 'ies'},
	{'un', 're', 'lent', 'ing'},
	{'an', 'ti', 'quat', 'ed'},
	{'im', 'mov', 'a', 'ble'},
	{'ve', 'he', 'ment', 'ly'},
	{'in', 'an', 'i', 'mate'},
	{'de', 'pos', 'i', 'tor'},
	{'de', 'fen', 'sive', 'ly'},
	{'a', 'void', 'a', 'ble'},
	{'om', 'nip', 'o', 'tent'},
	{'re', 'ar', 'rang', 'ing'},
	{'ex', 'cit', 'ed', 'ly'},
	{'ap', 'proach', 'a', 'ble'},
	{'pis', 'ta', 'chi', 'o'},
	{'su', 'per', 'na', 'tant'},
	{'im', 'pe', 'ri', 'um'},
	{'su', 'per', 'charg', 'er'},
	{'ves', 'tib', 'u', 'lar'},
	{'cir', 'cum', 'stan', 'tial'},
	{'lam', 'i', 'na', 'tor'},
	{'non', 'spe', 'cif', 'ic'},
	{'col', 'or', 'a', 'tion'},
	{'pa', 'ri', 'e', 'tal'},
	{'il', 'leg', 'i', 'ble'},
	{'di', 'men', 'sion', 'less'},
	{'cen', 'tral', 'i', 'ty'},
	{'ad', 'mi', 'ra', 'bly'},
	{'su', 'per', 'sti', 'tious'},
	{'in', 'ter', 'ces', 'sion'},
	{'des', 'ig', 'na', 'tor'},
	{'un', 'con', 'test', 'ed'},
	{'bar', 'o', 'met', 'ric'},
	{'re', 'po', 'si', 'tion'},
	{'e', 'col', 'o', 'gist'},
	{'li', 'no', 'le', 'um'},
	{'ver', 'bos', 'i', 'ty'},
	{'a', 'pos', 'tro', 'phe'},
	{'vo', 'lu', 'mi', 'nous'},
	{'re', 'sil', 'ien', 'cy'},
	{'i', 'on', 'o', 'sphere'},
	{'car', 'niv', 'o', 'rous'},
	{'ter', 'i', 'ya', 'ki'},
	{'ap', 'pa', 'ri', 'tion'},
	{'un', 'sub', 'scrib', 'ing'},
	{'car', 'bon', 'at', 'ed'},
	{'chry', 'san', 'the', 'mum'},
	{'ep', 'i', 'lep', 'tic'},
	{'con', 'gress', 'wom', 'an'},
	{'hy', 'dro', 'chlo', 'ric'},
	{'com', 'put', 'a', 'ble'},
	{'dis', 'or', 'gan', 'ized'},
	{'dis', 'as', 'sem', 'ble'},
	{'pep', 'per', 'o', 'ni'},
	{'con', 'sum', 'ma', 'tion'},
	{'re', 'fresh', 'ing', 'ly'},
	{'di', 'min', 'u', 'tive'},
	{'mat', 'ri', 'mo', 'ny'},
	{'gran', 'u', 'lat', 'ed'},
	{'in', 'cur', 'a', 'ble'},
	{'cap', 'il', 'lar', 'ies'},
	{'ap', 'pen', 'dix', 'es'},
	{'sin', 'gu', 'lar', 'ly'},
	{'un', 'der', 'pin', 'nings'},
	{'pre', 'pos', 'ter', 'ous'},
	{'py', 'ram', 'i', 'dal'},
	{'rep', 'a', 'ra', 'tion'},
	{'in', 'fil', 'trat', 'ed'},
	{'syn', 'the', 'siz', 'ing'},
	{'en', 'cap', 'su', 'late'},
	{'tri', 'glyc', 'er', 'ide'},
	{'vin', 'di', 'cat', 'ed'},
	{'lu', 'mi', 'nes', 'cent'},
	{'per', 'co', 'la', 'tion'},
	{'ex', 'em', 'pli', 'fy'},
	{'re', 'trans', 'mit', 'ted'},
	{'de', 'fen', 'si', 'ble'},
	{'mod', 'u', 'lat', 'ing'},
	{'di', 'o', 'ram', 'a'},
	{'co', 'in', 'sur', 'ance'},
	{'im', 'pres', 'sive', 'ly'},
	{'lu', 'mi', 'nes', 'cence'},
	{'un', 'know', 'ing', 'ly'},
	{'psy', 'cho', 'met', 'ric'},
	{'ex', 'pres', 'sion', 'ism'},
	{'bi', 'og', 'ra', 'pher'},
	{'pe', 'nul', 'ti', 'mate'},
	{'im', 'mi', 'grat', 'ed'},
	{'in', 'som', 'ni', 'ac'},
	{'det', 'o', 'nat', 'ed'},
	{'pro', 'duc', 'tive', 'ly'},
	{'des', 'per', 'a', 'do'},
	{'so', 'lid', 'i', 'fy'},
	{'des', 'e', 'cra', 'tion'},
	{'cal', 'i', 'brat', 'ing'},
	{'per', 'tur', 'ba', 'tive'},
	{'ex', 'por', 'ta', 'tion'},
	{'mis', 'un', 'der', 'stand'},
	{'pains', 'tak', 'ing', 'ly'},
	{'de', 'cep', 'tive', 'ly'},
	{'sal', 'u', 'ta', 'tion'},
	{'al', 'ter', 'ca', 'tion'},
	{'trust', 'wor', 'thi', 'ness'},
	{'oc', 'tag', 'o', 'nal'},
	{'he', 'ret', 'i', 'cal'},
	{'ex', 'ag', 'ger', 'ate'},
	{'il', 'lu', 'so', 'ry'},
	{'spec', 'u', 'lat', 'ing'},
	{'my', 'o', 'pi', 'a'},
	{'ca', 'pac', 'i', 'tive'},
	{'un', 'e', 'vent', 'ful'},
	{'as', 'sas', 'si', 'nate'},
	{'un', 'wa', 'ver', 'ing'},
	{'as', 'tro', 'nau', 'tics'},
	{'am', 'biv', 'a', 'lence'},
	{'in', 'ter', 'tid', 'al'},
	{'mean', 'ing', 'ful', 'ly'},
	{'em', 'bel', 'lish', 'ment'},
	{'knowl', 'edg', 'a', 'ble'},
	{'in', 'del', 'i', 'ble'},
	{'mes', 'mer', 'iz', 'ing'},
	{'mi', 'crom', 'e', 'ter'},
	{'as', 'sign', 'a', 'ble'},
	{'in', 'ter', 'fa', 'cial'},
	{'in', 'ter', 'na', 'tion'},
	{'de', 'cen', 'tral', 'ised'},
	{'un', 'con', 'nect', 'ed'},
	{'stand', 'ard', 'iz', 'ing'},
	{'un', 'ob', 'struct', 'ed'},
	{'per', 'ma', 'nen', 'cy'},
	{'con', 'de', 'scend', 'ing'},
	{'re', 'vi', 'sion', 'ist'},
	{'un', 'ten', 'a', 'ble'},
	{'se', 'ri', 'al', 'ize'},
	{'mem', 'o', 'riz', 'ing'},
	{'un', 'touch', 'a', 'ble'},
	{'mul', 'ti', 'col', 'ored'},
	{'in', 'dus', 'tri', 'ous'},
	{'tem', 'po', 'ral', 'ly'},
	{'re', 'ap', 'point', 'ment'},
	{'at', 'trac', 'tive', 'ly'},
	{'com', 'mis', 'sar', 'y'},
	{'ar', 'che', 'typ', 'al'},
	{'non', 'met', 'al', 'lic'},
	{'o', 'ver', 'ly', 'ing'},
	{'nar', 'cis', 'sis', 'tic'},
	{'ap', 'a', 'thet', 'ic'},
	{'eq', 'ui', 'ta', 'bly'},
	{'hy', 'dro', 'phil', 'ic'},
	{'de', 'clas', 'si', 'fied'},
	{'in', 'sti', 'gat', 'ed'},
	{'su', 'per', 'struc', 'ture'},
	{'sym', 'bi', 'o', 'sis'},
	{'ger', 'ma', 'ni', 'um'},
	{'al', 'ler', 'gen', 'ic'},
	{'in', 'hab', 'it', 'ant'},
	{'pe', 'tu', 'ni', 'a'},
	{'em', 'u', 'lat', 'ing'},
	{'in', 'tu', 'ba', 'tion'},
	{'pig', 'men', 'ta', 'tion'},
	{'em', 'bez', 'zle', 'ment'},
	{'im', 'i', 'tat', 'ed'},
	{'char', 'ac', 'ter', 'ise'},
	{'la', 'bo', 'ri', 'ous'},
	{'al', 'tru', 'is', 'tic'},
	{'de', 'fi', 'ant', 'ly'},
	{'re', 'ad', 'mis', 'sion'},
	{'col', 'lo', 'qui', 'al'},
	{'re', 'con', 'nec', 'tion'},
	{'ac', 'tu', 'a', 'tion'},
	{'i', 'ma', 'gi', 'nes'},
	{'ex', 'u', 'ber', 'ance'},
	{'im', 'pos', 'si', 'bly'},
	{'hab', 'it', 'a', 'ble'},
	{'un', 'rav', 'el', 'ing'},
	{'non', 'du', 'ra', 'ble'},
	{'sub', 'ma', 'rin', 'er'},
	{'non', 'triv', 'i', 'al'},
	{'a', 'ris', 'to', 'crat'},
	{'dec', 'i', 'mat', 'ed'},
	{'re', 'gret', 'ta', 'ble'},
	{'fi', 'nal', 'i', 'ty'},
	{'al', 'ter', 'na', 'tion'},
	{'a', 'stig', 'ma', 'tism'},
	{'can', 'de', 'la', 'bra'},
	{'mil', 'len', 'ni', 'al'},
	{'hem', 'i', 'spher', 'ic'},
	{'or', 'a', 'to', 'ry'},
	{'aux', 'il', 'ia', 'ries'},
	{'sax', 'o', 'phon', 'ist'},
	{'mon', 'o', 'hy', 'drate'},
	{'en', 'er', 'get', 'ics'},
	{'co', 'nif', 'er', 'ous'},
	{'ef', 'fi', 'ca', 'cious'},
	{'phi', 'lan', 'thro', 'pist'},
	{'su', 'per', 'high', 'way'},
	{'as', 'sess', 'a', 'ble'},
	{'in', 'tri', 'cate', 'ly'},
	{'in', 'ter', 'dic', 'tion'},
	{'ir', 'ra', 'di', 'ance'},
	{'po', 'lar', 'iz', 'ing'},
	{'vi', 'car', 'i', 'ous'},
	{'as', 'ser', 'tive', 'ness'},
	{'per', 'son', 'a', 'ble'},
	{'meg', 'a', 'lith', 'ic'},
	{'an', 'tith', 'e', 'sis'},
	{'ac', 'cen', 'tu', 'ate'},
	{'i', 'de', 'al', 'ist'},
	{'so', 'lid', 'i', 'fied'},
	{'po', 'lyg', 'o', 'nal'},
	{'de', 'plor', 'a', 'ble'},
	{'re', 'in', 'tro', 'duced'},
	{'in', 'ces', 'sant', 'ly'},
	{'ag', 'o', 'niz', 'ing'},
	{'at', 'trib', 'ut', 'ing'},
	{'con', 'no', 'ta', 'tion'},
	{'al', 'ien', 'at', 'ing'},
	{'nor', 'mal', 'iz', 'ing'},
	{'an', 'i', 'mat', 'ing'},
	{'mer', 'cu', 'ri', 'al'},
	{'bes', 'ti', 'ar', 'y'},
	{'fac', 'tu', 'al', 'ly'},
	{'leg', 'is', 'lat', 'ed'},
	{'ex', 'or', 'bi', 'tant'},
	{'dis', 'en', 'fran', 'chised'},
	{'can', 'ni', 'bal', 'ism'},
	{'mod', 'ern', 'iz', 'ing'},
	{'re', 'tal', 'i', 'ate'},
	{'hy', 'phen', 'at', 'ed'},
	{'i', 'so', 'pro', 'pyl'},
	{'re', 'cer', 'ti', 'fied'},
	{'un', 'ad', 'just', 'ed'},
	{'fraud', 'u', 'lent', 'ly'},
	{'non', 'de', 'struc', 'tive'},
	{'hi', 'lar', 'i', 'ty'},
	{'ad', 'mo', 'ni', 'tion'},
	{'con', 'nect', 'ed', 'ness'},
	{'cal', 'i', 'bra', 'tor'},
	{'ty', 'po', 'graph', 'ic'},
	{'der', 'o', 'ga', 'tion'},
	{'ag', 'gres', 'sive', 'ness'},
	{'un', 'con', 'scious', 'ness'},
	{'gua', 'ca', 'mo', 'le'},
	{'del', 'e', 'gat', 'ing'},
	{'in', 'cip', 'i', 'ent'},
	{'scin', 'til', 'la', 'tion'},
	{'sur', 'vi', 'vor', 'ship'},
	{'pro', 'tec', 'tion', 'ism'},
	{'dis', 'tinc', 'tive', 'ly'},
	{'em', 'pha', 'sis', 'ing'},
	{'vin', 'di', 'ca', 'tion'},
	{'im', 'per', 'fec', 'tion'},
	{'in', 'dem', 'ni', 'fied'},
	{'te', 'lep', 'a', 'thy'},
	{'im', 'pa', 'tient', 'ly'},
	{'in', 'eq', 'ui', 'ty'},
	{'fa', 'nat', 'i', 'cism'},
	{'coun', 'ter', 'clock', 'wise'},
	{'im', 'plau', 'si', 'ble'},
	{'out', 'ra', 'geous', 'ly'},
	{'flu', 'id', 'i', 'ty'},
	{'in', 'or', 'di', 'nate'},
	{'in', 'ter', 'work', 'ing'},
	{'cir', 'cum', 'ven', 'tion'},
	{'max', 'i', 'mal', 'ly'},
	{'re', 'gion', 'al', 'ism'},
	{'an', 'ti', 'stat', 'ic'},
	{'mis', 'rep', 're', 'sent'},
	{'ex', 'trap', 'o', 'late'},
	{'rev', 'o', 'ca', 'ble'},
	{'mal', 'le', 'a', 'ble'},
	{'in', 'de', 'ci', 'sion'},
	{'trou', 'ble', 'shoot', 'er'},
	{'fab', 'ri', 'ca', 'tor'},
	{'om', 'ni', 'pres', 'ent'},
	{'pe', 'cu', 'liar', 'ly'},
	{'de', 'mon', 'stra', 'bly'},
	{'coun', 'cil', 'wom', 'an'},
	{'per', 'cep', 'ti', 'ble'},
	{'sil', 'hou', 'et', 'ted'},
	{'ex', 'ploit', 'a', 'ble'},
	{'dis', 'a', 'gree', 'ing'},
	{'re', 'ac', 'ti', 'vate'},
	{'re', 'de', 'ploy', 'ment'},
	{'ty', 'ran', 'ni', 'cal'},
	{'un', 'ac', 'count', 'ed'},
	{'in', 'fea', 'si', 'ble'},
	{'ded', 'i', 'cat', 'ing'},
	{'im', 'per', 'son', 'ate'},
	{'glo', 'ri', 'ous', 'ly'},
	{'pro', 'lif', 'er', 'ate'},
	{'en', 'cyc', 'li', 'cal'},
	{'com', 'pe', 'tent', 'ly'},
	{'pro', 'lon', 'ga', 'tion'},
	{'ox', 'y', 'to', 'cin'},
	{'com', 'press', 'i', 'ble'},
	{'ex', 'cel', 'lent', 'ly'},
	{'su', 'per', 'hu', 'man'},
	{'mag', 'nif', 'i', 'cence'},
	{'mod', 'ern', 'iz', 'ing'},
	{'py', 'ro', 'tech', 'nics'},
	{'cor', 're', 'lat', 'ing'},
	{'fu', 'mi', 'ga', 'tion'},
	{'pre', 'con', 'cep', 'tion'},
	{'oc', 'cip', 'i', 'tal'},
	{'pro', 'to', 'zo', 'a'},
	{'tel', 'e', 'graph', 'ic'},
	{'re', 'vi', 'tal', 'ized'},
	{'gen', 'tle', 'wom', 'an'},
	{'dys', 'top', 'i', 'a'},
	{'ex', 'trav', 'a', 'gance'},
	{'au', 'thor', 'iz', 'ing'},
	{'le', 'thal', 'i', 'ty'},
	{'mil', 'li', 'sec', 'ond'},
	{'ex', 'pe', 'dit', 'ing'},
	{'de', 'com', 'pos', 'ing'},
	{'com', 'mer', 'cial', 'ize'},
	{'em', 'bod', 'y', 'ing'},
	{'cou', 'ra', 'geous', 'ly'},
	{'in', 'ter', 'ro', 'gate'},
	{'ac', 'ro', 'bat', 'ic'},
	{'in', 'quis', 'i', 'tor'}
}

return packs, bonus, quikwords