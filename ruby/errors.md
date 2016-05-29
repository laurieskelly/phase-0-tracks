## Test one theory at a time

* commit your code
* test a theory
* if it doesn't work, use `git checkout` to revert
* if it does, commit that shih

## Log your data and control flow

* print your data as you go to see what you're doing
* be careful that `puts` or `p` doesn't make your method return something other than what it's supposed to

## Avoid bugs in the first place

* name your variables well 
* indent your code properly
* don't pack too much code into one line
* read a lot of code
* test your code frequently 
* commit frequently


I think that with respect to the tips discussed here today, I have pretty good habits. I definitely could implement the first tip, using commits and reverting with checkout to test theories one at a time. That's something I don't do, at least not in a structcured way. 

The second tips, about logging data, are things I do regularly. I've been using explicit return statements in my methods, so I wouldn't have run into those errors with `puts` and `p`. Perhaps I should be experimenting more with just letting the method return what it returns at the end. I wasn't really aware of this feature in ruby, so that's pretty cool to learn about. 

The third set are things that are either enforced or encouraged in python, which is the language I'm most comfortable with. Proper indentation, of course, is necessary in python, so that's carried over well so far. I'm a stickler for well-named variables, and with the exception of list comprehensions, I'm a believer in many short functions and not too much on one line. Sometimes, though, I like making an amazing and inscrutible mess with a really complicated list comprehension. I'll usually comment them out and write the code out in a readable way, after I've made them work. I just like the puzzle-solving aspect of it sometimes. 

Reading a lot of code is something I don't do, want to do, feel weird about not having done. And I'm a pretty frequent committer. I think my solo challenge this week had a zillion commits in it, so that's not just talk. 