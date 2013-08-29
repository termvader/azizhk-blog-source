---
date: 2013-08-29 22:00:00
layout: post
slug: TTT2-2Player
title: Tic Tac Toe Square - 2 Player
description: Play Tic Tac Toe Square with your friend over the internet. Made using NodeJS, Socket.IO, Openshift
category: Game Development
tags: 
- NodeJS
- Web
- Javascript
- Game
---

Here's the link: <http://ttt2-termvader.rhcloud.com/>

So finally a long time after my previos post, where I had shown intentions of developing a two player version of this game, its now ready.

I initially wanted to host it on Heroku but it does not support Websockets. So shifted to Openshift. But unfortunately Openshift used port 8000 for Websockets which are blocked in my college. Will try using XHR-Polling to see if the issue gets sorted out.

The following rules have been taken from <http://mathwithbaddrawings.com/2013/06/16/ultimate-tic-tac-toe/>

<a id="Rules"><h1>Rules</h1></a>

- Each turn, you mark one of the small squares.
- When you get three in a row on a small board, you’ve won that board.
- To win the game, you need to win three small boards in a row.
- You don’t get to pick which of the nine boards to play on. That’s determined by your opponent’s previous move. Whichever square he picks, that’s the board you must play in next. (And whichever square you pick will determine which board he plays on next.)

For example,

If the previous move is here.

The opponent should move here. 

This lends the game a strategic element. You can’t just focus on the little board. You’ve got to consider where your move will send your opponent, and where his next move will send you, and so on.

- What if my opponent sends me to a board that’s already been won? In that case, congratulations – you get to go anywhere you like, on any of the other boards. (This means you should avoid sending your opponent to an already-won board!)
- What if one of the small boards results in a tie? I recommend that the board counts for neither X nor O.