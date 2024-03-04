# -*- coding: UTF-8 -*-

import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0,2,10)

plt.figure()
plt.title('It works!')
plt.xlabel('x')
plt.ylabel('y')
plt.plot(x, x**3, label='cubic')
plt.legend()
plt.show()
