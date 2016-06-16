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
<p>I'm not sure if this solution meets the criteria of the challenge, but I think this solution will work for all cases in O(n) time complexity.  I create another array of n-length (bounds).  Each elemennt represents the sum total of all the elements of v up to and including the current element.  I can then find the min of that array which will give me the index of the end of the left subsequence, and the next element will be the start of the right subsequence.  </p>
<p>The challenge then is to determine where the left subsequence starts and where the right subsequence ends.  We can use the same bounds array to determine these two indices.  The beginning of the left sub will be the index of the max element to the left of the lowest_index.  if that index refers to a negative value, then the start index for the left sub will be zero.  Conversely, the end of the right sub will be the index of the max element in bounds that lies to the right of the lowest_index.</p>
<p>I think that in order to be sure this works I will have to build a brute-force algorithm to test the results of this one across many random data samples</p>
