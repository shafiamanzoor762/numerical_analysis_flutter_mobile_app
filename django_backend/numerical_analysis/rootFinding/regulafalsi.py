import matplotlib.pyplot as plt
import numpy as np
import math
import os
import uuid


def regulafalsi_root(function, x0, x1,n):
    f = lambda x: eval(function)
    print(f)
    formula = lambda a, b: (a*f(b)  - b*f(a)) / (f(b) - f(a)) 
    diff = 0
    data = []

    for i in range(n):
        xn = formula(x0, x1)
        fnt = f(xn)       
        
        if f(xn) * f(x0) > 0:
            x0 = xn
        elif f(xn) * f(x1) > 0:
            x1 = xn
        else:
            break

        diff = abs(formula(x0, x1) - xn)
        data.append([i+1, x0, x1, xn, fnt, diff])

    os.makedirs('images', exist_ok=True)

    unique_filename = 'regulafalsi_plot_' + str(uuid.uuid4().hex) + '.png'
    plot_filename = os.path.join('images', unique_filename)

    plt.figure()
    plt.grid()
    plt.plot(range(len(data)), [row[5] for row in data])
    plt.title('Regula Falsi graph for $' + function +'$')
    plt.savefig(plot_filename)

    
    response_data = {
        'regulafalsi_data': data,
        'plot_image_url': unique_filename
    }
    return response_data
