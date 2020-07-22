import numpy as np
import matplotlib.pyplot as plt
from operator import xor
from numpy.linalg import inv
import numpy as np
Z=np.loadtxt('C:\\Users\\***\\Z.txt',dtype=np.float32)
U=np.loadtxt('C:\\Users\\***\\DU.txt',dtype=np.double)
c0=np.zeros((4,1)) 
h1=np.zeros((4,1))   
c0=c0+0.1
p0=np.eye(4)
E=np.eye(4)
p0=1000*p0
c=np.zeros((4,499))
lamt=1
for k in range(2,499):
    h1[0,0]=Z[k-1]
    h1[1,0]=Z[k-2]
    h1[2,0]=U[k-1]
    h1[3,0]=U[k-2]
    m=inv((h1.T).dot(p0).dot(h1)+lamt)
    k1=p0.dot(h1)
    k1=k1.dot(m)
    new=Z[k]-h1.T.dot(c0)
    c1=c0+k1.dot(new)
    p1=(E-k1.dot(h1.T)).dot(p0)
    c[0:,k:k+1]=c1
    c0=c1
    p0=p1
res=c1
print(res)
np.savetxt('C:\\Users\\***\\res.txt',res,fmt='%f')    