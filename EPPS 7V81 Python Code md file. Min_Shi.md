# EPPS 7V81 Final Project
 Min Shi -- July 21st - August 1st


```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns; sns.set(color_codes=True)
```

## Import dataframe 1


```python
df1 = pd.read_excel('Tariffs on US and China.xlsx')
df1 = df1.T
df1.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>0</th>
      <th>1</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th></th>
      <td>China's tariff on US exports</td>
      <td>US tariff on Chinese exports</td>
    </tr>
    <tr>
      <th>January 1, 2018</th>
      <td>8</td>
      <td>3.1</td>
    </tr>
    <tr>
      <th>February 7, 2018\nUS Section 201 tariffs on solar panels and washing machines</th>
      <td>8</td>
      <td>3.2</td>
    </tr>
    <tr>
      <th>March 23, 2018\nUS Section 232 tariffs on steel and aluminum</th>
      <td>8</td>
      <td>3.8</td>
    </tr>
    <tr>
      <th>April 2, 2018\nChina's retaliation to US Section 232 tariffs</th>
      <td>8.4</td>
      <td>3.8</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Change the column names again
cols = ['China tariff on US exports','US tariff on Chinese exports']
df1.columns = cols
df1 = df1[1:]
df1.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>China tariff on US exports</th>
      <th>US tariff on Chinese exports</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>January 1, 2018</th>
      <td>8</td>
      <td>3.1</td>
    </tr>
    <tr>
      <th>February 7, 2018\nUS Section 201 tariffs on solar panels and washing machines</th>
      <td>8</td>
      <td>3.2</td>
    </tr>
    <tr>
      <th>March 23, 2018\nUS Section 232 tariffs on steel and aluminum</th>
      <td>8</td>
      <td>3.8</td>
    </tr>
    <tr>
      <th>April 2, 2018\nChina's retaliation to US Section 232 tariffs</th>
      <td>8.4</td>
      <td>3.8</td>
    </tr>
    <tr>
      <th>May 1, 2018\nChina's MFN tariff cut on pharmeceuticals</th>
      <td>8.3</td>
      <td>3.8</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Add the Date Column
date = ['2018-01','2018-02','2018-03','2018-04','2018-05','2018-06','2018-07','2018-08','2018-09',
       '2018-10','2018-11','2018-12','2019-01','2019-02','2019-03','2019-04','2019-05','2019-06',
       '2019-07','2019-08','2019-09','2019-10','2019-11','2019-12','2020-01','2020-02','2020-03',
       '2020-04']
df1['Date'] = date
# Take the data from 2018-01 to 2020-02
df1 = df1[:-2]
df1.tail
```




    <bound method NDFrame.tail of                                                    China tariff on US exports  \
    January 1, 2018                                                             8   
    February 7, 2018\nUS Section 201 tariffs on sol...                          8   
    March 23, 2018\nUS Section 232 tariffs on steel...                          8   
    April 2, 2018\nChina's retaliation to US Sectio...                        8.4   
    May 1, 2018\nChina's MFN tariff cut on pharmece...                        8.3   
    May 1, 2018\nChina's MFN tariff cut on pharmece...                        8.3   
    July 6, 2018\nUS Section 301 tariffs ($34 billi...                       10.1   
    August 23, 2018\nUS Section 301 tariffs ($16 bi...                       14.4   
    September 24, 2018\nUS Section 301 tariffs ($20...                       18.3   
    September 24, 2018\nUS Section 301 tariffs ($20...                       18.3   
    November 1, 2018\nChina's MFN tariff cut on ind...                       18.2   
    November 1, 2018\nChina's MFN tariff cut on ind...                       18.2   
    January 1, 2019\nChina suspends retaliation aga...                       16.5   
    February 7, 2019\nUS Section 201 tariffs reduce...                       16.5   
    February 7, 2019\nUS Section 201 tariffs reduce...                       16.5   
    February 7, 2019\nUS Section 201 tariffs reduce...                       16.5   
    May/June 2019\nUS Section 301 tariffs (10% to 2...                       20.7   
    May/June 2019\nUS Section 301 tariffs (10% to 2...                       20.7   
    July 1, 2019\nChina's MFN tariff cut on IT prod...                       20.7   
    July 1, 2019\nChina's MFN tariff cut on IT prod...                       20.7   
    September 1, 2019\nUS Section 301 tariffs (15% ...                       21.8   
    September 17, 2019\nChina implements product ex...                       21.1   
    September 17, 2019\nChina implements product ex...                       21.1   
    December 26, 2019\nChina implements product exc...                    20.9127   
    December 26, 2019\nChina implements product exc...                    20.9127   
    February 7, 2020\nUS Section 201 tariffs reduce...                    20.9127   
    
                                                       US tariff on Chinese exports  \
    January 1, 2018                                                             3.1   
    February 7, 2018\nUS Section 201 tariffs on sol...                          3.2   
    March 23, 2018\nUS Section 232 tariffs on steel...                          3.8   
    April 2, 2018\nChina's retaliation to US Sectio...                          3.8   
    May 1, 2018\nChina's MFN tariff cut on pharmece...                          3.8   
    May 1, 2018\nChina's MFN tariff cut on pharmece...                          3.8   
    July 6, 2018\nUS Section 301 tariffs ($34 billi...                          6.7   
    August 23, 2018\nUS Section 301 tariffs ($16 bi...                          8.2   
    September 24, 2018\nUS Section 301 tariffs ($20...                           12   
    September 24, 2018\nUS Section 301 tariffs ($20...                           12   
    November 1, 2018\nChina's MFN tariff cut on ind...                           12   
    November 1, 2018\nChina's MFN tariff cut on ind...                           12   
    January 1, 2019\nChina suspends retaliation aga...                           12   
    February 7, 2019\nUS Section 201 tariffs reduce...                           12   
    February 7, 2019\nUS Section 201 tariffs reduce...                           12   
    February 7, 2019\nUS Section 201 tariffs reduce...                           12   
    May/June 2019\nUS Section 301 tariffs (10% to 2...                         17.6   
    May/June 2019\nUS Section 301 tariffs (10% to 2...                         17.6   
    July 1, 2019\nChina's MFN tariff cut on IT prod...                         17.6   
    July 1, 2019\nChina's MFN tariff cut on IT prod...                         17.6   
    September 1, 2019\nUS Section 301 tariffs (15% ...                      21.0356   
    September 17, 2019\nChina implements product ex...                      21.0356   
    September 17, 2019\nChina implements product ex...                      21.0356   
    December 26, 2019\nChina implements product exc...                      21.0356   
    December 26, 2019\nChina implements product exc...                      21.0356   
    February 7, 2020\nUS Section 201 tariffs reduce...                      21.0263   
    
                                                           Date  
    January 1, 2018                                     2018-01  
    February 7, 2018\nUS Section 201 tariffs on sol...  2018-02  
    March 23, 2018\nUS Section 232 tariffs on steel...  2018-03  
    April 2, 2018\nChina's retaliation to US Sectio...  2018-04  
    May 1, 2018\nChina's MFN tariff cut on pharmece...  2018-05  
    May 1, 2018\nChina's MFN tariff cut on pharmece...  2018-06  
    July 6, 2018\nUS Section 301 tariffs ($34 billi...  2018-07  
    August 23, 2018\nUS Section 301 tariffs ($16 bi...  2018-08  
    September 24, 2018\nUS Section 301 tariffs ($20...  2018-09  
    September 24, 2018\nUS Section 301 tariffs ($20...  2018-10  
    November 1, 2018\nChina's MFN tariff cut on ind...  2018-11  
    November 1, 2018\nChina's MFN tariff cut on ind...  2018-12  
    January 1, 2019\nChina suspends retaliation aga...  2019-01  
    February 7, 2019\nUS Section 201 tariffs reduce...  2019-02  
    February 7, 2019\nUS Section 201 tariffs reduce...  2019-03  
    February 7, 2019\nUS Section 201 tariffs reduce...  2019-04  
    May/June 2019\nUS Section 301 tariffs (10% to 2...  2019-05  
    May/June 2019\nUS Section 301 tariffs (10% to 2...  2019-06  
    July 1, 2019\nChina's MFN tariff cut on IT prod...  2019-07  
    July 1, 2019\nChina's MFN tariff cut on IT prod...  2019-08  
    September 1, 2019\nUS Section 301 tariffs (15% ...  2019-09  
    September 17, 2019\nChina implements product ex...  2019-10  
    September 17, 2019\nChina implements product ex...  2019-11  
    December 26, 2019\nChina implements product exc...  2019-12  
    December 26, 2019\nChina implements product exc...  2020-01  
    February 7, 2020\nUS Section 201 tariffs reduce...  2020-02  >



## Import dataframe 2


```python
df2 = pd.read_excel('U.S. International Trade in Goods and Services.xlsx')
df2.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>NaN</th>
      <th>Unnamed: 1</th>
      <th>Unnamed: 2</th>
      <th>Unnamed: 3</th>
      <th>Unnamed: 4</th>
      <th>Unnamed: 5</th>
      <th>Unnamed: 6</th>
      <th>Unnamed: 7</th>
      <th>Unnamed: 8</th>
      <th>Unnamed: 9</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Table 1. U.S. International Trade in Goods and...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Exports, Imports, and Balances</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>[Millions of dollars, months seasonally adjusted]</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Details may not equal totals due to seasonal a...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Period</td>
      <td>NaN</td>
      <td>Balance</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Exports</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Imports</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>NaN</td>
      <td>Total</td>
      <td>Goods 1</td>
      <td>Services</td>
      <td>Total</td>
      <td>Goods 1</td>
      <td>Services</td>
      <td>Total</td>
      <td>Goods 1</td>
      <td>Services</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Annual</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1960</td>
      <td>3508</td>
      <td>4892</td>
      <td>-1385</td>
      <td>25939</td>
      <td>19650</td>
      <td>6289</td>
      <td>22433</td>
      <td>14758</td>
      <td>7675</td>
    </tr>
    <tr>
      <th>9</th>
      <td>1961</td>
      <td>4194</td>
      <td>5571</td>
      <td>-1377</td>
      <td>26403</td>
      <td>20108</td>
      <td>6295</td>
      <td>22208</td>
      <td>14537</td>
      <td>7671</td>
    </tr>
  </tbody>
</table>
</div>




```python
## Drop the columns that are not useful
drop_col = ['Unnamed: 2','Unnamed: 3','Unnamed: 5','Unnamed: 6','Unnamed: 8','Unnamed: 9']
df2.drop(drop_col, axis=1, inplace=True)
df2.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>NaN</th>
      <th>Unnamed: 1</th>
      <th>Unnamed: 4</th>
      <th>Unnamed: 7</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Table 1. U.S. International Trade in Goods and...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Exports, Imports, and Balances</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>2</th>
      <td>[Millions of dollars, months seasonally adjusted]</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Details may not equal totals due to seasonal a...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>4</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Period</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>6</th>
      <td>NaN</td>
      <td>Total</td>
      <td>Total</td>
      <td>Total</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Annual</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>8</th>
      <td>1960</td>
      <td>3508</td>
      <td>25939</td>
      <td>22433</td>
    </tr>
    <tr>
      <th>9</th>
      <td>1961</td>
      <td>4194</td>
      <td>26403</td>
      <td>22208</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2.tail(40)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>NaN</th>
      <th>Unnamed: 1</th>
      <th>Unnamed: 4</th>
      <th>Unnamed: 7</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>377</th>
      <td>2017 Sep (R)</td>
      <td>-41165</td>
      <td>200589</td>
      <td>241754</td>
    </tr>
    <tr>
      <th>378</th>
      <td>2017 Oct (R)</td>
      <td>-42644</td>
      <td>202314</td>
      <td>244958</td>
    </tr>
    <tr>
      <th>379</th>
      <td>2017 Nov (R)</td>
      <td>-45558</td>
      <td>206199</td>
      <td>251757</td>
    </tr>
    <tr>
      <th>380</th>
      <td>2017 Dec (R)</td>
      <td>-47109</td>
      <td>209576</td>
      <td>256685</td>
    </tr>
    <tr>
      <th>381</th>
      <td>2018 Jan (R)</td>
      <td>-47247</td>
      <td>207127</td>
      <td>254374</td>
    </tr>
    <tr>
      <th>382</th>
      <td>2018 Feb (R)</td>
      <td>-48714</td>
      <td>209943</td>
      <td>258657</td>
    </tr>
    <tr>
      <th>383</th>
      <td>2018 Mar (R)</td>
      <td>-42893</td>
      <td>213279</td>
      <td>256173</td>
    </tr>
    <tr>
      <th>384</th>
      <td>2018 Apr (R)</td>
      <td>-44666</td>
      <td>212096</td>
      <td>256762</td>
    </tr>
    <tr>
      <th>385</th>
      <td>2018 May (R)</td>
      <td>-41160</td>
      <td>215032</td>
      <td>256192</td>
    </tr>
    <tr>
      <th>386</th>
      <td>2018 Jun (R)</td>
      <td>-44404</td>
      <td>212549</td>
      <td>256953</td>
    </tr>
    <tr>
      <th>387</th>
      <td>2018 Jul (R)</td>
      <td>-50572</td>
      <td>210606</td>
      <td>261179</td>
    </tr>
    <tr>
      <th>388</th>
      <td>2018 Aug (R)</td>
      <td>-50381</td>
      <td>210833</td>
      <td>261214</td>
    </tr>
    <tr>
      <th>389</th>
      <td>2018 Sep (R)</td>
      <td>-51453</td>
      <td>213188</td>
      <td>264641</td>
    </tr>
    <tr>
      <th>390</th>
      <td>2018 Oct (R)</td>
      <td>-52398</td>
      <td>214322</td>
      <td>266719</td>
    </tr>
    <tr>
      <th>391</th>
      <td>2018 Nov (R)</td>
      <td>-49634</td>
      <td>211465</td>
      <td>261099</td>
    </tr>
    <tr>
      <th>392</th>
      <td>2018 Dec (R)</td>
      <td>-56413</td>
      <td>208944</td>
      <td>265357</td>
    </tr>
    <tr>
      <th>393</th>
      <td>2019 Jan (R)</td>
      <td>-49023</td>
      <td>210243</td>
      <td>259267</td>
    </tr>
    <tr>
      <th>394</th>
      <td>2019 Feb (R)</td>
      <td>-47300</td>
      <td>210809</td>
      <td>258109</td>
    </tr>
    <tr>
      <th>395</th>
      <td>2019 Mar (R)</td>
      <td>-48914</td>
      <td>213157</td>
      <td>262072</td>
    </tr>
    <tr>
      <th>396</th>
      <td>2019 Apr (R)</td>
      <td>-49203</td>
      <td>209288</td>
      <td>258491</td>
    </tr>
    <tr>
      <th>397</th>
      <td>2019 May (R)</td>
      <td>-51258</td>
      <td>212852</td>
      <td>264110</td>
    </tr>
    <tr>
      <th>398</th>
      <td>2019 Jun (R)</td>
      <td>-51749</td>
      <td>209254</td>
      <td>261003</td>
    </tr>
    <tr>
      <th>399</th>
      <td>2019 Jul (R)</td>
      <td>-51041</td>
      <td>210462</td>
      <td>261503</td>
    </tr>
    <tr>
      <th>400</th>
      <td>2019 Aug (R)</td>
      <td>-50778</td>
      <td>210517</td>
      <td>261295</td>
    </tr>
    <tr>
      <th>401</th>
      <td>2019 Sep (R)</td>
      <td>-47839</td>
      <td>209210</td>
      <td>257049</td>
    </tr>
    <tr>
      <th>402</th>
      <td>2019 Oct (R)</td>
      <td>-43029</td>
      <td>210403</td>
      <td>253432</td>
    </tr>
    <tr>
      <th>403</th>
      <td>2019 Nov (R)</td>
      <td>-41054</td>
      <td>210571</td>
      <td>251625</td>
    </tr>
    <tr>
      <th>404</th>
      <td>2019 Dec (R)</td>
      <td>-45676</td>
      <td>211496</td>
      <td>257171</td>
    </tr>
    <tr>
      <th>405</th>
      <td>2020 Jan (R)</td>
      <td>-42042</td>
      <td>210446</td>
      <td>252488</td>
    </tr>
    <tr>
      <th>406</th>
      <td>2020 Feb (R)</td>
      <td>-34672</td>
      <td>211752</td>
      <td>246425</td>
    </tr>
    <tr>
      <th>407</th>
      <td>2020 Mar (R)</td>
      <td>-42340</td>
      <td>190184</td>
      <td>232524</td>
    </tr>
    <tr>
      <th>408</th>
      <td>2020 Apr</td>
      <td>-49408</td>
      <td>151281</td>
      <td>200690</td>
    </tr>
    <tr>
      <th>409</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>410</th>
      <td>(R) Revised</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>411</th>
      <td>1 Data are presented on a balance of payments ...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>412</th>
      <td>www.bea.gov/international/detailed-trade-data</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>413</th>
      <td>For information on data sources and methodolog...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>414</th>
      <td>www.bea.gov/data/intl-trade-investment/interna...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>415</th>
      <td>BEA's full set of statistics for the U.S. inte...</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>416</th>
      <td>www.bea.gov/data/economic-accounts/international</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>




```python
## Drop the unneeded rows
df2 = df2[381:409:1]
```


```python
# Change the column names for df2
cols = ['Date','US Global Balance','US Global Exports','US Global Imports']
df2.columns = cols
```


```python
# Add the date column
date = ['2018-01','2018-02','2018-03','2018-04','2018-05','2018-06','2018-07','2018-08','2018-09',
       '2018-10','2018-11','2018-12','2019-01','2019-02','2019-03','2019-04','2019-05','2019-06',
       '2019-07','2019-08','2019-09','2019-10','2019-11','2019-12','2020-01','2020-02','2020-03',
       '2020-04']
df2['Date'] = date
df2.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>US Global Balance</th>
      <th>US Global Exports</th>
      <th>US Global Imports</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>381</th>
      <td>2018-01</td>
      <td>-47247</td>
      <td>207127</td>
      <td>254374</td>
    </tr>
    <tr>
      <th>382</th>
      <td>2018-02</td>
      <td>-48714</td>
      <td>209943</td>
      <td>258657</td>
    </tr>
    <tr>
      <th>383</th>
      <td>2018-03</td>
      <td>-42893</td>
      <td>213279</td>
      <td>256173</td>
    </tr>
    <tr>
      <th>384</th>
      <td>2018-04</td>
      <td>-44666</td>
      <td>212096</td>
      <td>256762</td>
    </tr>
    <tr>
      <th>385</th>
      <td>2018-05</td>
      <td>-41160</td>
      <td>215032</td>
      <td>256192</td>
    </tr>
  </tbody>
</table>
</div>




```python
df2.tail
```




    <bound method NDFrame.tail of         Date US Global Balance US Global Exports US Global Imports
    381  2018-01            -47247            207127            254374
    382  2018-02            -48714            209943            258657
    383  2018-03            -42893            213279            256173
    384  2018-04            -44666            212096            256762
    385  2018-05            -41160            215032            256192
    386  2018-06            -44404            212549            256953
    387  2018-07            -50572            210606            261179
    388  2018-08            -50381            210833            261214
    389  2018-09            -51453            213188            264641
    390  2018-10            -52398            214322            266719
    391  2018-11            -49634            211465            261099
    392  2018-12            -56413            208944            265357
    393  2019-01            -49023            210243            259267
    394  2019-02            -47300            210809            258109
    395  2019-03            -48914            213157            262072
    396  2019-04            -49203            209288            258491
    397  2019-05            -51258            212852            264110
    398  2019-06            -51749            209254            261003
    399  2019-07            -51041            210462            261503
    400  2019-08            -50778            210517            261295
    401  2019-09            -47839            209210            257049
    402  2019-10            -43029            210403            253432
    403  2019-11            -41054            210571            251625
    404  2019-12            -45676            211496            257171
    405  2020-01            -42042            210446            252488
    406  2020-02            -34672            211752            246425
    407  2020-03            -42340            190184            232524
    408  2020-04            -49408            151281            200690>



## Import dataframe 3


```python
df3 = pd.read_excel('U.S. trade in goods with China.xlsx')
# Choose the data from January 2018
df3 = df3[12:]
df3.head
```




    <bound method NDFrame.head of               Month    Exports    Imports     Balance
    12    January 2018    9,910.2   45,749.9   -35,839.7 
    13   February 2018    9,741.8   39,003.6   -29,261.9 
    14      March 2018   12,653.2   38,295.1   -25,641.9 
    15      April 2018   10,510.5   38,269.4   -27,758.9 
    16        May 2018   10,396.6   43,938.7   -33,542.0 
    17       June 2018   10,858.3   44,571.2   -33,712.9 
    18       July 2018   10,156.5   47,087.6   -36,931.1 
    19     August 2018    9,280.9   47,817.5   -38,536.6 
    20  September 2018    9,732.4   49,988.1   -40,255.7 
    21    October 2018    9,187.5   52,170.1   -42,982.6 
    22   November 2018    8,650.9   46,445.7   -37,794.8 
    23   December 2018    9,210.5   45,906.3     -36695.9
    24    January 2019    7,105.1   41,514.4   -34,409.3 
    25   February 2019    8,083.3   33,154.9   -25,071.6 
    26      March 2019   10,574.9   31,175.6   -20,600.6 
    27      April 2019    7,883.0   34,682.7   -26,799.6 
    28        May 2019    9,069.4   39,173.4   -30,103.9 
    29       June 2019    9,166.7   38,967.6   -29,800.9 
    30       July 2019    8,694.3   41,449.2   -32,754.9 
    31     August 2019    9,415.6   41,151.1   -31,735.5 
    32  September 2019    8,597.3   40,165.5   -31,568.2 
    33    October 2019    8,851.2   40,114.9   -31,263.7 
    34   November 2019   10,103.3   36,436.6   -26,333.3 
    35   December 2019    8,903.0   33,665.5     -24762.6
    36    January 2020    7,215.3   33,280.6   -26,065.3 
    37   February 2020    6,815.0   22,813.1   -15,998.1 
    38      March 2020    7,971.9   19,805.4   -11,833.5 
    39      April 2020    8,604.7   31,070.8   -22,466.1 
    40        May 2020    9,641.7   36,598.2   -26,956.5 >




```python
# change the context of column 'Date' for df3
date = ['2018-01','2018-02','2018-03','2018-04','2018-05','2018-06','2018-07','2018-08','2018-09',
       '2018-10','2018-11','2018-12','2019-01','2019-02','2019-03','2019-04','2019-05','2019-06',
       '2019-07','2019-08','2019-09','2019-10','2019-11','2019-12','2020-01','2020-02','2020-03',
       '2020-04','2020-05']
df3['Month'] = date
```


```python
cols = ['Date','Exports to China','Imports from China','Trade Balance with China']
df3.columns = cols
df3.tail(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>Exports to China</th>
      <th>Imports from China</th>
      <th>Trade Balance with China</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>31</th>
      <td>2019-08</td>
      <td>9,415.6</td>
      <td>41,151.1</td>
      <td>-31,735.5</td>
    </tr>
    <tr>
      <th>32</th>
      <td>2019-09</td>
      <td>8,597.3</td>
      <td>40,165.5</td>
      <td>-31,568.2</td>
    </tr>
    <tr>
      <th>33</th>
      <td>2019-10</td>
      <td>8,851.2</td>
      <td>40,114.9</td>
      <td>-31,263.7</td>
    </tr>
    <tr>
      <th>34</th>
      <td>2019-11</td>
      <td>10,103.3</td>
      <td>36,436.6</td>
      <td>-26,333.3</td>
    </tr>
    <tr>
      <th>35</th>
      <td>2019-12</td>
      <td>8,903.0</td>
      <td>33,665.5</td>
      <td>-24762.6</td>
    </tr>
    <tr>
      <th>36</th>
      <td>2020-01</td>
      <td>7,215.3</td>
      <td>33,280.6</td>
      <td>-26,065.3</td>
    </tr>
    <tr>
      <th>37</th>
      <td>2020-02</td>
      <td>6,815.0</td>
      <td>22,813.1</td>
      <td>-15,998.1</td>
    </tr>
    <tr>
      <th>38</th>
      <td>2020-03</td>
      <td>7,971.9</td>
      <td>19,805.4</td>
      <td>-11,833.5</td>
    </tr>
    <tr>
      <th>39</th>
      <td>2020-04</td>
      <td>8,604.7</td>
      <td>31,070.8</td>
      <td>-22,466.1</td>
    </tr>
    <tr>
      <th>40</th>
      <td>2020-05</td>
      <td>9,641.7</td>
      <td>36,598.2</td>
      <td>-26,956.5</td>
    </tr>
  </tbody>
</table>
</div>



## Import dataframe 4


```python
df4 = pd.read_excel('US Monthly GDP.xlsx')
df4.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>US Monthly GDP(Trillion of  dollars)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2018-01-01</td>
      <td>20.10</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2018-02-01</td>
      <td>20.18</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2018-03-01</td>
      <td>20.21</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2018-04-01</td>
      <td>20.37</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2018-05-01</td>
      <td>20.59</td>
    </tr>
  </tbody>
</table>
</div>




```python
# change the format of column 'Date' for df4
date = ['2018-01','2018-02','2018-03','2018-04','2018-05','2018-06','2018-07','2018-08','2018-09',
       '2018-10','2018-11','2018-12','2019-01','2019-02','2019-03','2019-04','2019-05','2019-06',
       '2019-07','2019-08','2019-09','2019-10','2019-11','2019-12','2020-01','2020-02','2020-03',
       '2020-04','2020-05']
df4['Date'] = date
df4.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>US Monthly GDP(Trillion of  dollars)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2018-01</td>
      <td>20.10</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2018-02</td>
      <td>20.18</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2018-03</td>
      <td>20.21</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2018-04</td>
      <td>20.37</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2018-05</td>
      <td>20.59</td>
    </tr>
  </tbody>
</table>
</div>




```python
cols = ['Date','US GDP']
df4.columns = cols
df4.tail(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>US GDP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>19</th>
      <td>2019-08</td>
      <td>21.52</td>
    </tr>
    <tr>
      <th>20</th>
      <td>2019-09</td>
      <td>21.59</td>
    </tr>
    <tr>
      <th>21</th>
      <td>2019-10</td>
      <td>21.67</td>
    </tr>
    <tr>
      <th>22</th>
      <td>2019-11</td>
      <td>21.71</td>
    </tr>
    <tr>
      <th>23</th>
      <td>2019-12</td>
      <td>21.81</td>
    </tr>
    <tr>
      <th>24</th>
      <td>2020-01</td>
      <td>21.83</td>
    </tr>
    <tr>
      <th>25</th>
      <td>2020-02</td>
      <td>21.98</td>
    </tr>
    <tr>
      <th>26</th>
      <td>2020-03</td>
      <td>20.81</td>
    </tr>
    <tr>
      <th>27</th>
      <td>2020-04</td>
      <td>18.43</td>
    </tr>
    <tr>
      <th>28</th>
      <td>2020-05</td>
      <td>19.23</td>
    </tr>
  </tbody>
</table>
</div>



## Import dataframe 5


```python
df5 = pd.read_excel('US Monthly Unemployment Rate.xlsx')
df5.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>US Unemployment Rate(%)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2018-01-01</td>
      <td>0.041</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2018-02-01</td>
      <td>0.041</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2018-03-01</td>
      <td>0.040</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2018-04-01</td>
      <td>0.040</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2018-05-01</td>
      <td>0.038</td>
    </tr>
  </tbody>
</table>
</div>




```python
# change the format of column 'Date' for df5
date = ['2018-01','2018-02','2018-03','2018-04','2018-05','2018-06','2018-07','2018-08','2018-09',
       '2018-10','2018-11','2018-12','2019-01','2019-02','2019-03','2019-04','2019-05','2019-06',
       '2019-07','2019-08','2019-09','2019-10','2019-11','2019-12','2020-01','2020-02','2020-03',
       '2020-04','2020-05']
df5['Date'] = date
df5.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>US Unemployment Rate(%)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2018-01</td>
      <td>0.041</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2018-02</td>
      <td>0.041</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2018-03</td>
      <td>0.040</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2018-04</td>
      <td>0.040</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2018-05</td>
      <td>0.038</td>
    </tr>
  </tbody>
</table>
</div>




```python
cols = ['Date','US Unemployment Rate']
df5.columns = cols
df5.tail(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>US Unemployment Rate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>19</th>
      <td>2019-08</td>
      <td>0.037</td>
    </tr>
    <tr>
      <th>20</th>
      <td>2019-09</td>
      <td>0.035</td>
    </tr>
    <tr>
      <th>21</th>
      <td>2019-10</td>
      <td>0.036</td>
    </tr>
    <tr>
      <th>22</th>
      <td>2019-11</td>
      <td>0.035</td>
    </tr>
    <tr>
      <th>23</th>
      <td>2019-12</td>
      <td>0.035</td>
    </tr>
    <tr>
      <th>24</th>
      <td>2020-01</td>
      <td>0.036</td>
    </tr>
    <tr>
      <th>25</th>
      <td>2020-02</td>
      <td>0.035</td>
    </tr>
    <tr>
      <th>26</th>
      <td>2020-03</td>
      <td>0.044</td>
    </tr>
    <tr>
      <th>27</th>
      <td>2020-04</td>
      <td>0.147</td>
    </tr>
    <tr>
      <th>28</th>
      <td>2020-05</td>
      <td>0.133</td>
    </tr>
  </tbody>
</table>
</div>



## Import dataframe 6


```python
df6 = pd.read_excel('US Monthly CPI.xlsx')
df6.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>Consumer Price Index</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2018-01-01</td>
      <td>247.867</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2018-02-01</td>
      <td>248.991</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2018-03-01</td>
      <td>249.554</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2018-04-01</td>
      <td>250.546</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2018-05-01</td>
      <td>251.588</td>
    </tr>
  </tbody>
</table>
</div>




```python
# change the format of column 'Date' for df6
date = ['2018-01','2018-02','2018-03','2018-04','2018-05','2018-06','2018-07','2018-08','2018-09',
       '2018-10','2018-11','2018-12','2019-01','2019-02','2019-03','2019-04','2019-05','2019-06',
       '2019-07','2019-08','2019-09','2019-10','2019-11','2019-12','2020-01','2020-02','2020-03',
       '2020-04','2020-05']
df6['Date'] = date
df6.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>Consumer Price Index</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2018-01</td>
      <td>247.867</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2018-02</td>
      <td>248.991</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2018-03</td>
      <td>249.554</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2018-04</td>
      <td>250.546</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2018-05</td>
      <td>251.588</td>
    </tr>
  </tbody>
</table>
</div>




```python
cols = ['Date','CPI']
df6.columns = cols
df6.tail(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>CPI</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>19</th>
      <td>2019-08</td>
      <td>256.759</td>
    </tr>
    <tr>
      <th>20</th>
      <td>2019-09</td>
      <td>257.346</td>
    </tr>
    <tr>
      <th>21</th>
      <td>2019-10</td>
      <td>257.208</td>
    </tr>
    <tr>
      <th>22</th>
      <td>2019-11</td>
      <td>257.971</td>
    </tr>
    <tr>
      <th>23</th>
      <td>2019-12</td>
      <td>258.678</td>
    </tr>
    <tr>
      <th>24</th>
      <td>2020-01</td>
      <td>258.115</td>
    </tr>
    <tr>
      <th>25</th>
      <td>2020-02</td>
      <td>256.389</td>
    </tr>
    <tr>
      <th>26</th>
      <td>2020-03</td>
      <td>256.394</td>
    </tr>
    <tr>
      <th>27</th>
      <td>2020-04</td>
      <td>257.797</td>
    </tr>
    <tr>
      <th>28</th>
      <td>2020-05</td>
      <td>NaN</td>
    </tr>
  </tbody>
</table>
</div>



## Dataframe Merging


```python
df1a = df1.set_index('Date')
df2a = df2.set_index('Date')
df3a = df3.set_index('Date')
df4a = df4.set_index('Date')
df5a = df5.set_index('Date')
df6a = df6.set_index('Date')
df7 = pd.merge(df1a, df2a, left_index = True, right_index = True)
df8 = pd.merge(df7,df3a,left_index = True, right_index = True)
df9 = pd.merge(df8,df4a,left_index = True, right_index = True)
df10 = pd.merge(df9,df5a,left_index = True, right_index = True)
df11 = pd.merge(df10,df6a,left_index = True, right_index = True)
# Add 'Date' column for the merging dataset
date = ['2018-01','2018-02','2018-03','2018-04','2018-05','2018-06','2018-07','2018-08','2018-09',
       '2018-10','2018-11','2018-12','2019-01','2019-02','2019-03','2019-04','2019-05','2019-06',
       '2019-07','2019-08','2019-09','2019-10','2019-11','2019-12','2020-01','2020-02']
df11.insert (0, "Date", date)
df11.to_csv ('Dataset.csv', index = False, header=True)
```

## Data Visualization


```python
import pandas as pd
import numpy as np
df = pd.read_csv('Dataset.csv')
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 26 entries, 0 to 25
    Data columns (total 12 columns):
     #   Column                        Non-Null Count  Dtype  
    ---  ------                        --------------  -----  
     0   Date                          26 non-null     object 
     1   China tariff on US exports    26 non-null     float64
     2   US tariff on Chinese exports  26 non-null     float64
     3   US Global Balance             26 non-null     int64  
     4   US Global Exports             26 non-null     int64  
     5   US Global Imports             26 non-null     int64  
     6   Exports to China              26 non-null     object 
     7   Imports from China            26 non-null     object 
     8   Trade Balance with China      26 non-null     object 
     9   US GDP                        26 non-null     float64
     10  US Unemployment Rate          26 non-null     float64
     11  CPI                           26 non-null     float64
    dtypes: float64(5), int64(3), object(4)
    memory usage: 2.6+ KB



```python
# The distribution of missing values for each column
print(df.isnull().sum(), end='\n\n')
```

    Date                            0
    China tariff on US exports      0
    US tariff on Chinese exports    0
    US Global Balance               0
    US Global Exports               0
    US Global Imports               0
    Exports to China                0
    Imports from China              0
    Trade Balance with China        0
    US GDP                          0
    US Unemployment Rate            0
    CPI                             0
    dtype: int64
    



```python
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>China tariff on US exports</th>
      <th>US tariff on Chinese exports</th>
      <th>US Global Balance</th>
      <th>US Global Exports</th>
      <th>US Global Imports</th>
      <th>Exports to China</th>
      <th>Imports from China</th>
      <th>Trade Balance with China</th>
      <th>US GDP</th>
      <th>US Unemployment Rate</th>
      <th>CPI</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2018-01</td>
      <td>8.0</td>
      <td>3.1</td>
      <td>-47247</td>
      <td>207127</td>
      <td>254374</td>
      <td>9,910.2</td>
      <td>45,749.9</td>
      <td>-35,839.7</td>
      <td>20.10</td>
      <td>0.041</td>
      <td>247.867</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2018-02</td>
      <td>8.0</td>
      <td>3.2</td>
      <td>-48714</td>
      <td>209943</td>
      <td>258657</td>
      <td>9,741.8</td>
      <td>39,003.6</td>
      <td>-29,261.9</td>
      <td>20.18</td>
      <td>0.041</td>
      <td>248.991</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2018-03</td>
      <td>8.0</td>
      <td>3.8</td>
      <td>-42893</td>
      <td>213279</td>
      <td>256173</td>
      <td>12,653.2</td>
      <td>38,295.1</td>
      <td>-25,641.9</td>
      <td>20.21</td>
      <td>0.040</td>
      <td>249.554</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2018-04</td>
      <td>8.4</td>
      <td>3.8</td>
      <td>-44666</td>
      <td>212096</td>
      <td>256762</td>
      <td>10,510.5</td>
      <td>38,269.4</td>
      <td>-27,758.9</td>
      <td>20.37</td>
      <td>0.040</td>
      <td>250.546</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2018-05</td>
      <td>8.3</td>
      <td>3.8</td>
      <td>-41160</td>
      <td>215032</td>
      <td>256192</td>
      <td>10,396.6</td>
      <td>43,938.7</td>
      <td>-33,542.0</td>
      <td>20.59</td>
      <td>0.038</td>
      <td>251.588</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.tail()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Date</th>
      <th>China tariff on US exports</th>
      <th>US tariff on Chinese exports</th>
      <th>US Global Balance</th>
      <th>US Global Exports</th>
      <th>US Global Imports</th>
      <th>Exports to China</th>
      <th>Imports from China</th>
      <th>Trade Balance with China</th>
      <th>US GDP</th>
      <th>US Unemployment Rate</th>
      <th>CPI</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>21</th>
      <td>2019-10</td>
      <td>21.100000</td>
      <td>21.03562</td>
      <td>-43029</td>
      <td>210403</td>
      <td>253432</td>
      <td>8,851.2</td>
      <td>40,114.9</td>
      <td>-31,263.7</td>
      <td>21.67</td>
      <td>0.036</td>
      <td>257.208</td>
    </tr>
    <tr>
      <th>22</th>
      <td>2019-11</td>
      <td>21.100000</td>
      <td>21.03562</td>
      <td>-41054</td>
      <td>210571</td>
      <td>251625</td>
      <td>10,103.3</td>
      <td>36,436.6</td>
      <td>-26,333.3</td>
      <td>21.71</td>
      <td>0.035</td>
      <td>257.971</td>
    </tr>
    <tr>
      <th>23</th>
      <td>2019-12</td>
      <td>20.912747</td>
      <td>21.03562</td>
      <td>-45676</td>
      <td>211496</td>
      <td>257171</td>
      <td>8,903.0</td>
      <td>33,665.5</td>
      <td>-24762.6</td>
      <td>21.81</td>
      <td>0.035</td>
      <td>258.678</td>
    </tr>
    <tr>
      <th>24</th>
      <td>2020-01</td>
      <td>20.912747</td>
      <td>21.03562</td>
      <td>-42042</td>
      <td>210446</td>
      <td>252488</td>
      <td>7,215.3</td>
      <td>33,280.6</td>
      <td>-26,065.3</td>
      <td>21.83</td>
      <td>0.036</td>
      <td>258.115</td>
    </tr>
    <tr>
      <th>25</th>
      <td>2020-02</td>
      <td>20.912747</td>
      <td>21.02625</td>
      <td>-34672</td>
      <td>211752</td>
      <td>246425</td>
      <td>6,815.0</td>
      <td>22,813.1</td>
      <td>-15,998.1</td>
      <td>21.98</td>
      <td>0.035</td>
      <td>256.389</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Change the object columns into float.
df['Exports to China'] = df['Exports to China'].str.replace(',', '').astype(float)
df['Imports from China'] = df['Imports from China'].str.replace(',', '').astype(float)
df['Trade Balance with China'] = df['Trade Balance with China'].str.replace(',', '').astype(float)

# to datetime
from datetime import datetime
df['Date'] = df['Date'].str.replace('-', '').astype(str)
#df.iloc[:, 0] = df.iloc[:, 0].astype('object').astype('int').astype('str').applymap(
    #lambda x: datetime.strptime(x, '%Y%m'))
df['Date'] = df['Date'].apply(lambda x: datetime.strptime(x, '%Y%m'))

df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 26 entries, 0 to 25
    Data columns (total 12 columns):
     #   Column                        Non-Null Count  Dtype         
    ---  ------                        --------------  -----         
     0   Date                          26 non-null     datetime64[ns]
     1   China tariff on US exports    26 non-null     float64       
     2   US tariff on Chinese exports  26 non-null     float64       
     3   US Global Balance             26 non-null     int64         
     4   US Global Exports             26 non-null     int64         
     5   US Global Imports             26 non-null     int64         
     6   Exports to China              26 non-null     float64       
     7   Imports from China            26 non-null     float64       
     8   Trade Balance with China      26 non-null     float64       
     9   US GDP                        26 non-null     float64       
     10  US Unemployment Rate          26 non-null     float64       
     11  CPI                           26 non-null     float64       
    dtypes: datetime64[ns](1), float64(8), int64(3)
    memory usage: 2.6 KB



```python
# Show the basic statistical information about the dataset
df.to_csv('Dataset1.csv', header=True, index=False)
df.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>China tariff on US exports</th>
      <th>US tariff on Chinese exports</th>
      <th>US Global Balance</th>
      <th>US Global Exports</th>
      <th>US Global Imports</th>
      <th>Exports to China</th>
      <th>Imports from China</th>
      <th>Trade Balance with China</th>
      <th>US GDP</th>
      <th>US Unemployment Rate</th>
      <th>CPI</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>26.000000</td>
      <td>26.000000</td>
      <td>26.000000</td>
      <td>26.000000</td>
      <td>26.000000</td>
      <td>26.000000</td>
      <td>26.000000</td>
      <td>26.000000</td>
      <td>26.000000</td>
      <td>26.000000</td>
      <td>26.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>16.232240</td>
      <td>12.654013</td>
      <td>-47442.807692</td>
      <td>211147.846154</td>
      <td>258590.769231</td>
      <td>9260.257692</td>
      <td>40268.780769</td>
      <td>-31008.519231</td>
      <td>21.073462</td>
      <td>0.037615</td>
      <td>254.004500</td>
    </tr>
    <tr>
      <th>std</th>
      <td>5.184565</td>
      <td>6.548723</td>
      <td>4664.284425</td>
      <td>1801.191998</td>
      <td>4619.130319</td>
      <td>1274.851730</td>
      <td>6523.833317</td>
      <td>6223.260946</td>
      <td>0.546699</td>
      <td>0.001878</td>
      <td>3.097674</td>
    </tr>
    <tr>
      <th>min</th>
      <td>8.000000</td>
      <td>3.100000</td>
      <td>-56413.000000</td>
      <td>207127.000000</td>
      <td>246425.000000</td>
      <td>6815.000000</td>
      <td>22813.100000</td>
      <td>-42982.600000</td>
      <td>20.100000</td>
      <td>0.035000</td>
      <td>247.867000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>11.175000</td>
      <td>7.075000</td>
      <td>-50726.500000</td>
      <td>210283.000000</td>
      <td>256334.500000</td>
      <td>8661.750000</td>
      <td>36894.800000</td>
      <td>-35482.100000</td>
      <td>20.725000</td>
      <td>0.036000</td>
      <td>251.993250</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>18.200000</td>
      <td>12.000000</td>
      <td>-48814.000000</td>
      <td>210707.500000</td>
      <td>258574.000000</td>
      <td>9199.000000</td>
      <td>40140.200000</td>
      <td>-31415.950000</td>
      <td>21.075000</td>
      <td>0.037500</td>
      <td>253.543500</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>20.700000</td>
      <td>17.600000</td>
      <td>-44469.500000</td>
      <td>212435.750000</td>
      <td>261274.750000</td>
      <td>10055.025000</td>
      <td>45455.225000</td>
      <td>-26449.875000</td>
      <td>21.520000</td>
      <td>0.038750</td>
      <td>256.567750</td>
    </tr>
    <tr>
      <th>max</th>
      <td>21.800000</td>
      <td>21.035620</td>
      <td>-34672.000000</td>
      <td>215032.000000</td>
      <td>266719.000000</td>
      <td>12653.200000</td>
      <td>52170.100000</td>
      <td>-15998.100000</td>
      <td>21.980000</td>
      <td>0.041000</td>
      <td>258.678000</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Read the new csv dataset as dataframe
df.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 26 entries, 0 to 25
    Data columns (total 12 columns):
     #   Column                        Non-Null Count  Dtype         
    ---  ------                        --------------  -----         
     0   Date                          26 non-null     datetime64[ns]
     1   China tariff on US exports    26 non-null     float64       
     2   US tariff on Chinese exports  26 non-null     float64       
     3   US Global Balance             26 non-null     int64         
     4   US Global Exports             26 non-null     int64         
     5   US Global Imports             26 non-null     int64         
     6   Exports to China              26 non-null     float64       
     7   Imports from China            26 non-null     float64       
     8   Trade Balance with China      26 non-null     float64       
     9   US GDP                        26 non-null     float64       
     10  US Unemployment Rate          26 non-null     float64       
     11  CPI                           26 non-null     float64       
    dtypes: datetime64[ns](1), float64(8), int64(3)
    memory usage: 2.6 KB



```python
# Plot a line graph to show the tendencies of China's tariff on US exports and US Tariffs towards Chinese goods.
fig, axes = plt.subplots(ncols=1, nrows=1, figsize=(15, 8))
Date = df['Date']
ChinaTariff = df['China tariff on US exports']
USTariff = df['US tariff on Chinese exports']


plt.plot(Date, ChinaTariff, label = "The Tendency of China tariff on US exports") 
plt.plot(Date, USTariff, label = "The Tendency of US tariff on Chinese exports") 
plt.title("Figure 1  The Tendency of US and China tariff towards Each Other", weight='bold').set_fontsize('20')
plt.xlabel('Date', weight='bold').set_fontsize('14')
plt.ylabel('Millions of Dollas', weight='bold').set_fontsize('14')
plt.legend(loc='best')
plt.show() 
fig.savefig('Figure 1 US China tariff tendency.png')
```


![png](output_40_0.png)



```python
# Plot a line graph to show the tendencies of US International Trade in Goods and Services
fig, axes = plt.subplots(ncols=1, nrows=1, figsize=(15, 8))
Date = df['Date']
USTariff = df['US tariff on Chinese exports']
USExports = df['US Global Exports']
USImports = df['US Global Imports']
USBalance = df['US Global Balance']

plt.plot(Date, USExports, label = "The Tendency of US Global Exports") 
plt.plot(Date, USImports, label = "The Tendency of US Global Imports") 
plt.plot(Date, USBalance, label = "The Tendency of US Global Balance") 
plt.title("Figure 2  The Tendency of US International Trade in Goods and Services", weight='bold').set_fontsize('20')
plt.xlabel('Date', weight='bold').set_fontsize('14')
plt.ylabel('Millions of Dollas', weight='bold').set_fontsize('14')
plt.legend(loc='best')
plt.show() 
fig.savefig('Figure 2  The Tendency of US International Trade in Goods and Services.png')
```


![png](output_41_0.png)



```python
# Plot a line graph to show the tendencies of US Tariffs towards Chinese goods and US Trade in Goods and Services with China
fig, axes = plt.subplots(ncols=1, nrows=1, figsize=(15, 8))
Date = df['Date']
USExChina = df['Exports to China']
USImChina = df['Imports from China']
USBaChina = df['Trade Balance with China']

plt.plot(Date, USExChina, label = "The Tendency of US Exports to China") 
plt.plot(Date, USImChina, label = "The Tendency of US Imports from China") 
plt.plot(Date, USBaChina, label = "The Tendency of US Trade Balance with China") 

plt.title("Figure 3  The Tendency of US Trade in Goods and Services with China", weight='bold').set_fontsize('20')
plt.xlabel('Date', weight='bold').set_fontsize('14')
plt.ylabel('Millions of Dollas', weight='bold').set_fontsize('14')

plt.legend(loc='best')
plt.show() 
fig.savefig('Figure 3  The Tendency of US Trade in Goods and Services with China.png')
```


![png](output_42_0.png)



```python
# Plot a line graph to show the tendencies of US monthly GDP.
fig, axes = plt.subplots(nrows=1, ncols=1, figsize=(15, 8))
Date = df['Date']
USGDP = df['US GDP']
plt.plot(Date, USGDP) 
plt.title("Figure 4  The Tendency of US GDP", weight='bold').set_fontsize('20')
plt.xlabel('Date', weight='bold').set_fontsize('14')
plt.ylabel('Trillions of  dollars', weight='bold').set_fontsize('14')
fig.savefig('Figure 4  US GDP tendency.png')
```


![png](output_43_0.png)



```python
# Plot a line graph to show the tendencies of US monthly GDP Growth rate.
GDP = df['US GDP']
GDPGrowth = []
for i in range(len(GDP)-1):
    growth = (GDP[i+1]- GDP[i])/GDP[i]
    GDPGrowth.append(growth)
Month = ['18-02','18-03','18-04','18-05','18-06','18-07','18-08','18-09',
       '18-10','18-11','18-12','19-01','19-02','19-03','19-04','19-05','19-06','19-07',
       '19-08','19-09','19-10','19-11','19-12','20-01','20-02']

fig, axes = plt.subplots(nrows=1, ncols=1, figsize=(15, 8))
plt.plot(Month, GDPGrowth) 
plt.title("Figure 5  The Tendency of US GDP Growth rate", weight='bold').set_fontsize('20')
plt.xlabel('Date', weight='bold').set_fontsize('14')
plt.ylabel('Percentage', weight='bold').set_fontsize('14')
fig.savefig('Figure 5 US GDP growth tendency.png')
```


![png](output_44_0.png)



```python
# Plot a line graph to show the tendencies of US monthly unemployment rate
fig, axes = plt.subplots(ncols=1, nrows=1, figsize=(15, 8))
USUnemp = df['US Unemployment Rate']
plt.plot(Date, USUnemp) 
plt.title("The Tendency of US Unemployment Rate", weight='bold').set_fontsize('20')
plt.xlabel('Date', weight='bold').set_fontsize('14')
plt.ylabel('Percentage(%)', weight='bold').set_fontsize('14')

plt.show() 
fig.savefig('US unemployment rate tendency.png')
```


![png](output_45_0.png)



```python
# Plot a line graph to show the tendencies of US monthly CPI.
fig, axes = plt.subplots(ncols=1, nrows=1, figsize=(15, 8))
CPI = df['CPI']
plt.plot(Date, CPI) 
plt.title("Figure 6  The Tendency of US Consumer Price Index", weight='bold').set_fontsize('20')
plt.xlabel('Date', weight='bold').set_fontsize('14')
plt.ylabel('Percentage(%)', weight='bold').set_fontsize('14')

plt.show() 
fig.savefig('Figure 6  US CPI tendency.png')
```


![png](output_46_0.png)



```python
# Plot a line graph to show the tendencies of US monthly CPI growth rate.
CPI1 = df['CPI']
CPIGrowth = []
for i in range(len(CPI1)-1):
    growth1 = (CPI1[i+1]- CPI1[i])/CPI1[i]
    CPIGrowth.append(growth1)
Month = ['18-02','18-03','18-04','18-05','18-06','18-07','18-08','18-09',
       '18-10','18-11','18-12','19-01','19-02','19-03','19-04','19-05','19-06','19-07',
       '19-08','19-09','19-10','19-11','19-12','20-01','20-02']

fig, axes = plt.subplots(ncols=1, nrows=1, figsize=(15, 8))
plt.plot(Month, CPIGrowth) 
plt.title("The Tendency of US Consumer Price Index growth rate", weight='bold').set_fontsize('20')
plt.xlabel('Date', weight='bold').set_fontsize('14')
plt.ylabel('Percentage(%)', weight='bold').set_fontsize('14')

plt.show() 
fig.savefig('US CPI tendency.png')
```


![png](output_47_0.png)



```python
import seaborn as sns; sns.set(color_codes=True)
from sklearn.model_selection import train_test_split 
from sklearn.linear_model import LinearRegression
from sklearn import metrics
```


```python
# Plot a scatter plot of 'US tariff on Chinese exports' and 'US Imports from China'
fig, axes = plt.subplots(ncols=1, nrows=1, figsize=(15, 8))
plt.title('Figure 7  US and China tariff towards each other vs US trade with China', weight='bold').set_fontsize('20')
plt.xlabel('US tariff towards Chinese goods', weight='bold').set_fontsize('14')
plt.ylabel('Imports from China', weight='bold').set_fontsize('14')

ax1 = sns.regplot(x = ChinaTariff, y = USExChina, data=df, color = 'orange', label = 'China tariff towards US goods vs US exports to China')
ax2 = sns.regplot(x = USTariff, y = USExChina, data=df, color = 'b', label = 'US tariff towards Chinese goods vs US exports to China')
ax3 = sns.regplot(x = USTariff, y = USImChina, data=df, color = 'g', label = 'US tariff towards Chinese goods vs US imports from China')
plt.legend(loc='best')
fig.savefig('Figure 7 US and China tariffs towards each other vs US trade with China.png')
```


![png](output_49_0.png)



```python
# Plot a scatter plot of 'US tariff on Chinese exports' and 'CPI'
fig, axes = plt.subplots(ncols=1, nrows=1, figsize=(15, 8))
#plt.scatter(USTariff, CPI, color = 'blue', marker = 'o')
plt.title('Figure 8  US and China tariff towards each other vs US CPI', weight='bold').set_fontsize('20')
plt.xlabel('US tariff towards Chinese goods', weight='bold').set_fontsize('14')
plt.ylabel('US CPI', weight='bold').set_fontsize('14')
ax1 = sns.regplot(x = USTariff, y = CPI, data=df, color = 'b', label = 'US tariff on Chinese goods vs US CPI')
ax2 = sns.regplot(x = ChinaTariff, y = CPI, data=df, color = 'orange', label = 'China tariff on US goods vs US CPI')
plt.legend(loc='best')
plt.show() 
fig.savefig('Figure 8 US and China tariff toward each other vs US CPI.jpg')
```


![png](output_50_0.png)



```python
# Plot a scatter plot of 'US tariff on Chinese exports' and 'US GDP'
fig, axes = plt.subplots(ncols=1, nrows=1, figsize=(15, 8))
plt.title('Figure 9  US and China tariff towards each other vs US GDP', weight='bold').set_fontsize('20')
plt.xlabel('US tariff towards Chinese goods', weight='bold').set_fontsize('14')
plt.ylabel('US GDP', weight='bold').set_fontsize('14')
ax1 = sns.regplot(x = USTariff, y = USGDP, data=df, color = 'b', label = 'US tariff on Chinese goods vs US GDP')
ax2 = sns.regplot(x = ChinaTariff, y = USGDP, data=df, color = 'orange', label = 'China tariff on US goods vs US GDP')
plt.legend(loc='best')
plt.show() 
```


![png](output_51_0.png)

