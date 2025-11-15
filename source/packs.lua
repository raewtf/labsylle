-- TODO: make packs
-- TODO: make shapes packs
-- TODO: compile 3-syllable dictionary for quik-word

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
				start = {'ri', 'tu', 'al', 'to'},
				target = {'tu', 'to', 'ri', 'al'},
 				text = 'Welcome to Labsylle — a fun word game\nall about syllables! Swap syllable blocks to find\na target word from amid the shuffle.\nTry constructing a word from these blocks here!'
			},
			{
				start = {'der', 'won', 'ly', 'ful'},
				target = {'won', 'der', 'ful', 'ly'},
				text = 'Great work! Let\'s try another one. Your aim is to\nperform as few swaps as you can — your count\nis up in the top-right. If you make a mistake,\nyou can "retry puzzle" from the Slide menu.'
			},
			{
				start = {'der', 'wil', 'be', 'ly', 'ing'},
				target = {'be', 'wil', 'der', 'ing', 'ly'},
				text = 'Try one more standard one!\nIf you ever wanna take a break, you\ncan "suspend" from the Slide menu, and\ncome back to the puzzle in progress later.'
			},
			{
				start = {'world', 'lo', '', 'hel'},
				target = {'hel', 'lo', '', 'world'},
				text = 'Some puzzles can have empty "space" blocks, to\nindicate breaks between multiple words.\n\nMake sure these go into the correct places as well!'
			},
			{
				start = {'pi', 'sus', 'ish', 'ly', 'cious'},
				target = {'sus', 'pi', 'cious', 'ly', 'ish'},
				impostor = true,
				text = 'There could also be an "impostor" — a syllable\nthat doesn\'t even belong in the word! If\nyou see something that feels out of place, swap\nit into the box at the far-right.'
			},
			{
				start = {'til', 'vol', 'ty', 'i', 'a'},
				target = {'vol', 'a', 'til', 'i', 'ty'},
				bombs = {
					{
						key = 'i',
						swaps = 5,
						intensity = 0,
					},
				},
				text = 'Some syllable blocks also have a short temper.\nIf you swap them too many times, then\nthey\'ll KERPLODE!! ...Meaning you\'ll have\nto restart the level over again.'
			},
			{
				start = {'', 'ward', 'and', 'up', '', 'ward', 'on'},
				target = {'on', 'ward', '', 'and', '', 'up', 'ward'},
				text = 'That\'s the end of this tutorial!\n\nI hope you enjoy this game — as always, I put\na lot of love into it. Have fun!',
				tilevis = {
					width = 50,
				}
			},
		}
	},
	{
		name = 'Animals I',
		id = 'animals',
		subtitle = 'Standard Pak #1',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = true,
		puzzles = {
			{
				start = {'per', 'kee', 'zoo'},
				target = {'zoo', 'kee', 'per'}
			},
			{
				start = {'ray', 'eel', '', 'mo'},
				target = {'mo', 'ray', '', 'eel'}
			},
			{
				start = {'et', 'yel', 'jack', 'low'},
				target = {'yel', 'low', 'jack', 'et'}
			},
			{
				start = {'os', 'noc', 'er', 'rhi'},
				target = {'rhi', 'noc', 'er', 'os'}
			},
			{
				start = {'um', 'i', 'a', 'quar'},
				target = {'a', 'quar', 'i', 'um'}
			},
			{
				start = {'tain', '', 'on', 'moun', 'li'},
				target = {'moun', 'tain', '', 'li', 'on'},
				bombs = {
					{
						key = '',
						swaps = 4,
						intensity = 0,
					},
				},
			},
		}
		-- armadillo
		-- butterfly
		-- flamingo
		-- prairie dog
	},
	{
		name = 'Food & Drink I',
		id = 'food',
		subtitle = 'Standard Pak #',
		difficulty = 'Easy',
		contains_impostors = true,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- bakery
		-- nutrition
		-- umami
		-- marshmallow (mel)
		-- ingredient
		-- omnivore
		-- maple syrup
		-- macaroni (roo)
		-- appetizing
		-- asparagus
	},
	{
		name = 'Sports!',
		id = 'sports',
		subtitle = 'Standard Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- basketball
		-- marathon
		-- aerobics
		-- physical
		-- ice hockey
		-- table tennis
		-- triathlon
		-- figure skating
		-- gymnasium
		-- competition
	},
	{
		name = '',
		id = '',
		subtitle = 'Standard Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = 'Musical I',
		id = 'musical',
		subtitle = 'Standard Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- clarinet
		-- classical
		-- mandolin
		-- accordion
		-- harmonica
		-- tambourine
		-- ukulele (lay)
		-- hurdy-gurdy
		-- alternative
		-- synthesizer
	},
	{
		name = '',
		id = '',
		subtitle = 'Standard Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = '',
		id = '',
		subtitle = 'Standard Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = '',
		id = '',
		subtitle = 'Standard Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = 'Mythical',
		id = 'mythical',
		subtitle = 'Standard Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = 'Fun & Games',
		id = 'games',
		subtitle = 'Standard Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- controller
		-- tabletop
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Weather Events',
		id = 'weather',
		subtitle = 'Standard Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- thunderstorm
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
	},
	{
		name = 'Shape Names',
		id = 'shapenames',
		subtitle = 'Standard Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {'al', 'o', 'la', 'gram', 'par', 'lel'},
				target = {'par', 'al', 'lel', 'o', 'gram', 'la'},
				impostor = true,
			}
		}
		-- hexagonal
		-- prismatic (tism)
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
	},
	{
		name = 'Animals II',
		id = 'animals2',
		subtitle = 'Standard Pak #',
		difficulty = 'Tricksy',
		contains_impostors = true,
		contains_bombs = false,
		puzzles = {
			{
				start = {'fly', 'drag', 'ing', 'on'},
				target = {'drag', 'on', 'fly', 'ing'},
				impostor = true
			},
			{
				start = {'o', 'thol', 'gist', 'or', 'ni'},
				target = {'or', 'ni', 'thol', 'o', 'gist'},
			},
			{
				start = {'can', 'lope', 'an', 'te'},
				target = {'an', 'te', 'lope', 'can'},
				impostor = true
			},
			{
				start = {'mo', 'on', '', 'do', 'ite', 'ko', 'drag'},
				target = {'ko', 'mo', 'do', '', 'drag', 'on', 'ite'},
				impostor = true,
				tilevis = {
					width = 45,
					parallax = 10
				}
			},
			{
				start = {'ga', 'li', 'tor', 'er', '', 'lat', 'al'},
				target = {'lat', 'er', '', 'al', 'li', 'ga', 'tor'},
				tilevis = {
					width = 45
				}
			},
			{
				start = {'er', 'lab', 're', 'ra', '', 'dor', 'triev'},
				target = {'lab', 'ra', 'dor', '', 're', 'triev', 'er'},
				tilevis = {
					width = 45,
					parallax = 15
				}
			}
		}
		-- hippopotamus
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
		-- TBD
	},
	{
		name = 'Automotive',
		id = 'cars',
		subtitle = 'Standard Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- ignition
		-- unleaded
		-- turn signal
		-- compression
		-- horsepower
		-- gasoline
		-- automatic
		-- transmission
		-- speedometer
		-- suspension (ful)
		-- alternator
		-- carburetor
		-- hydroplaning
		-- glove compartment (a)
		-- accelerator
	},
	{
		name = 'Outer Space',
		id = 'space',
		subtitle = 'Standard Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- satellite
		-- twinkling
		-- astronaut (turf)
		-- planetary
		-- meteorite
		-- astronomy
		-- interstellar (ou)
		-- neutrino
		-- observatory
		-- gamma-ray burst
		-- gravitational
		-- luminosity
		-- escape velocity
		-- relic radiation
		-- milky way galaxy
	},
	{
		name = 'Wordplay',
		id = 'wordplay',
		subtitle = 'Standard Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- adjective
		-- dialect
		-- synonym
		-- palindrome
		-- vocabulary
		-- phonetics
		-- definition
		-- bilingual
		-- semantics
		-- vernacular
		-- nomenclature
		-- pronunciation
		-- polysyllabic
		-- communication
		-- lexicography
	},
	{
		name = 'Food & Drink II',
		id = 'food2',
		subtitle = 'Standard Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- beverage
		-- sustenance
		-- gingerbread man
		-- tapioca
		-- pumpernickel
		-- pomegranate
		-- meat and potatoes
		-- vegetarian
		-- cayenne pepper (est)
		-- preservation
		-- comestible (bule)
		-- sourdough starter
		-- agricultural
		-- confectionery
		-- carbohydrate (ing)
	},
	{
		name = 'Wonders of the World',
		id = 'worldwonders',
		subtitle = 'Standard Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = 'Television',
		id = 'television',
		subtitle = 'Standard Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- recording
		-- broadcasting
		-- frequency
		-- satellite
		-- pay-per-view
		-- serial
		-- on-demand
		-- episodic
		-- advertisement
		-- interference
		-- teleprompter
		-- syndication
		-- cathode ray tube
		-- videographer
		-- high definition
	},
	{
		name = 'Musical II',
		id = 'musical2',
		subtitle = 'Standard Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = 'Technology',
		id = 'tech',
		subtitle = 'Standard Pak #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- processor
		-- networking
		-- developer
		-- industry
		-- automaton
		-- innovation
		-- electronics
		-- encryption
		-- overclocking
		-- telemetry
		-- artificial
		-- engineering
		-- neural network
		-- standardization
		-- manufacturing
		-- computational
		-- accelerometer
		-- optimization
		-- operating system
		-- electromagnetism
	},
	{
		name = 'Prehistoric',
		id = 'prehistoric',
		subtitle = 'Standard Pak #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = 'A Series of Tubes',
		id = 'internet',
		subtitle = 'Standard Pak #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = 'Photography',
		id = 'photography',
		subtitle = 'Standard Pak #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = 'Periodic Elements',
		id = 'elements',
		subtitle = 'Standard Pak #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
		-- sodium
		-- lithium
		-- helium
		-- chemistry
		-- mercury
		-- oxygen
		-- hydrogen
		-- platinum
		-- chromium
		-- uranium
		-- potassium
		-- arsenic
		-- nonmetallic
		-- phosphorus
		-- manganese
		-- plutonium
		-- yttrium
		-- germanium
		-- neodymium
		-- classification
	},
	{
		name = 'Bones',
		id = 'bones',
		subtitle = 'Standard Pak #',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = 'Scientific Names',
		id = 'latinnames',
		subtitle = 'Standard Pak #',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = '',
		id = '',
		subtitle = 'Standard Pak #',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = '',
		id = '',
		subtitle = 'Standard Pak #',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	},
	{
		name = '',
		id = '',
		subtitle = 'Standard Pak #',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
	}
}

bonus = {
	{
		name = '',
		id = '',
		subtitle = 'Shapes Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
		subtitle = 'Shapes Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
		subtitle = 'Shapes Pak #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
		subtitle = 'Shapes Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
		subtitle = 'Shapes Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
		subtitle = 'Shapes Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
		subtitle = 'Shapes Pak #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
		subtitle = 'Shapes Pak #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
		subtitle = 'Shapes Pak #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
		subtitle = 'Shapes Pak #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
				start = {'+', '2', '1', '1', '='},
				target = {'1', '+', '1', '=', '2'},
				text = 'Welcome to the Math Paks!\nYour goal is to assemble the blocks to\ncreate a logical, correct equation.\nTry this easy one first!',
				tilevis = {
					font = 'doubledisco'
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
		name = 'Basic Subtraction',
		id = 'math_subtract',
		subtitle = 'Math Pak #2',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
				start = {''},
				target = {''}
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
				start = {''},
				target = {''}
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
				start = {''},
				target = {''}
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
				start = {''},
				target = {''}
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
				start = {''},
				target = {''}
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
				start = {''},
				target = {''}
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
		subtitle = 'Math Pak #9',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
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
				start = {''},
				target = {''}
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