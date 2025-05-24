import numpy as np
import matplotlib.pyplot as plt
import os
import uuid

def trapezoidal_rule(function, x0, x1,n,iteration):
    f=lambda x:eval(function)
    a=eval(x0)
    b=eval(x1)
    data = []
    
    x=np.linspace(a,b,iteration)
    y=f(x)
    plt.plot(x,y,color='black')
    for i in range(iteration-1):
         xp=[x[i],x[i],x[i+1],x[i+1]] #x trpezoidal plot
         yp=[0,y[i],y[i+1],0]
         plt.fill(xp,yp,edgecolor='gray',color='gray',alpha=0.2)
    xr=np.linspace(a,b,n+1)
    yr=f(xr)

    for i in range(n):
          xrp=[xr[i],xr[i],xr[i+1],xr[i+1]] #xr rectangle plot
          yrp=[0,yr[i],yr[i+1],0]
          plt.fill(xrp,yrp,edgecolor='green',color='green',alpha=0.2)    
    
    os.makedirs('images', exist_ok=True)

    unique_filename = 'trapezoidal_plot_' + str(uuid.uuid4().hex) + '.png'
    plot_filename = os.path.join('images', unique_filename)

    # plt.figure()
    plt.grid()
    dis_fun='$x^2exp^{2x}tanh(x)$'
    plt.title('Integral of '+dis_fun+ ' for n={}'.format(n))
    plt.savefig(plot_filename)
    
    h=(b-a)/n
    i=a+h
    res=0
    data.append([a,f(a)])
    while i<b-h:
         data.append([i,f(i)])
         res=res+f(i)
         i=i+h
    data.append([b,f(b)])
    res=h/2*(f(a)+2*res+f(b))
    
    
    response_data = {
         'trapezoidal_data' : data,
        'trapezoidal_result': res,
        'plot_image_url': unique_filename
    }
    return response_data
    