import matplotlib.pyplot as plt
import numpy as np
import math
import os
import uuid


def secant_root(function, x0, x1,n):
    f = lambda x: eval(function)
    print(f)
    formula = lambda a, b: (a*f(b)  - b*f(a)) / (f(b) - f(a)) 
    diff = 0
    data = []
    i=0
    xn=0
    for i in range(n):
        i=i+1
        prev=xn
        xn = formula(x0, x1)
        diff = abs(xn - prev)
        data.append([i+1, x0, x1, xn, diff])
        x0 = x1
        x1 = xn
        if x0 == x1:
           break

    os.makedirs('images', exist_ok=True)

    unique_filename = 'secant_plot_' + str(uuid.uuid4().hex) + '.png'
    plot_filename = os.path.join('images', unique_filename)

    plt.figure()
    plt.grid()
    plt.plot(range(len(data)), [row[4] for row in data])
    plt.title('Secant graph for $' + function +'$')
    plt.savefig(plot_filename)

    
    response_data = {
        'secant_data': data,
        'plot_image_url': unique_filename
    }
    return response_data
