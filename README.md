# t-Distribution
How to compute the [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution).

----
## ■ [確率密度関数](https://ja.wikipedia.org/wiki/確率密度関数)([Probability density function](https://en.wikipedia.org/wiki/Probability_density_function))

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-DF.png)  

ｔ分布の確率密度関数は [ベータ関数](https://ja.wikipedia.org/wiki/ベータ関数)([Beta function](https://en.wikipedia.org/wiki/Beta_function)) を用いて以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/83f62791152ac95ae81bc2ff11354bf9bfa88941)　`...(1)`  
> \* [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

ベータ関数 は [ガンマ関数](https://ja.wikipedia.org/wiki/ガンマ関数)([Beta function](https://en.wikipedia.org/wiki/Beta_function)) を用いて以下のように定義される。

> ![](http://dlmf.nist.gov/5.12.E1.png)　`...(2)`  
> \* [5.12 Beta Function](http://dlmf.nist.gov/5.12)：[DLMF](http://dlmf.nist.gov)

ガンマ関数の計算方法は以下を参照のこと。

> ![](https://media.githubusercontent.com/media/LUXOPHIA/GammaFunc/master/--------/Gamma.png)  
> \* [GammaFunc: How to compute the Gamma function.](https://github.com/LUXOPHIA/GammaFunc)：[LUXOPHIA](https://github.com/LUXOPHIA)：[GitHub](https://github.com)

----
## ■ [累積分布関数](https://ja.wikipedia.org/wiki/確率分布#.E5.88.86.E5.B8.83.E9.96.A2.E6.95.B0)([CDF：Cumulative distribution function](https://en.wikipedia.org/wiki/Cumulative_distribution_function))

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF.png)  

ｔ分布の累積分布関数は [正則不完全ベータ関数](https://ja.wikipedia.org/wiki/不完全ベータ関数)([Regularized incomplete beta function](https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function)) を用いて以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/1d76813650b551ffae18e9a3466d57097ffd1af1)　`...(3)`  
> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/c9ab1cf1e60389cf1a1583326d995c780a679e75)  
> \* [t分布](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

正則不完全ベータ関数は [不完全ベータ関数](https://ja.wikipedia.org/wiki/不完全ベータ関数)([Incomplete beta function](https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function)) と標準のガンマ関数を用いて以下のように定義される。

> ![](http://dlmf.nist.gov/8.17.E2.png)　`...(4)`  
> \* [8.17 Incomplete Beta Functions](http://dlmf.nist.gov/8.17)：[DLMF](http://dlmf.nist.gov)

不完全ベータ関数は [ガウスの超幾何関数](https://ja.wikipedia.org/wiki/超幾何級数)([Gaussian hypergeometric function](https://en.wikipedia.org/wiki/Hypergeometric_function)) を用いて以下のように定義される。なお、式`(6)`の方が桁落ちを避けられるので計算精度が高い。

> ![](http://dlmf.nist.gov/8.17.E7.png)　`...(5)`  
> ![](http://dlmf.nist.gov/8.17.E8.png)　`...(6)`  
> \* [8.17 Incomplete Beta Functions](http://dlmf.nist.gov/8.17)：[DLMF](http://dlmf.nist.gov)

しかし定義式`(3)`は一つの式で`x`の全域をサポートするものの、下図のように絶対値の大きい定義域での精度が低い上、[自由度](https://ja.wikipedia.org/wiki/自由度)([Degree of freedom](https://en.wikipedia.org/wiki/Degrees_of_freedom_(physics_and_chemistry)))`ν`が大きくなると発散しやすい。

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF(%CE%BD%2C%CE%BD)_100.png)

そこで**正の定義域**しかサポートされていないが、以下のような定義を用いるのが一般的である。幸い累積分布関数は奇関数なので、負の定義域へ拡張することも容易である。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/0d164fa8bcb0868d34a489b1ec5f6f2eabd5d30f)　`...(7)`  
> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/2f37cd9b82db9e895de57d4e843b7d53381655e4)  
> \* [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

しかしこの定義式`(7)`は、下図のように絶対値の小さい定義域において精度が大幅に低下する。

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF(%CE%BD%2C1)_5.png)

そこで正則不完全ベータ関数の関係式を用いて、以下のように引数の順序を交換した定義式を併用する。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BF%7D%5Cleft%28%7Bt%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%7B1%7D%5Cmathrm%7B%7B-%7D%7D%5Cfrac%7B1%7D%7B2%7D%5Cleft%5B%7B%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7BI%7D_%7B%7Bx%7D%7B%5Cmathrm%7B%27%7D%7D%5Cleft%28%7Bt%7D%5Cright%29%7D%5Cleft%28%7B%5Cfrac%7B1%7D%7B2%7D%7B%5Cmathrm%7B%2C%7D%7D%5Chspace%7B0.33em%7D%5Cfrac%7B%5Cmathit%7B%5Cnu%7D%7D%7B2%7D%7D%5Cright%29%7D%5Cright%5D%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B1%7D%7B2%7D%5Cleft%5B%7B%7B1%7D%5Cmathrm%7B%7B&plus;%7D%7D%7BI%7D_%7B%7Bx%7D%7B%5Cmathrm%7B%27%7D%7D%5Cleft%28%7Bt%7D%5Cright%29%7D%5Cleft%28%7B%5Cfrac%7B1%7D%7B2%7D%7B%5Cmathrm%7B%2C%7D%7D%5Chspace%7B0.33em%7D%5Cfrac%7B%5Cmathit%7B%5Cnu%7D%7D%7B2%7D%7D%5Cright%29%7D%5Cright%5D%7B%5Cmathrm%7B%2C%7D%7D)　`...(8)`  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7Bx%7D%7B%5Cmathrm%7B%27%7D%7D%5Cleft%28%7Bt%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cfrac%7B%7Bt%7D%5E%7B2%7D%7D%7B%7Bt%7D%5E%7B2%7D%5Cmathrm%7B%7B&plus;%7D%7D%5Cmathit%7B%5Cnu%7D%7D%7B%5Cmathrm%7B.%7D%7D)  
> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%5Cmathrm%7B%5Cbecause%7D%5Chspace%7B0.33em%7D%7BI%7D_%7B%7Bx%7D%5Cleft%28%7Bt%7D%5Cright%29%7D%5Cleft%28%7B%7Ba%7D%7B%5Cmathrm%7B%2C%7D%7D%5Chspace%7B0.33em%7D%7Bb%7D%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7BI%7D_%7B%7B1%7D%5Cmathrm%7B%7B-%7D%7D%7Bx%7D%5Cleft%28%7Bt%7D%5Cright%29%7D%5Cleft%28%7B%7Bb%7D%7B%5Cmathrm%7B%2C%7D%7D%5Chspace%7B0.33em%7D%7Ba%7D%7D%5Cright%29)

もっともこの式`(8)`であっても、下図のように絶対値の大きい定義域では発散してしまうが、それぞれの有効な領域に応じて定義式を切り替えることで、`x`の全域を高精度にサポートすることができる。

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF(1%2C%CE%BD)_100.png)

我々の実装では経験的に導いた `Abs(x) < Sqrt(ν)/10` という切り替え条件を採用している。

```pascal
function CumDistT( const X_,V_:Double ) :Double;
var
   X2, B :Double;
begin
     X2 := Pow2( X_ );
     if 100 * X2 < V_ then B := 1 - RegIncBeta( X2 / ( X2 + V_ ), 1  / 2, V_ / 2 )
                      else B :=     RegIncBeta( V_ / ( X2 + V_ ), V_ / 2, 1  / 2 );
     if X_ < 0 then Result :=     B / 2
               else Result := 1 - B / 2;
end;
```

----
## ■ 逆累積分布関数([Quantile function](https://en.wikipedia.org/wiki/Quantile_function))

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-InvCDF.png)

逆累積分布関数は累積分布関数の [逆関数](https://ja.wikipedia.org/wiki/逆写像#.E9.80.86.E5.87.BD.E6.95.B0)([Inverse function](https://en.wikipedia.org/wiki/Inverse_function#Inverses_in_calculus)) であり、与えられた[上側確率](https://www.weblio.jp/content/上側確率)([Upper probability](https://en.wikipedia.org/wiki/Upper_and_lower_probabilities)) に対応する`x`の値、つまり [パーセント点](https://ja.wikipedia.org/wiki/分位数#.E3.83.91.E3.83.BC.E3.82.BB.E3.83.B3.E3.82.BF.E3.82.A4.E3.83.AB)([Percentage point](https://en.wikipedia.org/wiki/Percentage_point)) を逆算する関数である。近似式を使った解法が一般的ではあるが、我々の実装では [ニュートン法](https://ja.wikipedia.org/wiki/ニュートン法)([Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method)) を用いて厳密に解を求めている。

> ![](https://upload.wikimedia.org/wikipedia/commons/e/e0/NewtonIteration_Ani.gif)  
> \* [Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method)：[Wikipedia](https://www.wikipedia.org)

分布関数を積分したものが累積分布関数なので、ｔ累積分布関数`CumDistT`の微分値はｔ分布関数`DistT`そのものとなる。我々は以下のように、関数値と微分値を同時に出力する関数を実装した。

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
