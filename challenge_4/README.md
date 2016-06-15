<h2>Challenge 4: Deviation</h2>

Given an array of integer elements, and an ineger d, please consider all the sequences of d consecutive elements in the array.  For each sequence we compute the difference between the maximum and minimum values of the elements in that sequence and name it the deviation.

**Your task is to**
<ul>
    <li>write a function that finds the maximym value among the deviations of all the sequences considered above</li>
    
    <li>print the result to the standard output</li>
</ul>

Note that your function will receive the following arguments
<ul>
    <li> **v** - an array of inntegers</li>
    <li> ** d ** - an integer value giving the length of the sequences</li>
</ul>

**Data constraints**
<ul>
    <li>the array will contain up to 100,000 elements.</li>
    <li>all the elements in the array are integer numbers in the following range: [1, 2^31 -1]</li>
    <li>the value of d will not exceed the length of the given array.</li>
</ul>

**Efficiency constraints**
<ul>
    <li>your function is expected to print the result in less than 2 seconds</li>
</ul>
<br><br><br>
<h3>Solution:</h3>
<p>When first approaching this challenge, i brainstormed and came up with a cpl approaches, in addition to a brute-force technique. These are:</p>
<ul>
    <li>brute-force: create n-d individual slices and run their max - min.  The largest of these will be the differential.  this complexity is O(n*(n-d), or n^2</li>
    <li>option 1: recursively map the local highs of the original array, and populate an n-length array with not only the index of the max-value having the max-value, but all elements +/- d away from the max-index will also be populated with the max-value.  I then subtract the original value of each index from the value of of the high-ranges array.  the max of these values turns out to be d.  As far as complexity goes, I haven't a clue.  the mapping of the high-values is the highest order of n, i think that process would be O(n*d).  I ended up doing this option, and generated a 100k element array and did it well under a second (in ruby no less)</li>
    <li>option 2: the basic idea is to look at the first d elements in the array, compute the value and index of both the highs and lows.  then advance the stack by shifting the first element out and unshifting the balance of the original array one.  if the incomming element is higher than the current high, or lower than the current low, these values will be updated.  also if the current max or min gets shifted off the array, a new min/max must be found.  The complexity of this solution may be lower than the solution i implelented and would improve as d became larger.</li>
</ul>

