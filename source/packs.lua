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
				start = {'world', 'lo', '', 'hel'},
				target = {'hel', 'lo', '', 'world'},
				text = 'Some puzzles can also have spaces, to\nindicate breaks between multiple words.\n\nMake sure these go into the correct places as well!'
			},
			{
				start = {'der', 'wil', 'be', 'ly', 'ing'},
				target = {'be', 'wil', 'der', 'ing', 'ly'},
				text = 'Try one more standard one!\nIf you ever wanna take a break, you\ncan "suspend" from the Slide menu, and\ncome back to the puzzle in progress later.'
			},
			{
				start = {'pi', 'sus', 'ish', 'ly', 'cious'},
				target = {'sus', 'pi', 'cious', 'ly', 'ish'},
				impostor = true,
				text = 'Sometimes, there\'ll be an impostor — a syllable\nthat doesn\'t even belong in the word! If\nyou see something that feels out of place, swap\nit into the box at the far-right.'
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
		name = 'Animals',
		id = 'pack1',
		subtitle = 'Standard Pack #1',
		difficulty = 'Easy',
		contains_impostors = true,
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
				start = {'can', 'lope', 'an', 'te'},
				target = {'an', 'te', 'lope', 'can'},
				impostor = true
			},
			{
				start = {'um', 'i', 'a', 'quar'},
				target = {'a', 'quar', 'i', 'um'}
			},
			{
				start = {'fly', 'drag', 'ing', 'on'},
				target = {'drag', 'on', 'fly', 'ing'},
				impostor = true
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
			{
				start = {'o', 'thol', 'gist', 'or', 'ni'},
				target = {'or', 'ni', 'thol', 'o', 'gist'},
			},
			{
				start = {'ga', 'li', 'tor', 'er', '', 'lat', 'al'},
				target = {'lat', 'er', '', 'al', 'li', 'ga', 'tor'},
				tilevis = {
					width = 45
				}
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
				start = {'er', 'lab', 're', 'ra', '', 'dor', 'triev'},
				target = {'lab', 'ra', 'dor', '', 're', 'triev', 'er'},
				tilevis = {
					width = 45,
					parallax = 15
				}
			}
		}
	},
	{
		name = 'Food & Drink',
		id = 'pack',
		subtitle = 'Standard Pack #',
		difficulty = 'Easy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {
			{
				start = {''},
				target = {''}
			}
		}
	},
	{
		name = 'Wordplay',
		id = 'pack',
		subtitle = 'Standard Pack #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {

		}
	},
	{
		name = 'Weather Events',
		id = 'pack',
		subtitle = 'Standard Pack #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {

		}
	},
	{
		name = 'Shape Names',
		id = 'pack',
		subtitle = 'Standard Pack #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {

		}
		-- parallelogram(la)
		-- hexagonal
		-- prismatic(tism)
	},
	{
		name = 'Outer Space',
		id = 'pack',
		subtitle = 'Standard Pack #',
		difficulty = 'Tricksy',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {

		}
	},
	{
		name = 'Technology',
		id = 'pack',
		subtitle = 'Standard Pack #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {

		}
	},
	{
		name = 'Dinosaurs',
		id = 'pack',
		subtitle = 'Standard Pack #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {

		}
	},
	{
		name = 'A Series of Tubes',
		id = 'pack',
		subtitle = 'Standard Pack #',
		difficulty = 'Difficult',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {

		}
	},
	{
		name = 'Periodic Elements',
		id = 'pack',
		subtitle = 'Standard Pack #',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {

		}
	},
	{
		name = 'Scientific Names',
		id = 'pack',
		subtitle = 'Standard Pack #',
		difficulty = 'Very Tough',
		contains_impostors = false,
		contains_bombs = false,
		puzzles = {

		}
	}
}

shapes = {

}

quikwords = {
	{'add', 'some', 'words!'}
}

return packs, shapes, quikwords