#!/usr/bin/env python
# coding: utf-8

# # data-scientist-exercise01

# References:
# https://www.datacamp.com/community/tutorials/decision-tree-classification-python

# ### 4. Import the "flattened" table (or CSV file) into your open source analytic environment of choice (R, Python, Java, etc.) and stage it for analysis.

# In[52]:


import pandas as pd
from sklearn.tree import DecisionTreeClassifier # Import Decision Tree Classifier
from sklearn.model_selection import train_test_split # Import train_test_split function
from sklearn import metrics #Import scikit-learn metrics module for accuracy calculation
from sklearn.impute import SimpleImputer

mydata= "flattenedRecords.csv"
df = pd.read_csv(mydata) 
#print(df)
df = df.mask(df=='?', float('NaN'))
df.head()


# ### 6. Split the data into training, validation, and test data sets.

# In[54]:


#split dataset in features and target variable
target = ['over50K']
feature_cols = ['age',
                'workClass',
                'eduLevel',
                'eduNum',
                'maritalStatus',
                'occupation',
                'relationship',
                'race',
                'sex',
                'capitalGain',
                'capitalLoss',
                'hoursPerWeek',
                'country']

X = df[feature_cols] # Features
y = df[target] # Target variable

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=1) # 70% training and 30% test


# In[55]:





# In[51]:


# Create Decision Tree classifer object
clf = DecisionTreeClassifier()

# Train Decision Tree Classifer
clf = clf.fit(X_train,y_train)

#Predict the response for test dataset
y_pred = clf.predict(X_test)

#ValueError: could not convert string to float: '?' 
    #for this reason I will now convert
    
print("Accuracy:",metrics.accuracy_score(y_test, y_pred))


# In[ ]:





# 

# In[ ]:





# In[ ]:





# 

# In[ ]:





# In[ ]:





# In[ ]:




