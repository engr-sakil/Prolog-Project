
% স্বরবর্ণ sworoborno (vowels)
char_translation('o', 'অ').
char_translation('a', 'আ').
char_translation('i', 'ই').
char_translation('I', 'ঈ').
char_translation('u', 'উ').
char_translation('U', 'ঊ').
char_translation('rri', 'ঋ').
char_translation('e', 'এ').
char_translation('OI', 'ঐ').
char_translation('O', 'ও').
char_translation('OU', 'ঔ').

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
char_translation('R', 'ড়').
char_translation('Rh', 'ঢ়').
char_translation('y', 'য়').
char_translation('t``', 'ৎ').
char_translation('ng', 'ং').
char_translation(':', 'ঃ').
char_translation('^', '৺').

% Translating a single character
translate_char(EnglishChar, BanglaChar) :-
    char_translation(EnglishChar, BanglaChar).

% Unrecognized facts
translate_char(_, 'Not in facts').

% Translating a list of characters 
translate_chars([], []).
translate_chars([E|Es], [B|Bs]) :-
    translate_char(E, B),
    translate_chars(Es, Bs).
