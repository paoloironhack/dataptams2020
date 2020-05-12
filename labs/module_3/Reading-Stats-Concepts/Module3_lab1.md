## Challenges

### Challenge 1: What is the difference between expected value and mean?

Answer: Expected value is defined as the weighted average of the values in the range. It is the average value of a random variable over a large number of experiments.

Mean iso often seen as the same as the expected value. The difference is that the mean is defined as the sum of a collection of numbers divided by the number of numbers in the collection, and the Expected value (EV) is the long-run average value of repetitions of the experiment it represents. This means that over the long term of doing an experiment over and over, you would expect this average.


### Challenge 2: What is the "problem" in science with p-values?

Answer: P values alone cannot confirm whether the researcher's argument is correct or not; P < 0.05 cannot ensure that the researchers’ arguments are true. Also, P > 0.05 does not ensure ‘no difference between the compared groups’. The erroneous belief that P < 0.05 supports scientific validity can lead to considerable distortion in decision making. Therefore, it is recommended that the proper inference should not be based solely on the P values. We need to consider many contextual factors to derive scientific inferences. Not only P value, but study design, the quality of the measurements, and the logical basis of the assumptions are also important.

The P values do not tell how 2 groups are different. The degree of difference is referred as ‘effect size’. Statistical significance is not equal to scientific significance. Smaller P values do not imply the presence of a more important effect, and larger P values do not imply a lack of importance. Even with the same effect size, the P values can be very different, based on the sample size. When the sample size is not large enough to find any difference between the groups (a situation of weak statistical power), the P value becomes larger, which makes researchers unable to find any differences between the groups. Any effect, even if it is very tiny, can produce a small P value (P < 0.05) if the sample size is large enough, and large effects can produce unimpressive P values (P > 0.05) if the sample size is small. To prevent this phenomenon, it is essential to clarify the process of adequate sample size calculation.


### Challenge 3: Applying testing to a specific case: A/B testing.

Answer: 
We chose the Netflix example. In the first experiment, they measured the viewer engagement with several different versions of the cover image for the same film — click through rate, aggregate play duration, fraction of plays with short duration, fraction of content viewed (how far did you get through a movie or series).

The click through rate is a binomial distribution (click or don't click). So, we would use a (two-sided) binomial test on this example.

For the other three measurements (aggregate play duration, fraction of plays with short duration and fraction of content viewed), if the data follows a normal distribution we would use a two-sample t-test to make pairwise comparisons. If the data is not distributed normally we can try transforming the data to make it fit a normal distribution better. 

