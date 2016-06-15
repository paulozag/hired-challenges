<h2>Challenge 5: Maximum Difference</h2>

Given an array of integer elements, a subsequence is a set of consecutive elements from the array (i.e.: given the array v:[7,8,-3,5,-1], a subsequence of v is 8,-3,5)

**Your task is to**
<ul>
    <li>write a function that finds a left and a right subsequence of the array that satisfy the following conditions:
        <ul>
            <li>the two subsequences are unique, they don't have shared elements.</li>
            <li>the difference between the sum of the elements in the right subsequence and the sum of the left subsequence is maximum</li>
        </ul>
    </li>
    <li>print the difference to the standard output</li>    
</ul>

Note that your function will receive the following arguments
<ul>
    <li> **v** - an array of inntegers</li>
    
</ul>

**Data constraints**
<ul>
    <li>the array has at least 2 and at most 1,000,000 elements.</li>
    <li>all the elements in the array are integer numbers in the following range: [-1000, 1000]</li>
    <li>the value of d will not exceed the length of the given array.</li>
</ul>

**Efficiency constraints**
<ul>
    <li>your function is expected to print the result in less than 2 seconds</li>
</ul>
**Example**
input: v: 3,-5,1,-2,8,2,3,-2,1
left subsequence: -5,1,-2
right subsequence: 8,-2,3 
maximum difference: 15
<br><br><br>
<h3>Solution:</h3>
<p>When first approaching this challenge, i brainstormed and came up with a cpl approaches, in addition to a brute-force technique. These are:</p>
<ul>
    <li>brute-force: create n-d individual slices and run their max - min.  The largest of these will be the differential.  this complexity is O(n*(n-d), or n^2</li>
    <li>option 1: recursively map the local highs of the original array, and populate an n-length array with not only the index of the max-value having the max-value, but all elements +/- d away from the max-index will also be populated with the max-value.  I then subtract the original value of each index from the value of of the high-ranges array.  the max of these values turns out to be the solution.  As far as complexity goes, I haven't a clue.  the mapping of the high-values is the highest order of n, i think that process would be O(n*d).  I ended up doing this option, and generated a 100k element array and did it well under a second (in ruby no less)</li>
    <li>option 2: the basic idea is to look at the first d elements in the array, compute the value and index of both the highs and lows.  then advance the stack by shifting the first element out and unshifting the balance of the original array one.  if the incomming element is higher than the current high, or lower than the current low, these values will be updated.  also if the current max or min gets shifted off the array, a new min/max must be found.  The complexity of this solution may be lower than the solution i implelented and would improve as d became larger.</li>
</ul>
