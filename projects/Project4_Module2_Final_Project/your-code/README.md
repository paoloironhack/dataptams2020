The data I have used for this project were based on the Big Five Personality Tests and can be obtained from Kaggle, where they are currently publicly available. 

BIG FIVE PERSONALITY TRAITS & TESTING 
The information on the Big Five Personality Testing can be found here: 
* Wikipedia: https://en.wikipedia.org/wiki/Big_Five_personality_traits
* Shi, J., Yao, Y., Zhan, C., Mao, Z., Yin, F., & Zhao, X. (2018). The Relationship Between Big Five Personality Traits and Psychotic Experience in a Large Non-clinical Youth Sample: The Mediating Role of Emotion Regulation. Frontiers in Psychiatry, 9. doi: 10.3389/fpsyt.2018.00648. Link: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6288374/

DATA SOURCES 
* The General dataset: https://www.kaggle.com/tunguz/big-five-personality-test
* The Celebrities Twitter dataset: https://www.kaggle.com/kevincaicedo/personality-traits-of-twitter-users-celebrities

For the purposes of this notebook, the datasets were renamed as: 
* datageneral
* datatwitter

DIFFERENCES BETWEEN THE DATASETS: 
The General dataset: 
* This dataset has detailed entries, with assesments obtained singularly for every aspect of the Big Five personality tests 
* Because of that, the data needed to be integrated to form the Big Five personality questions clusters
* The questions were both positively and negatively valued, so to obtain a final value of testing per Trait, the data needed to be transformed as per former literature -> that is, by subtracting the negative value from the positive value for each Trait, and considering the result as a final value of assesment of that Trait 
* The dataset contains entries from 110 Participants 

The Celebrities Twitter dataset: 
* This dataset contains entries assessing the tweets of 140 different Celebrities 
* The final value of testing per Trait is pre-obtained (not needing further transformation) 
* A testing concern is on how the value was assigned per a given Trait (can be biased or arbitrary)
* Another testing concern can be how the Celebrities were chosen for the sample (e.g. on the basis of 'successful career' or 'accumulated following')

Both datasets were assessed in the following variables, accounting for the Big Five Personality Traits: 
* Neuroticism 
* Extraversion
* Openness
* Agreeableness
* Conscientiousness


The files in this project include: 
* data (in the 'data' folder and via the links above)
* a 'Workbook' notebook used for data cleaning and testing out ideas 
* a 'Project 4' notebook used for the final assessment, cleaning and vizualisation of the data, and presentation of the results 
