Name: Max Farley
Email: mcfarley01@wm.edu

Tokens:
Articles are split into "a" and "the" because of the required checks for correctness with singular vs. plural nouns in the .y file. Adjectives are grouped together with "|", and most tokens use /[ .] to check for either a space or a period after them. The backslash means that the token isn't consumed, which allows me to define a period as its own token. Plural verbs and singlular nouns are pre-defined because their counterparts (singular verbs and plural nouns) attach an s to them, which makes them easier to define. The reason why the newline token is useful will be revealed in the grammar explanation.

Grammar:
My grammar starts off with defining all possible singular article + optional adjective + noun phrases. I also defined plural nouns (I did this because it was easier to follow along when debugging but this step is optional). Plural noun phrases use pre-defined combinations of simple noun phrases, plural noun phrases, and even uses recursion to allow for a chain of many different subjects. Sentences are built with a noun phrase, the appropriate verb, and another phrase and ending with a period. Sentences are made up of 1 or more sentences with a newline character separating them. Empty input is invalid due to it not being a sentence.

AI Usage:
I used AI mainly for 2 reasons:
1. To troubleshoot why I was experiencing conflicts with my .y file. Turns out you can't just "expression op expression" without a good reason to do so. The prompt included the plural phrase segment and a question as to why the recursion wasn't working as intended.
2. To help me understand how to think through enforcing spaces. The prompt asked about why adding spaces to each token wasn't sufficient for adding the trailing context element I needed. What ended up happening was that AI would try and steer me away from using forward slashes, but it seemed like using them was the only way I was going to be able to read the next token without consuming it. I decided to trust myself and I figured it out on my own. Not bad.

Most interesting quality:
My grammar is setup in such a way that empty input is not allowed. Since the specifications don't seem to mention this being an exception, I decided to design my .y file in such a way that continuous input with new lines are considered valid but an empty string isn't. Only sentences in any quantity >= 1 are accepted.