%{
#include "english.tab.h"
%}

%option noyywrap

noun                                    "dog"|"cat"|"cow"
plur_verb                               "like"|"hate"|"ignore"|"irritate"

%%

[ \t\r]+                                                /* ignore */
\n                                                      { return NEWLINE; }

"a"/[ .]                                                { return A; }
"the"/[ .]                                              { return THE; }
("black"|"orange"|"big"|"small")/[ .]                   { return ADJ; }
{noun}s/[ .]                                            { return PLUR_NOUN; }
{noun}/[ .]                                             { return SING_NOUN; }
"and"/[ .]                                              { return CONJ; }
{plur_verb}s/[ .]                                       { return SING_VERB; }
{plur_verb}/[ .]                                        { return PLUR_VERB; }
"."                                                     { return PERIOD; }

.               {
                        fprintf(stderr, "Lexical error: unexpected character '%s'\n", yytext);
                        exit(1);
                }
%%