#!/opt/venv/bin/python
# -*- coding: UTF-8 -*-

import pandas as dataFrame
from datetime import datetime
import matplotlib.pyplot as plt
import matplotlib.dates as mdates

df = dataFrame.read_csv('data.csv')
df['Date'] = df['Date'].map(lambda x: datetime.strptime(str(x), '%Y-%m-%d'))
x1 = df['Date']
y1 = df['Adj Close']

## plot
plt.plot(x1,y1,label="Data")
plt.show()
