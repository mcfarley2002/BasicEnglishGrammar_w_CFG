%{
        #include <stdio.h>
        int yylex(void);
        void yyerror(const char *s);
%}
/* Tokens produced by Flex */
        %token ADJ
        %token SING_NOUN
        %token PLUR_NOUN
        %token CONJ
        %token SING_VERB
        %token PLUR_VERB
        %token PERIOD
        %token A
        %token THE
        %token NEWLINE
%%

input:
        sentences
        ;

sentences:
        sentence
        | sentences NEWLINE
        | sentences NEWLINE sentence
        ;

sentence:
        plural_noun_phrase PLUR_VERB plural_noun_phrase PERIOD
        | plural_noun_phrase PLUR_VERB singular_noun_phrase PERIOD
        | singular_noun_phrase SING_VERB plural_noun_phrase PERIOD
        | singular_noun_phrase SING_VERB singular_noun_phrase PERIOD
        ;

plural_noun_phrase:
        plural_noun_phrase CONJ singular_noun_phrase
        | plural_noun_phrase CONJ THE plural_noun
        | singular_noun_phrase CONJ singular_noun_phrase
        | singular_noun_phrase CONJ THE PLUR_NOUN
        | THE plural_noun
        | plural_noun
        ;

plural_noun:
        PLUR_NOUN
        | ADJ PLUR_NOUN

singular_noun_phrase:
        A ADJ SING_NOUN
        | A SING_NOUN
        | THE SING_NOUN
        | THE ADJ SING_NOUN
        ;

%%
int main(void)
{
        if (yyparse() == 0)
        printf("Valid input\n");
        return 0;
}
void yyerror(const char *s)
{
        fprintf(stderr, "Syntax error: %s\n", s);
}