---
title: Give us all documentaiton 
date: 2019-08-07 15:14:00
tags: [programming, "use case"]
---

## Please give us all documentation you have

Small studio that producing small games, somewhere in the world

QA Lead coming to Programmer and requesting documentation about all games and detailed description of current state of
each project.
Studio already have about 60 games done and about 10 in a queue.
QA Lead says that if they will have this documentation, it will improve our products and they will write better quality test cases

Sounds like a normal situation but it isn't. The whole request is broken and here is why.

But before we will dig to essential problems here is the quick one. They're no explanation about what type of documentation needed. Can you really provide anything by such a request?
something to this request? No!

Now more interesting part. The whole logic of the initial request looks like. Programmer is making software, documenting what they did, providing ready to release software to Quality control
along with documentation she wrote.
Still seems logical, except it isn't. Let's try to zoom out. At a bigger scale the logic of the process looks like this:

 1. Client creates a set of requirements for the game/games. For example, let's make klondike solitaire game with start screen, game and menu.
 2. Programmer takes requirements and creates game
 3. Quality Control person receives the game and asks Programmer provide documentation
 4. Programmer writes documentation explaining what was made

So where is the catch, catch is that documentation that explains what they did isn't the same to what being asked. To properly control the quality of the software
QA Lead should take requirements from the Client and check that the resulting software behaves as being requested

There is more to this case. Does QA need full set of requirements from the Client? Probably not, because it is really depends what level of quality, they expect from the software.
What parts are critical and what not. And what is the threshold for an error?

At the example Client could've said that the only thing that matters that solitaire is playable on every phone and other thing doesn't matter. Only this can reduce cost of testing
dramatically, instead of testing that game have start screen QA will just test game play, because for the client it doesn't matter how many screens as soon as it playable

Before engaging to any activity most reasonable thing to do is ask what is important for the goal and what is nice to have. Otherwise we ending up doing the job that nobody asked and nobody therefore needed.

Why such cases are happening. Because of books. They're a lot of theories around that are explaining how things should work and what attributes they should have. This is good. But when you are approaching practical part and execution, don't forget to extract practical parts from a theory that matters. And do not repeat blindly every recommended step. Because most of them could be not relevant for the size of your company or maybe you need even more because of level you need.
