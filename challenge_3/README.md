<h2>Challenge 3: Hill</h2>

Given an array of integer elements

**Your task is to**
<ul>
    <li>write a function that finds the minimum value X that makes it possible the following: generate a new array that is sorted in stricctly ascendinng order by increasing or deccresing eaccch of the elements of the initial array with interger values in the [0,X] range</li>
    <ul>
        <li>Example: Having the initial array [5,4,3,2,8], the minimum value for X is 3. Deccrease the first element (5) by 3, decrease the seconnd element (4) by one, innccrease the third one (3) by 1, increase the fourth element (2) by 3, and do nothing to the last one (8).  In the end we obtain the array [2,3,4,5,6] which is sorted in strictly asccending order.</li>
    </ul>
    <li>print the result X to the standard output</li>
</ul>

Note that your function will receive the following arguments
<ul>
    <li> **v** - an array of inntegers</li>
</ul>

**Data constraints**
<ul>
    <li>numbers are inn asccccenndinng order whenn arranged from the smallest to the largest number</li>
    <li>stricctly ascending order means that each elemennt is greater thann the precceding one (e.g. [1,2,2,3,4] is not stritly asccending order)</li>
    <li>the length of the array will not excceed 5000</li>
    <li>the elemennts of any of the arrays are integer numbers in the [1, 2^31 -1] range</li>
</ul>

**Efficiency constraints**
<ul>
    <li>your function is expected to print the result in less than 2 seconds</li>
</ul>
<br><br><br>
<h3>Solution:</h3>

<p>This one took me a while - I tried several different approaches (a lot of attempts in the scratch.rb file).  My first instinct was to determine cases where at least a minimum spread would be evident.  I first tried what I called a "one gap spread".  Meaning, the spread would at least have to be 1/2 of the biggest difference between larger element of the left of a smaller element to the right.  This established a starting point, but still failed to generate the minimum value X in most cases.</p>
<p>I also realized that if the starting index value was close to or greater than the ending value, a minimum floor would also be established.  I called this the beginnging to ending spread - which basically calculated half the differnce between beginning and ending values, added to the distance between the positions in the array.  I later incorporated this algorithm into my final solution eventhough this algo by itself failed to completely satisfy the solution.</p>
<p>Looking at the datasets of the failed trials, I noticed some patterns and realized another hard floor for the spread could be found by comparing the distance between the highest point in the array to the smallest value to the right of it.  I plug the highest and lowest point into the beginning_to_ending algorithm and that solved a good percentage of my datasets, but not all.</p>
<p>My next step was to not only examine the highest point, but also the segment to the left of the high point - looking at that subarray's local high point relationship to the lowest.</p>
<p>I ran this solution and it seemed to pass the mild constraints, of my testing data, but when i exaggerated the length of the array, or narrowed the spread between high and low points it would sometimes still fail.  It turns out that while some aspects of my calculation took into account the distance between indexes, two key calculations didn't.  These were my helper methods to determine the highest and lowest points of the array.  imagine a long string of array values equal to 1, and the last array value is a 2.  When determining the 'lowest' point of the array, it's actually the last value (2) - because it's under the additional constraint of being higher than all the values preceding it.</p>
<p>So I tweaked the find_highest and find_lowest methods to account for index position and viola, it worked.  What I do is rucursively (i actually used a while loop) find all of the local highs and their relationships to the lowest values and run those pairs of values through the first_to_last method.  The max spread value of those comaprisons solves the problem.</p>
<p>Efficiency: best case is an O(n), and depending on the make up of the data it could approach O(n^2).  I would bet though, that time efficiency of the algorithm is probably O(nlog-n) - due to its recursively calling the solution on smaller and smaller portions of the array.</p>