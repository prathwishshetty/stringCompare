# Package ‘stringCompare’

#### _Prathwish Shetty_

#### _2018-02-17_

<div id="string-comparison-techniques-implemented-in-the-package" class="section level2">

## String comparison techniques implemented in the package

1.  _Extended Jaccaard_
2.  _Monge Elkan_

<div id="extended-jaccard-comparison" class="section level3">

### 1\. Extended Jaccard comparison

<div id="description" class="section level4">

#### Description

This algorithm extracts tokens (words sererated by whitespace) from the two input strings and then find the best matching pair of tokens in the set of tokens using a secondary similarity function.

</div>

<div id="usage" class="section level4">

#### Usage

`extendedJaccard(_string1_,_string2_,_method=c(“osa”,“lv”,“dl”,“lcs”,“jw”)_,_threshold=seq(1,0)_)`

</div>

<div id="arguements" class="section level4">

#### Arguements

*   **string1** - _character string to be matched_
*   **string2** - _character string to be matched against_
*   **method** - _Method to be used for secondary comparison_
*   **threshold**- _Numeric vector of probabilities with values in [0,1]_

</div>

<div id="details" class="section level4">

#### Details

This is an extension of the Jaccard algorithm, best suited for strings with multiple words. It uses a secondary string comparison method to calculate similarity between all the words in the two strings to be compared.Next a set of tokens shared between the two strings are calculated provided the similarity is above a certain threshold. Finally, to get the similarity score a ratio of shared tokens by sum of shared tokens and unique tokens of the two strings.

</div>

<div id="value" class="section level4">

#### Value

Returns a vector with similarities, which are values between 0 and 1 where 1 corresponds to perfect similarity (distance 0) and 0 to complete dissimilarity.

</div>

<div id="methods-that-can-be-used-as-secondary-similarity-function" class="section level4">

#### Methods that can be used as secondary similarity function

*   **lv** - _Levenshtein similarity_
*   **osa** - _Optimal string aligment similarity_
*   **dl** - _Full Damerau-Levenshtein similarity_
*   **lcs** - _Longest common substring similarity_
*   **jw** - _Jaro Winkler similarity_

</div>

<div id="example" class="section level4">

#### Example

<div class="sourceCode">

    #calculate the similarity between two strings "kaspersky antivirus" and "kasper antivirus"
    stringCompare::extendedJaccard("Caspersky is awesome","Casper are antivirus","jw",0.85)
    > [1] 0.3333333

</div>

</div>

</div>

<div id="monge---elkan-string-comparison" class="section level3">

### 2\. Monge - Elkan String comparison

<div id="description-1" class="section level4">

#### Description

This algorithm extracts tokens (words sererated by whitespace) from the two input strings and then find the best matching pair of tokens in the set of tokens using a secondary similarity function.

</div>

<div id="usage-1" class="section level4">

#### Usage

`mongeElkan(_string1_,_string2_,_method=c(“osa”,“lv”,“dl”,“lcs”,“jw”)_)`

</div>

<div id="arguements-1" class="section level4">

#### Arguements

*   **string1** - _character string to be matched_
*   **string2** - _character string to be matched against_
*   **method** - _Method to be used for secondary comparison_

</div>

<div id="details-1" class="section level4">

#### Details

This method separates a string into tokens based on white spaces. And then each token from one string is compared against every other token in another string using a secondary comparison method. Next the average of the best match per token is taken to compute the Monge-Elkan Similarity score.

</div>

<div id="value-1" class="section level4">

#### Value

Returns a vector with similarities, which are values between 0 and 1 where 1 corresponds to perfect similarity (distance 0) and 0 to complete dissimilarity.

</div>

<div id="methods-that-can-be-used-as-secondary-similarity-function-1" class="section level4">

#### Methods that can be used as secondary similarity function

*   **lv** - _Levenshtein similarity_
*   **osa** - _Optimal string aligment similarity_
*   **dl** - _Full Damerau-Levenshtein similarity_
*   **lcs** - _Longest common substring similarity_
*   **jw** - _Jaro Winkler similarity_

</div>

<div id="example-1" class="section level4">

#### Example

<div class="sourceCode">

    #calculate the similarity between two strings "kaspersky antivirus" and "kasper antivirus"

    stringCompare::mongeElkan("Caspersky antivirus","Casper antivirus","jw")
    > [1] 0.9444444

</div>

</div>

</div>

</div>
