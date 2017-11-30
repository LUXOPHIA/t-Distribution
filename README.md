# t-Distribution
How to compute the [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution).

----
## ■ [確率密度関数](https://ja.wikipedia.org/wiki/確率密度関数)（[Probability density function](https://en.wikipedia.org/wiki/Probability_density_function)）

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-DF.png)  

ｔ分布の確率密度関数は [ベータ関数](https://ja.wikipedia.org/wiki/ベータ関数)（[Beta function](https://en.wikipedia.org/wiki/Beta_function)）を用いて以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/83f62791152ac95ae81bc2ff11354bf9bfa88941)　`...(1)`  
> \* [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

ベータ関数 は [ガンマ関数](https://ja.wikipedia.org/wiki/ガンマ関数)（[Beta function](https://en.wikipedia.org/wiki/Beta_function)）を用いて以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/70c94c96b6a5b81af91bc24bf2bbfea915c8071c)　`...(2)`  
> \* [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

ガンマ関数の計算方法は以下を参照のこと。

> ![](https://media.githubusercontent.com/media/LUXOPHIA/GammaFunc/master/--------/Gamma.png)  
> \* [GammaFunc: How to compute the Gamma function.](https://github.com/LUXOPHIA/GammaFunc)：[LUXOPHIA](https://github.com/LUXOPHIA)：[GitHub](https://github.com)

----
## ■ [累積分布関数](https://ja.wikipedia.org/wiki/確率分布#.E5.88.86.E5.B8.83.E9.96.A2.E6.95.B0)（[CDF：Cumulative distribution function](https://en.wikipedia.org/wiki/Cumulative_distribution_function)）

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF.png)  

ｔ分布の累積分布関数は [正則不完全ベータ関数](https://ja.wikipedia.org/wiki/不完全ベータ関数)（[Regularized incomplete beta function](https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function)）を用いて以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/1d76813650b551ffae18e9a3466d57097ffd1af1)　`...(3)`  
> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/c9ab1cf1e60389cf1a1583326d995c780a679e75)  
> \* [t分布](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

正則不完全ベータ関数は [不完全ベータ関数](https://ja.wikipedia.org/wiki/不完全ベータ関数)（[Incomplete beta function](https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function)）と標準のガンマ関数を用いて以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/df598957dcc02bd38b07e8e12949e930ad1722c5)　`...(4)`  
> \* [t分布](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

不完全ベータ関数は [ガウスの超幾何関数](https://ja.wikipedia.org/wiki/超幾何級数)（[Gaussian hypergeometric function](https://en.wikipedia.org/wiki/Hypergeometric_function)）を用いて以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/67e82953fc336931557e31aaddfc1251281d8908)　`...(5)`  
> \* [Hypergeometric function](https://en.wikipedia.org/wiki/Hypergeometric_function#Special_cases)：[Wikipedia](https://www.wikipedia.org)

しかし定義式`(3)`は一つの式で`x`の全域をサポートするものの、絶対値の大きい定義域での精度が低い上、[自由度](https://ja.wikipedia.org/wiki/自由度)（[Degree of freedom](https://en.wikipedia.org/wiki/Degrees_of_freedom_(physics_and_chemistry))）`ν`が大きくなると発散しやすい。

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF(%CE%BD%2C%CE%BD)_100.png)

そこで**正の定義域**しかサポートされていないが、以下のような定義を用いるのが一般的である。幸い累積分布関数は奇関数なので、負の定義域へ拡張することも容易である。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/0d164fa8bcb0868d34a489b1ec5f6f2eabd5d30f)　`...(6)`  
> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/2f37cd9b82db9e895de57d4e843b7d53381655e4)  
> \* [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

しかしこの定義式`(6)`は絶対値の小さい定義域において精度が大幅に低下する。

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF(%CE%BD%2C1)_5.png)

そこで以下の関係式`(7)`を用い、正則不完全ベータ関数の引数を交換した定義式`(8)`も併用する。

> ![](http://dlmf.nist.gov/8.17.E4.png)　`...(7)`  
> \* [DLMF: 8.17 Incomplete Beta Functions](http://dlmf.nist.gov/8.17)：[DLMF: NIST Digital Library of Mathematical Functions](http://dlmf.nist.gov)

もっとも定義式`(8)`では逆に絶対値の大きい定義域で発散してしまうが、それぞれが有効な領域に応じて定義式を切り替えることにより、補い合って`x`の全域を高精度にサポートすることが可能となる。

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
## ■ 逆累積分布関数（[Quantile function](https://en.wikipedia.org/wiki/Quantile_function)）

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-InvCDF.png)

ｔ逆累積分布関数はｔ累積分布関数の逆関数であり、与えられた[上側確率](https://www.weblio.jp/content/上側確率)（[Upper probability](https://en.wikipedia.org/wiki/Upper_and_lower_probabilities)）に対応する`x`の値、つまり [パーセント点](https://ja.wikipedia.org/wiki/分位数#.E3.83.91.E3.83.BC.E3.82.BB.E3.83.B3.E3.82.BF.E3.82.A4.E3.83.AB)（[Percentage point](https://en.wikipedia.org/wiki/Percentage_point)）を逆算する関数である。近似式を使った解法が一般的ではあるが、我々の実装では [ニュートン法](https://ja.wikipedia.org/wiki/ニュートン法)（[Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method)）を用いて厳密に解を求めている。

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
