# CN-LAB
For CheckSum program I am using following logic which is there in Forozoun text book.

Example 10.18
Suppose our data is a list of five 4-bit numbers that we want to send to a destination. In addition
to sending these numbers, we send the sum of the numbers. For example, if the set of numbers is
(7, 11, 12, 0, 6), we send (7, 11, 12,0,6,36), where 36 is the sum of the original numbers. The
receiver adds the five numbers and compares the result with the sum. If the two are the same,
the receiver assumes no error, accepts the five numbers, and discards the sum. Otherwise, there is
an error somewhere and the data are not accepted.
Example 10.19
We can make the job of the receiver easier if we send the negative (complement) of the sum,
called the checksum. In this case, we send (7, 11, 12,0,6, -36). The receiver can add all the numbers
received (including the checksum). If the result is 0, it assumes no error; otherwise, there is an error.











