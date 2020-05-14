Victor and Zuzanna 

Challenge 1: What is the difference between expected value and mean?

Expected value involves an average of a random variable. Its calculation also involves probability ("variable multiplied by the probability of that outcome").
Mean is the average of a distribution.

Challenge 2: What is the "problem" in science with p-values?

The "problem" is that not all non-significant results should be easily dismissed as having no correlation/impact just because of a small p-value obtained. There might be other influences on arriving at the p-value (e.g. precision of the interval size). Often, results that are obtained using slightly different parameters may seem to be in conflict with one another, which may not be the case in reality. 

This issue is connected with a dichotomous approach towards significance of results obtained from research, as the size of p-value is often treated as significant basis to either accept or dismiss the data, for either the current or future research purposes. 
Because of that, the scientific community might be missing information of significant educational and investigative treshold. 

__________

Challenge 3: Applying testing to a specific case: A/B testing.

Article summaries: 
> Netflix example: 
 >> Default artwork selection: A/B Testing:
          . Members in each test cell get a different image for that title. 
          . Measuring the engagement with the title for each variant — click through rate, aggregate play duration, fraction of plays with short duration, fraction of content viewed (how far did you get through a movie or series), etc. 
          . Results: positive rise in the audience size  and increased engagement; indication that members are sensitive to artwork changes.
   >> Multi-cell explore-exploit test: 
          ."The hypothesis for this test was that we can improve aggregate streaming hours for a large member allocation by selecting the best artwork across each of these titles."
            . The “explore” test measured engagement of each candidate artwork for a set of titles. 
            . The “exploit” test served the most engaging artwork (from explore test) for future users and see if we can improve aggregate streaming hours.
           . Using the explore member population, we measured the take rate (click-through rate) of all artwork variants for each title.
           . take rate =  number of plays /  number of impressions  
 >> Single cell title level explore test
     . all members of the explore population are in a single cell. 
     .  We dynamically assign an artwork variant for every (member, title) pair just before the title gets shown to the member. 
     .  In essence, we are performing the A/B test for every title with a cell for each artwork. 
     .  Since the allocation happens at the title level, we are now able to accommodate different number of artwork variants per title.
     
     
> Basecamp example: 
    >>  
    . in July we launched an A/B test that brought a signup form back onto the homepage, with immediate and dramatic results: signups increased by 16% in the with-signup-form group compared to the group without. 
    . Issues --> A/B testing predicts that a lot of factors stay constant (not always realistic) & a proposed solution is constrained in the testing model. 
    . Pros --> not accounting for the above, A/B testing is able to indicate public preference 
    
> Python example:  
    >> Outline: 
    . Set up the experiment 
    . Run the tests; record success rate per group 
    > Test & Control group 
    . Plot the distribution of the difference between the samples 
    > Binomial distribution 
    > Variance of the sum 
    . Calculate the stat power
    > Refer to confidence level 
    > Refer to confusion matrix 
    . Evaluate the sample size effect on A/B testing 

> The Art of A/B Testing 
>> Explanation: 
.  the idea is to challenge an existing version of a website (A) with a new one (B), by randomly splitting traffic and comparing metrics on each of the splits.
. Split traffic; look at conversion rate
>> Test options: 
    . Z-test can be applied to testing whether the clients experiencing B spend more time on average
    . χ² test can be used to decide whether or not version B leads to a higher conversion rate
    . Z-test can be adapted to test conversion rate of version B and if it yields the same conclusion as the χ² test
    . Last: Questioning tests 
    
>> Test performance steps: 
    > Modeling H0 with CLT
    > Looking how likely the samples are uder H0 


Zuzanna: For this example, I would use the Basecamp method with showing engagement on two different sides. I would split traffic as advised in 'The Art of A/B Testing' and perform the tests as suggested. Including the evaluation on sample size (as suggested with the Python example) would also be key to see if/how the traffic ratio is affected. 