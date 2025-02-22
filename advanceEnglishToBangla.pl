% স্বরবর্ণ sworoborno (vowels) standalone and diacritic forms
vowel('o', 'অ', '').      
vowel('a', 'আ', 'া').    
vowel('i', 'ই', 'ি').    
vowel('I', 'ঈ', 'ী').     
vowel('u', 'উ', 'ু').   
vowel('U', 'ঊ', 'ূ').   
vowel('rri', 'ঋ', 'ৃ'). 
vowel('e', 'এ', 'ে').     
vowel('OI', 'ঐ', 'ৈ').    
vowel('O', 'ও', 'ো').      
vowel('OU', 'ঔ', 'ৌ').

% ব্যঞ্জনবর্ণ benjonborno (Consonants)
char_translation('k', 'ক').
char_translation('kh', 'খ').
char_translation('g', 'গ').
char_translation('gh', 'ঘ').
char_translation('Ng', 'ঙ').
char_translation('c', 'চ').
char_translation('ch', 'ছ').
char_translation('j', 'জ').
char_translation('jh', 'ঝ').
char_translation('NG', 'ঞ').
char_translation('T', 'ট').
char_translation('Th', 'ঠ').
char_translation('D', 'ড').
char_translation('Dh', 'ঢ').
char_translation('N', 'ণ').
char_translation('t', 'ত').
char_translation('th', 'থ').
char_translation('d', 'দ').
char_translation('dh', 'ধ').
char_translation('n', 'ন').
char_translation('p', 'প').
char_translation('f', 'ফ').
char_translation('b', 'ব').
char_translation('v', 'ভ').
char_translation('m', 'ম').
char_translation('z', 'য').
char_translation('r', 'র').
char_translation('l', 'ল').
char_translation('sh', 'শ').
char_translation('Sh', 'ষ').
char_translation('s', 'স').
char_translation('h', 'হ').
char_translation('R', 'ড়').
char_translation('Rh', 'ঢ়').
char_translation('y', 'য়').
char_translation('t``', 'ৎ').
char_translation('ng', 'ং').
char_translation(':', 'ঃ').
char_translation('^', '৺').
char_translation(' ', ' ').

% Check the character is vowel or not
is_vowel(Char) :-
    vowel(Char, _, _).

% Get the standalone form of a vowel
get_standalone_vowel(Char, StandaloneForm) :-
    vowel(Char, StandaloneForm, _).

% Get the diacritic form of a vowel
get_diacritic_vowel(Char, DiacriticForm) :-
    vowel(Char, _, DiacriticForm).

% Translating a single word
translate_word(EnglishWord, BanglaWord) :-
    string_chars(EnglishWord, Chars), % word into character list
    translate_chars(Chars, BanglaChars, true), 
    atom_chars(BanglaWord, BanglaChars),
     write("English Word: "),write(EnglishWord),nl,
     write("Bangla Word: "),write(BanglaWord). % character list back to word

% Translating a list of characters
translate_chars([], [], _). % [] empty list and _ annonymous variable
translate_chars([E | Es], [B | Bs], IsFirstChar) :-
    (is_vowel(E) ->  get_vowel_translation(E, B, IsFirstChar), NextIsFirst = false ; char_translation(E, B), NextIsFirst = false),
    translate_chars(Es, Bs, NextIsFirst).

% Helper predicate to handle vowel translation
get_vowel_translation(E, B, IsFirstVowel) :-
    (IsFirstVowel -> get_standalone_vowel(E, B) ; get_diacritic_vowel(E, B)). 

