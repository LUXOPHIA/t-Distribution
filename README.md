# t-Distribution
How to compute the [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution).

----
## 1. [確率密度関数](https://ja.wikipedia.org/wiki/確率密度関数)([Probability density function](https://en.wikipedia.org/wiki/Probability_density_function))

[![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-DF.png) ](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-DF.png) 

ｔ分布の確率密度関数は [ベータ関数](https://ja.wikipedia.org/wiki/ベータ関数)([Beta function](https://en.wikipedia.org/wiki/Beta_function)) を用いて以下のように定義される。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BP%7D%5Cleft%28%7Bx%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B1%7D%7B%7B2%7D%5Csqrt%7B%5Cmathit%7B%5Cnu%7D%7D%7B%5Cmathrm%7BB%7D%7D%5Cleft%28%7B%5Cfrac%7B1%7D%7B2%7D%5Cmathrm%7B%2C%7D%5Cfrac%7B%5Cmathit%7B%5Cnu%7D%7D%7B2%7D%7D%5Cright%29%7D%7B%5Cleft%28%7B%7B1%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Cfrac%7B%7Bx%7D%5E%7B2%7D%7D%7B%5Cmathit%7B%5Cnu%7D%7D%7D%5Cright%29%7D%5E%7B%5Cmathrm%7B%7B-%7D%7D%5Cfrac%7B%5Cmathit%7B%5Cnu%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B1%7D%7D%7B2%7D%7D)　`...(1)`

ベータ関数は [ガンマ関数](https://ja.wikipedia.org/wiki/ガンマ関数)([Beta function](https://en.wikipedia.org/wiki/Beta_function)) を用いて以下のように定義される。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7B%5Cmathrm%7BB%7D%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cmathop%7B%5Cint%7D%5Cnolimits_%7B0%7D%5Cnolimits%5E%7B1%7D%7B%7Bt%7D%5E%7B%7Ba%7D%5Cmathrm%7B%7B-%7D%7D%7B1%7D%7D%7B%5Cleft%28%7B%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7Bt%7D%7D%5Cright%29%7D%5E%7B%7Bb%7D%5Cmathrm%7B%7B-%7D%7D%7B1%7D%7Ddt%7D%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B%5CGamma%5Cleft%28%7Ba%7D%5Cright%29%5CGamma%5Cleft%28%7Bb%7D%5Cright%29%7D%7B%5CGamma%5Cleft%28%7B%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7Bb%7D%7D%5Cright%29%7D)　`...(2)`

ガンマ関数の計算方法は以下を参照のこと。

> [![](https://media.githubusercontent.com/media/LUXOPHIA/GammaFunc/master/--------/Gamma.png)](https://github.com/LUXOPHIA/GammaFunc)  
> \* [GammaFunc: How to compute the Gamma function.](https://github.com/LUXOPHIA/GammaFunc)：[LUXOPHIA](https://github.com/LUXOPHIA)：[GitHub](https://github.com)

----
## 2. [累積分布関数](https://ja.wikipedia.org/wiki/確率分布#.E5.88.86.E5.B8.83.E9.96.A2.E6.95.B0)([CDF：Cumulative distribution function](https://en.wikipedia.org/wiki/Cumulative_distribution_function))

[![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF.png)](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF.png) 

ｔ分布の累積分布関数は、[下側確率](https://www.weblio.jp/content/下側確率)(Lower tailed probability) とも呼ばれ、[正則不完全ベータ関数](https://ja.wikipedia.org/wiki/不完全ベータ関数)([Regularized incomplete beta function](https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function)) を用いて以下のように定義される。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BP%7D%5Cleft%28%7B%7BX%7D%5Cmathrm%7B%5Cleq%7D%7Bx%7D%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cmathop%7B%5Cint%7D%5Cnolimits_%7B%5Cmathrm%7B%7B-%7D%7D%5Cmathrm%7B%5Cinfty%7D%7D%5Cnolimits%5E%7Bx%7D%7B%7BP%7D%5Cleft%28%7Bt%7D%5Cright%29%7Bdt%7D%7D%5Cmathrm%7B%7B%3D%7D%7D%7BI%7D_%7B%5Cmathit%7B%5Calpha%7D%5Cleft%28%7Bx%7D%5Cright%29%7D%5Cleft%28%7B%5Cfrac%7B%5Cmathit%7B%5Cnu%7D%7D%7B2%7D%5Cmathrm%7B%2C%7D%5Cfrac%7B%5Cmathit%7B%5Cnu%7D%7D%7B2%7D%7D%5Cright%29)　`...(3)`  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%5Cmathit%7B%5Calpha%7D%5Cleft%28%7Bx%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B%7Bx%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Csqrt%7B%7Bx%7D%5E%7B2%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Cmathit%7B%5Cnu%7D%7D%7D%7B2%5Csqrt%7B%7Bx%7D%5E%7B2%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Cmathit%7B%5Cnu%7D%7D%7D)  

正則不完全ベータ関数は [不完全ベータ関数](https://ja.wikipedia.org/wiki/不完全ベータ関数)([Incomplete beta function](https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function)) と標準のガンマ関数を用いて以下のように定義される。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BI%7D_%7Bz%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B%7B%5Cmathrm%7BB%7D%7D_%7Bz%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%7D%5Cright%29%7D%7B%7B%5Cmathrm%7BB%7D%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%7D%5Cright%29%7D)　`...(4)`

### 2.1. 不完全ベータ関数の求め方

#### 2.1.1 超幾何級数を用いる方法

不完全ベータ関数は [ガウスの超幾何関数](https://ja.wikipedia.org/wiki/超幾何級数)([Gaussian hypergeometric function](https://en.wikipedia.org/wiki/Hypergeometric_function)) を用いて以下のように定義される。しかしこのままでは、桁落ちが著しく数値計算に向かない。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7B%5Cmathrm%7BB%7D%7D_%7Bz%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B%7Bz%7D%5E%7Ba%7D%7D%7Ba%7D%7B%7B%7D_%7B2%7D%7BF%7D_%7B1%7D%7D%5Cleft%28%7B%7Ba%7D%7B%5Cmathrm%7B%2C%7D%7D%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7Bb%7D%7B%5Cmathrm%7B%3B%7D%7D%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B1%7D%7B%5Cmathrm%7B%3B%7D%7D%7Bz%7D%7D%5Cright%29)　`...(5)`  

そこで実装上は、以下の [オイラーの変換公式(Euler's transformation)](https://en.wikipedia.org/wiki/Hypergeometric_function#Fractional_linear_transformations) を用いて、

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7B%7D_%7B2%7D%7BF%7D_%7B1%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%5Cmathrm%7B%3B%7Dc%5Cmathrm%7B%3B%7Dz%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%7B%5Cleft%28%7B%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7Bz%7D%7D%5Cright%29%7D%5E%7B%7Bc%7D%5Cmathrm%7B%7B-%7D%7D%7Ba%7D%5Cmathrm%7B%7B-%7D%7D%7Bb%7D%7D%7B%7B%7D_%7B2%7D%7BF%7D_%7B1%7D%7D%5Cleft%28%7B%7Bc%7D%5Cmathrm%7B%7B-%7D%7D%7Ba%7D%7B%5Cmathrm%7B%2C%7D%7D%7Bc%7D%5Cmathrm%7B%7B-%7D%7D%7Bb%7D%7B%5Cmathrm%7B%3B%7D%7D%7Bc%7D%7B%5Cmathrm%7B%3B%7D%7D%7Bz%7D%7D%5Cright%29)　`...(6)`

数値的安定性を高めた以下の定義式を用いる。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7B%5Cmathrm%7BB%7D%7D_%7Bz%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B%7Bz%7D%5E%7Ba%7D%7B%5Cleft%28%7B%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7Bz%7D%7D%5Cright%29%7D%5E%7Bb%7D%7D%7Ba%7D%7B%7B%7D_%7B2%7D%7BF%7D_%7B1%7D%7D%5Cleft%28%7B%7B1%7D%7B%5Cmathrm%7B%2C%7D%7D%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7Bb%7D%7B%5Cmathrm%7B%3B%7D%7D%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B1%7D%7B%5Cmathrm%7B%3B%7D%7D%7Bz%7D%7D%5Cright%29)　`...(7)`

なお、超幾何関数は以下の [超幾何級数](https://ja.wikipedia.org/wiki/超幾何級数) によって計算することができ、

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7B%7D_%7B2%7D%7BF%7D_%7B1%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%5Cmathrm%7B%2C%7Dc%5Cmathrm%7B%2C%7Dx%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cmathop%7B%5Csum%7D%5Climits_%7B%7Bn%7D%5Cmathrm%7B%7B%3D%7D%7D%7B0%7D%7D%5Climits%5E%7B%5Cmathrm%7B%5Cinfty%7D%7D%7B%5Cfrac%7B%7B%5Cleft%28%7Ba%7D%5Cright%29%7D_%7Bn%7D%7B%5Cleft%28%7Bb%7D%5Cright%29%7D_%7Bn%7D%7D%7B%7B%5Cleft%28%7Bc%7D%5Cright%29%7D_%7Bn%7Dn%5Cmathrm%7B%21%7D%7D%7D%7Bx%7D%5E%7Bn%7D%5Cmathrm%7B%7B%3D%7D%7D%5Cmathop%7B%5Csum%7D%5Climits_%7B%7Bn%7D%5Cmathrm%7B%7B%3D%7D%7D%7B0%7D%7D%5Climits%5E%7B%5Cmathrm%7B%5Cinfty%7D%7D%7B%7BP%7D_%7Bn%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%5Cmathrm%7B%2C%7Dc%5Cmathrm%7B%2C%7Dx%7D%5Cright%29%7D)　`...(8)`  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BP%7D_%7B0%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%5Cmathrm%7B%2C%7Dc%5Cmathrm%7B%2C%7Dx%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%7B1%7D)  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BP%7D_%7B%7Bn%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B1%7D%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%5Cmathrm%7B%2C%7Dc%5Cmathrm%7B%2C%7Dx%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B%5Cleft%28%7B%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7Bn%7D%7D%5Cright%29%5Cleft%28%7B%7Bb%7D%5Cmathrm%7B%7B&plus;%7D%7D%7Bn%7D%7D%5Cright%29%7D%7B%5Cleft%28%7B%7Bc%7D%5Cmathrm%7B%7B&plus;%7D%7D%7Bn%7D%7D%5Cright%29%5Cleft%28%7B%7B1%7D%5Cmathrm%7B%7B&plus;%7D%7D%7Bn%7D%7D%5Cright%29%7D%7BxP%7D_%7Bn%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%5Cmathrm%7B%2C%7Dc%5Cmathrm%7B%2C%7Dx%7D%5Cright%29)

具体的な実装は以下のようになる。

```Pascal
function HypGeo21( const A_,B_,C_,X_:Double ) :Double;
var
   P0, P1 :Double;
   N :Integer;
begin
     P0 := 1;
     Result := P0;
     for N := 0 to 10000 do
     begin
          P1 := ( ( A_ + N ) * ( B_ + N ) )
              / ( ( C_ + N ) * ( 1  + N ) ) * X_ * P0;
          Result := Result + P1;
          if Abs( P1 ) < DOUBLE_EPS3 then Break;
          P0 := P1;
     end;
end;
```

#### 2.1.2 連分数展開を用いる方法

不完全ベータ関数は、以下の [連分数](https://ja.wikipedia.org/wiki/連分数)([Continued fraction](https://en.wikipedia.org/wiki/Continued_fraction)) によって定義される。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BB%7D_%7Bz%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B%7Bz%7D%5E%7Ba%7D%7B%5Cleft%28%7B%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7Bz%7D%7D%5Cright%29%7D%5E%7Bb%7D%7D%7Ba%7D%5Ccfrac%7B%7Bd%7D_%7B0%7D%7D%7B%7B1%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Ccfrac%7B%7Bd%7D_%7B1%7D%7D%7B%7B1%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Ccfrac%7B%7Bd%7D_%7B2%7D%7D%7B%7B1%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Ccfrac%7B%7Bd%7D_%7B3%7D%7D%7B%7B1%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Cmathrm%7B%5Ccdots%7D%7D%7D%7D%7D)　`...(9)`  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7Bd%7D_%7B0%7D%5Cmathrm%7B%7B%3D%7D%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B1%7D)  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7Bd%7D_%7B1%7D%5Cmathrm%7B%7B%3D%7D%7D%5Cmathrm%7B%7B-%7D%7D%5Cfrac%7B%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7Bb%7D%7D%7B%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B1%7D%7D%7Bz%7D)  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7Bd%7D_%7B%7B2%7D%7Bn%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B0%7D%7D%5Cmathrm%7B%7B%3D%7D%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Cfrac%7B%7Bn%7D%5Cleft%28%7B%7Bb%7D%5Cmathrm%7B%7B-%7D%7D%7Bn%7D%7D%5Cright%29%7D%7B%5Cleft%28%7B%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B2%7D%7Bn%7D%7D%5Cright%29%5Cleft%28%7B%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B2%7D%7Bn%7D%5Cmathrm%7B%7B-%7D%7D%7B1%7D%7D%5Cright%29%7D%7Bz%7D)  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7Bd%7D_%7B%7B2%7D%7Bn%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B1%7D%7D%5Cmathrm%7B%7B%3D%7D%7D%5Cmathrm%7B%7B-%7D%7D%5Cfrac%7B%5Cleft%28%7B%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7Bn%7D%7D%5Cright%29%5Cleft%28%7B%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7Bb%7D%5Cmathrm%7B%7B&plus;%7D%7D%7Bn%7D%7D%5Cright%29%7D%7B%5Cleft%28%7B%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B2%7D%7Bn%7D%7D%5Cright%29%5Cleft%28%7B%7Ba%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B2%7D%7Bn%7D%5Cmathrm%7B%7B&plus;%7D%7D%7B1%7D%7D%5Cright%29%7D%7Bz%7D)  

一般的な連分数の評価法 (L.Lorentzen and H.Waadeland, "Continued Fractions with Applications," North-Holland, Amsterdam, 1992.) を素直に実装すると以下のようになり、

```pascal
function IncBeta( const X_,A_,B_:Double ) :Double;
var
   G0, G2, C0, C1, P0, P1, P2, Q0, Q1, Q2, N2A :Double;
   N, N2 :Integer;
begin
     G2 := 0;
     C1 := -X_ * ( A_ + B_ ) / ( A_ + 1 );
     P0 := 0;  P1 := 1;  P2 := P1 + C1 * P0;
     Q0 := 1;  Q1 := 1;  Q2 := Q1 + C1 * Q0;
     for N := 1 to 10000 do
     begin
          G0 := G2;  G2 := P2 / Q2;
          if ( Abs( G2 - G0 ) < DOUBLE_EPS3 ) then Break;
          N2 := N shl 1;  N2A := N2 + A_;
          C0 := +X_ *        N   * (      B_ - N ) / ( N2A * ( N2A - 1 ) );
          C1 := -X_ * ( A_ + N ) * ( A_ + B_ + N ) / ( N2A * ( N2A + 1 ) );
          P0 := P1;  P1 := P2;  P2 := P1 + C0 * P0;
          Q0 := Q1;  Q1 := Q2;  Q2 := Q1 + C0 * Q0;
          P0 := P1;  P1 := P2;  P2 := P1 + C1 * P0;
          Q0 := Q1;  Q1 := Q2;  Q2 := Q1 + C1 * Q0;
     end;
     Result := Power( X_, A_ ) * Power( 1 - X_, B_ ) * G2 / A_;
end;
```

より桁あふれを起こしにくい、Lentz's method (Lentz, W.J. 1976, Applied Optics, vol. 15, pp. 668–671.) を取り入れると、以下のような実装となる。

```pascal
function IncBeta( const X_,A_,B_:Double ) :Double;
var
   C0, C1, U0, U1, U2, V0, V1, V2, G0, G1, G2, N2A :Double;
   N, N2 :Integer;
begin
     C1 := -X_ * ( A_ + B_ ) / ( A_ + 1 );
     U1 := 2;  U2 := 1 + C1 / U1;
     V1 := 1;  V2 := 1 + C1 / V1;
     G0 := 1;  G1 := U1 / V1 * G0;  G2 := U2 / V2 * G1;
     for N := 1 to 10000 do
     begin
          if ( Abs( G2 - G0 ) < DOUBLE_EPS3 ) then Break;
          N2 := N shl 1;  N2A := N2 + A_;
          C0 := +X_ *        N   * (      B_ - N ) / ( N2A * ( N2A - 1 ) );
          C1 := -X_ * ( A_ + N ) * ( A_ + B_ + N ) / ( N2A * ( N2A + 1 ) );
          U0 := U2;  U1 := 1 + C0 / U0;  U2 := 1 + C1 / U1;
          V0 := V2;  V1 := 1 + C0 / V0;  V2 := 1 + C1 / V1;
          G0 := G2;  G1 := U1 / V1 * G0;  G2 := U2 / V2 * G1;
     end;
     Result := Power( X_, A_ ) * Power( 1 - X_, B_ ) * ( G2 - 1 ) / A_;
end;
```

### 2.2 両側確率の利用

定義式`(3)`は、下側確率を直接計算できるものの、下図のように絶対値の大きい定義域で計算が不安定となる。

> | by Hypergeometric series | by Continued fraction |
> |:-:|:-:|
> | [![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF%28%CE%BD%2C%CE%BD%29_100.png)](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF%28%CE%BD%2C%CE%BD%29_100.png) | [![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF%28%CE%BD%2C%CE%BD%29-Frac2_100-1024.png)](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF%28%CE%BD%2C%CE%BD%29-Frac2_100-1024.png) |

この現象は、式`(3)`において [自由度](https://ja.wikipedia.org/wiki/自由度)([Degree of freedom](https://en.wikipedia.org/wiki/Degrees_of_freedom_(physics_and_chemistry)))`ν`が大きい場合、つまり式`(4)`において引数`a`,`b`が両方とも大きい場合に、不完全ベータ関数の計算が不安定になることが原因である。

そこで、正則不完全ベータ関数の**引数の片方を`1/2`に固定**することができる [両側確率](https://www.weblio.jp/content/両側確率)([Two tailed probability](https://en.wikipedia.org/wiki/One-_and_two-tailed_tests)) の定義式を利用する。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BP%7D%5Cleft%28%7B%5Cleft%7C%7Bx%7D%5Cright%7C%5Cmathrm%7B%5Cleq%7D%5Cleft%7C%7BX%7D%5Cright%7C%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cmathop%7B%5Cint%7D%5Cnolimits_%7B%5Cmathrm%7B%7B-%7D%7D%5Cmathrm%7B%5Cinfty%7D%7D%5Cnolimits%5E%7B%5Cmathrm%7B%7B-%7D%7D%5Cleft%7C%7Bx%7D%5Cright%7C%7D%7B%7BP%7D%5Cleft%28%7Bt%7D%5Cright%29%7Bdt%7D%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Cmathop%7B%5Cint%7D%5Cnolimits_%7B%5Cmathrm%7B%7B&plus;%7D%7D%5Cleft%7C%7Bx%7D%5Cright%7C%7D%5Cnolimits%5E%7B%5Cmathrm%7B%7B&plus;%7D%7D%5Cmathrm%7B%5Cinfty%7D%7D%7B%7BP%7D%5Cleft%28%7Bt%7D%5Cright%29%7Bdt%7D%7D%5Cmathrm%7B%7B%3D%7D%7D%7BI%7D_%7B%5Cmathit%7B%5Cbeta%7D%5Cleft%28%7Bx%7D%5Cright%29%7D%5Cleft%28%7B%5Cfrac%7B%5Cmathit%7B%5Cnu%7D%7D%7B2%7D%5Cmathrm%7B%2C%7D%5Cfrac%7B1%7D%7B2%7D%7D%5Cright%29)　`...(10)`  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%5Cmathit%7B%5Cbeta%7D%5Cleft%28%7Bx%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B%5Cmathit%7B%5Cnu%7D%7D%7B%7Bx%7D%5E%7B2%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Cmathit%7B%5Cnu%7D%7D)  
> [![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-C2DF.png)](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-C2DF.png)  
> ※原点では微分不可能。

下側確率`CumDistT`は、以下のように両側確率`Cum2DistT`を繋ぎ合わせることで再定義可能である。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BP%7D%5Cleft%28%7B%7BX%7D%5Cmathrm%7B%5Cleq%7D%7Bx%7D%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cleft%5C%7B%7B%5Cbegin%7Barray%7D%7Bll%7D%7B%5Cfrac%7B%7BP%7D%5Cleft%28%7B%5Cmathrm%7B%7B-%7D%7D%7Bx%7D%5Cmathrm%7B%5Cleq%7D%5Cleft%7C%7BX%7D%5Cright%7C%7D%5Cright%29%7D%7B2%7D%7D%26%7B%7Bx%7D%5Cmathrm%7B%7B%3C%7D%7D%7B0%7D%7D%5C%5C%20%7B%5Cfrac%7B1%7D%7B2%7D%7D%26%7B%7Bx%7D%5Cmathrm%7B%7B%3D%7D%7D%7B0%7D%7D%5C%5C%20%7B%7B1%7D%5Cmathrm%7B%7B-%7D%7D%5Cfrac%7B%7BP%7D%5Cleft%28%7B%5Cmathrm%7B%7B&plus;%7D%7D%7Bx%7D%5Cmathrm%7B%5Cleq%7D%5Cleft%7C%7BX%7D%5Cright%7C%7D%5Cright%29%7D%7B2%7D%7D%26%7B%7Bx%7D%5Cmathrm%7B%7B%3E%7D%7D%7B0%7D%7D%5Cend%7Barray%7D%7D%5Cright.)　`...(11)`

```pascal
function CumDistT( const X_,V_:Double ) :Double;
begin
     Result := Cum2DistT( X_, V_ ) / 2;
     if 0 < X_ then Result := 1 - Result;
end;
```

すると、不完全ベータ関数の計算が安定するので、絶対値の大きい定義域においても非常に安定する。
しかし今度は逆に、絶対値の小さい定義域において精度が大幅に低下してしまった。

> |  |  |
> |:-:|:-:|
> | [![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF%28%CE%BD%2C1%29_5.png)](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF%28%CE%BD%2C1%29_5.png) | [![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF%28%CE%BD%2C1%29_100.png)](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF%28%CE%BD%2C1%29_100.png) | 

そこで正則不完全ベータ関数の関係式を用いて、

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BI%7D_%7Bz%7D%5Cleft%28%7Ba%5Cmathrm%7B%2C%7Db%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7BI%7D_%7B%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7Bz%7D%7D%5Cleft%28%7Bb%5Cmathrm%7B%2C%7Da%7D%5Cright%29)　`...(12)`

以下のように引数の順序を交換した定義式を併用する。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BP%7D%5Cleft%28%7B%5Cleft%7C%7Bx%7D%5Cright%7C%5Cmathrm%7B%5Cleq%7D%5Cleft%7C%7BX%7D%5Cright%7C%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7BI%7D_%7B%5Cmathit%7B%5Cgamma%7D%5Cleft%28%7Bx%7D%5Cright%29%7D%5Cleft%28%7B%5Cfrac%7B1%7D%7B2%7D%5Cmathrm%7B%2C%7D%5Cfrac%7B%5Cmathit%7B%5Cnu%7D%7D%7B2%7D%7D%5Cright%29)　`...(13)`  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%5Cmathit%7B%5Cgamma%7D%5Cleft%28%7Bx%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B%7Bx%7D%5E%7B2%7D%7D%7B%7Bx%7D%5E%7B2%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Cmathit%7B%5Cnu%7D%7D) 

すると今度は、絶対値の小さい定義域で安定し、絶対値の大きい定義域で発散するようになる。定義式`(3)`と似た特性ではあるが、格段に安定している。

> |  |  |
> |:-:|:-:|
> | ![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF%281%2C%CE%BD%29_5.png) | ![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF%281%2C%CE%BD%29_100.png) |

つまり、原点付近では式`(13)`を、それ以外では式`(10)`を、と適宜切り替えることで、`x`の全域を高精度にサポートすることができる。
我々の実装では経験的に導いた `Abs(x) < Sqrt(ν)/10` という切り替え条件を採用している。

```pascal
function Cum2DistT( const X_,V_:Double ) :Double;
var
   X2 :Double;
begin
     X2 := Pow2( X_ );
     if 100 * X2 < V_ then Result := 1 - RegIncBeta( X2 / ( X2 + V_ ), 1  / 2, V_ / 2 )
                      else Result :=     RegIncBeta( V_ / ( X2 + V_ ), V_ / 2, 1  / 2 );
end;
```

----
## 3. 逆累積分布関数([Quantile function](https://en.wikipedia.org/wiki/Quantile_function))

[![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-InvCDF.png)](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-InvCDF.png)

逆累積分布関数は累積分布関数の [逆関数](https://ja.wikipedia.org/wiki/逆写像#.E9.80.86.E5.87.BD.E6.95.B0)([Inverse function](https://en.wikipedia.org/wiki/Inverse_function#Inverses_in_calculus)) であり、与えられた下側確率に対応する`x`の値、つまり [パーセント点](https://ja.wikipedia.org/wiki/分位数#.E3.83.91.E3.83.BC.E3.82.BB.E3.83.B3.E3.82.BF.E3.82.A4.E3.83.AB)([Percentage point](https://en.wikipedia.org/wiki/Percentage_point)) を逆算する関数である。近似式を使った解法が一般的ではあるが、我々の実装では [ニュートン法](https://ja.wikipedia.org/wiki/ニュートン法)([Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method)) を用いて厳密に解を求めている。

> ![](https://upload.wikimedia.org/wikipedia/commons/e/e0/NewtonIteration_Ani.gif)  
> \* [Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method)：[Wikipedia](https://www.wikipedia.org)

分布関数を積分したものが累積分布関数なので、累積ｔ分布関数`CumDistT`の微分値はｔ分布関数`DistT`そのものとなる。我々は以下のように、関数値と微分値を同時に出力する関数を実装した。

```Pascal
function CumDistT( const X_:TdDouble; const V_:Double ) :TdDouble;
begin
     with X_ do
     begin
          Result.o := CumDistT( o, V_ )    ;
          Result.d :=    DistT( o, V_ ) * d;
     end;
end;
```

その上で、ニュートン法を実行し逆関数値を検索する`InvCumDistT`関数を実装した。

```Pascal
function InvCumDistT( const P_,V_:Double ) :Double;
var
   X, P :TdDouble;
   Pd :Double;
begin
     X := TdDouble.Create( 0, 1 );
     repeat
           P := CumDistT( X, V_ );
           Pd := P.o - P_;
           X.o := X.o - Pd / P.d;
     until Abs( Pd ) < DOUBLE_EPS3;
     Result := X.o;
end;
```

----

[![Delphi Starter](http://img.en25.com/EloquaImages/clients/Embarcadero/%7B063f1eec-64a6-4c19-840f-9b59d407c914%7D_dx-starter-bn159.png)](https://www.embarcadero.com/jp/products/delphi/starter)
