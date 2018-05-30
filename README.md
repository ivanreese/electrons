Inspired by the super cool simulations in the Electrical Potential lesson found here: https://landgreen.github.io/physics/index.html

Those simulations ran pretty slowly, and in low res, so I thought it'd be a fun challenge to try reimplementing the effect, to see if I could get it to run more quickly. You can see the result here: http://electrons.surge.sh

My version doesn't try to match the particular interactivity and exact physics simulation of the original — rather, I just focussed on what'd look moderately cool, and focussed entirely on perf.

Now, of course, you could make this go much, much faster if it were rendered with WebGL. But I don't know WebGL yet, so for now, it just uses the 2d canvas (same as the original).
