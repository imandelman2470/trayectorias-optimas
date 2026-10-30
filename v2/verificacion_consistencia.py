import numpy as np
m=56; n=2*m+1; j=np.arange(1,n+1); s=(j-1)/n; k=np.arange(1,m+1)[:,None]
def mats(s):
    N=len(s); M=np.zeros((n,N)); D=np.zeros((n,N)); D2=np.zeros((n,N)); I=np.zeros((n,N))
    M[0]=0.5; M[2*k.ravel()]=np.cos(2*np.pi*k*s); M[2*k.ravel()-1]=np.sin(2*np.pi*k*s)
    D[2*k.ravel()]=-2*np.pi*k*np.sin(2*np.pi*k*s); D[2*k.ravel()-1]=2*np.pi*k*np.cos(2*np.pi*k*s)
    D2[2*k.ravel()]=-(2*np.pi*k)**2*np.cos(2*np.pi*k*s); D2[2*k.ravel()-1]=-(2*np.pi*k)**2*np.sin(2*np.pi*k*s)
    I[0]=0.5*s; I[2*k.ravel()]=np.sin(2*np.pi*k*s)/(2*np.pi*k); I[2*k.ravel()-1]=(1-np.cos(2*np.pi*k*s))/(2*np.pi*k)
    return M,D,D2,I
M,D,D2,I=mats(s)
# 1) G5 del codigo vs G3 de la tesis
g5=I[:,-1]; g3=np.zeros(n); g3[0]=0.5
print("s ultimo nodo =",s[-1])
print("G5 codigo, coef a1 =",g5[0]," (tesis: 0.5)")
print("G5 codigo, max |coef trig| =",np.abs(g5[1:]).max()," (tesis: 0)")
# ejemplo: a = cos(2 pi s) + a1 tal que G5=0 -> integral real de a en [0,1]
a=np.zeros(n); a[2]=1.0; a[0]=-g5[2]/g5[0]
print("con G5=0: integral_0^1 a =",a[0]*0.5,"  => v(1)^2-v0^2 = 2p*",a[0]*0.5)
# 2) cuadratura Simpson del codigo vs trapecio periodico
q=np.ones(n); q[2:n-2:2]=2; q[1:n-1:2]=4; q/=3*(n-1)
for f,ex,name in [(lambda t:1/np.sqrt(2+np.cos(2*np.pi*t)),None,"1/sqrt(2+cos)")]:
    tf=np.linspace(0,1,200001)[:-1]; exact=f(tf).mean()
    print(name,": err Simpson-codigo =",abs(q@f(s)-exact)," err trapecio =",abs(f(s).mean()-exact))
# 3) chequeo de gradientes (port literal de fobj_fmincon / fres_fmincon)
rng=np.random.default_rng(0); g=9.81; mun=7; mut=1.9
cc=np.cos(2*np.pi*s); ss=np.sin(2*np.pi*s); alp=250*np.c_[cc,ss]; bet=1.5*alp
kap=np.sqrt(((bet-alp)**2).sum(1))
def unpack(x): return x[:n],x[n:2*n],x[2*n:3*n],x[-2],x[-1]
def fobj(x):
    c1,c2,a,p,v0=unpack(x); tmp=2*p*I.T@a+v0**2; Icv=1/np.sqrt(tmp); f=p*q@Icv
    DI=-0.5*Icv**3
    df=np.r_[np.zeros(2*n), p*(2*p*I)@(DI*q), q@Icv+p*q@(DI*(2*I.T@a)), p*q@(DI*2*v0)]
    return f,df
def fres(x):
    c1,c2,a,p,v0=unpack(x)
    cc1=M.T@c1; dc1=D.T@c1; d2c1=D2.T@c1; cc2=M.T@c2; dc2=D.T@c2; d2c2=D2.T@c2
    cv2=2*p*I.T@a+v0**2; ca=M.T@a; k2=d2c1**2+d2c2**2
    G=np.r_[dc1**2+dc2**2-1, I[:,-1]@a, ca**2/mut**2+cv2**2/(mun*p)**2*k2-g**2,
            (p*cc1-alp[:,0])**2+(p*cc2-alp[:,1])**2-kap**2,(p*cc1-bet[:,0])**2+(p*cc2-bet[:,1])**2-kap**2]
    Z=np.zeros((n,n)); z=np.zeros(n)
    DG1=np.c_[2*dc1[:,None]*D.T,2*dc2[:,None]*D.T,Z,z,z]
    DG5=np.r_[np.zeros(2*n),I[:,-1],0,0][None]
    w=cv2**2/(mun*p)**2
    DG7=np.c_[2*(w*d2c1)[:,None]*D2.T,2*(w*d2c2)[:,None]*D2.T,
              2*(ca/mut**2)[:,None]*M.T+(2*cv2/(mun*p)**2*k2)[:,None]*(2*p*I.T),
              2*cv2/(mun*p)**2*k2*(2*I.T@a)-2*cv2**2/(mun**2*p**3)*k2, 2*cv2/(mun*p)**2*k2*2*v0]
    def dtr(B): return np.c_[(2*(p*cc1-B[:,0]))[:,None]*p*M.T,(2*(p*cc2-B[:,1]))[:,None]*p*M.T,Z,
                            2*(p*cc1-B[:,0])*cc1+2*(p*cc2-B[:,1])*cc2,z]
    return G,np.r_[DG1,DG5,DG7,dtr(alp),dtr(bet)]
x=np.r_[rng.normal(0,1e-3,2*n),rng.normal(0,0.1,n),1900.,30.]
x[1]+=1/(2*np.pi); x[2*n+0]=0
f,df=fobj(x); G,J=fres(x); h=1e-6
fd=np.array([(fobj(x+h*e)[0]-fobj(x-h*e)[0])/(2*h) for e in np.eye(len(x))])
Jd=np.array([(fres(x+h*e)[0]-fres(x-h*e)[0])/(2*h) for e in np.eye(len(x))]).T
print("err rel grad f =",np.abs(fd-df).max()/np.abs(df).max())
print("err rel jac G  =",np.abs(Jd-J).max()/np.abs(J).max())
