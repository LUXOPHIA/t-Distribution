# t-Distribution
How to compute the [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution).

----
## ■ [確率密度関数](https://ja.wikipedia.org/wiki/確率密度関数)([Probability density function](https://en.wikipedia.org/wiki/Probability_density_function))

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-DF.png)  

ｔ分布の確率密度関数は [ベータ関数](https://ja.wikipedia.org/wiki/ベータ関数)([Beta function](https://en.wikipedia.org/wiki/Beta_function)) を用いて以下のように定義される。

> ![](https://latex.codecogs.com/svg.latex?\large&space;{P}\left({x}\right)\mathrm{{=}}\frac{1}{{2}\sqrt{\mathit{\nu}}{\mathrm{B}}\left({\frac{1}{2}\mathrm{,}\frac{\mathit{\nu}}{2}}\right)}{\left({{1}\mathrm{{&plus;}}\frac{{x}^{2}}{\mathit{\nu}}}\right)}^{\mathrm{{-}}\frac{\mathit{\nu}\mathrm{{&plus;}}{1}}{2}})　`...(1)`

ベータ関数は [ガンマ関数](https://ja.wikipedia.org/wiki/ガンマ関数)([Beta function](https://en.wikipedia.org/wiki/Beta_function)) を用いて以下のように定義される。

> ![](https://latex.codecogs.com/svg.latex?\large&space;{\mathrm{B}}\left({a\mathrm{,}b}\right)\mathrm{{=}}\mathop{\int}\nolimits_{0}\nolimits^{1}{{t}^{{a}\mathrm{{-}}{1}}{\left({{1}\mathrm{{-}}{t}}\right)}^{{b}\mathrm{{-}}{1}}dt}\mathrm{{=}}\frac{\Gamma\left({a}\right)\Gamma\left({b}\right)}{\Gamma\left({{a}\mathrm{{&plus;}}{b}}\right)})　`...(2)`

ガンマ関数の計算方法は以下を参照のこと。

> ![](https://media.githubusercontent.com/media/LUXOPHIA/GammaFunc/master/--------/Gamma.png)  
> \* [GammaFunc: How to compute the Gamma function.](https://github.com/LUXOPHIA/GammaFunc)：[LUXOPHIA](https://github.com/LUXOPHIA)：[GitHub](https://github.com)

----
## ■ [累積分布関数](https://ja.wikipedia.org/wiki/確率分布#.E5.88.86.E5.B8.83.E9.96.A2.E6.95.B0)([CDF：Cumulative distribution function](https://en.wikipedia.org/wiki/Cumulative_distribution_function))

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF.png)  

ｔ分布の累積分布関数は、[下側確率](https://www.weblio.jp/content/下側確率)(Lower tailed probability) とも呼ばれ、[正則不完全ベータ関数](https://ja.wikipedia.org/wiki/不完全ベータ関数)([Regularized incomplete beta function](https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function)) を用いて以下のように定義される。

> ![](https://latex.codecogs.com/svg.latex?\large&space;{P}\left({{X}\mathrm{\leq}{x}}\right)\mathrm{{=}}\mathop{\int}\nolimits_{\mathrm{{-}}\mathrm{\infty}}\nolimits^{x}{{P}\left({x}\right){dx}}\mathrm{{=}}{I}_{\mathit{\alpha}\left({x}\right)}\left({\frac{\mathit{\nu}}{2}\mathrm{,}\frac{\mathit{\nu}}{2}}\right))　`...(3)`  
> ![](https://latex.codecogs.com/svg.latex?\large&space;\mathit{\alpha}\left({x}\right)\mathrm{{=}}\frac{{x}\mathrm{{&plus;}}\sqrt{{x}^{2}\mathrm{{&plus;}}\mathit{\nu}}}{2\sqrt{{x}^{2}\mathrm{{&plus;}}\mathit{\nu}}})  

正則不完全ベータ関数は [不完全ベータ関数](https://ja.wikipedia.org/wiki/不完全ベータ関数)([Incomplete beta function](https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function)) と標準のガンマ関数を用いて以下のように定義される。

> ![](https://latex.codecogs.com/svg.latex?\large&space;{I}_{z}\left({a\mathrm{,}b}\right)\mathrm{{=}}\frac{{\mathrm{B}}_{z}\left({a\mathrm{,}b}\right)}{{\mathrm{B}}\left({a\mathrm{,}b}\right)})　`...(4)`

不完全ベータ関数は [ガウスの超幾何関数](https://ja.wikipedia.org/wiki/超幾何級数)([Gaussian hypergeometric function](https://en.wikipedia.org/wiki/Hypergeometric_function)) を用いて以下のように定義される。

> ![](https://latex.codecogs.com/svg.latex?\large&space;{\mathrm{B}}_{z}\left({a\mathrm{,}b}\right)\mathrm{{=}}\frac{{z}^{a}}{a}{{}_{2}{F}_{1}}\left({{a}{\mathrm{,}}{1}\mathrm{{-}}{b}{\mathrm{;}}{a}\mathrm{{&plus;}}{1}{\mathrm{;}}{z}}\right))　`...(5)`  

> ![](https://latex.codecogs.com/svg.latex?\large&space;{\mathrm{B}}_{z}\left({a\mathrm{,}b}\right)\mathrm{{=}}\frac{{z}^{a}{\left({{1}\mathrm{{-}}{z}}\right)}^{b}}{a}&space;{{}_{2}{F}_{1}}\left({{1}{\mathrm{,}}{a}\mathrm{{&plus;}}{b}{\mathrm{;}}{a}\mathrm{{&plus;}}{1}{\mathrm{;}}{z}}\right))　`...(6)`

なお定義式`(5)`の方は桁落ちが激しく発散しやすいため、我々の実装では以下の [オイラーの変換公式(Euler's transformation)](https://en.wikipedia.org/wiki/Hypergeometric_function#Fractional_linear_transformations) を用いて変形させた定義式`(6)`の方を採用している。

> ![](https://latex.codecogs.com/svg.latex?\large&space;{}_{2}{F}_{1}\left({a\mathrm{,}b\mathrm{;}c\mathrm{;}z}\right)\mathrm{{=}}{\left({{1}\mathrm{{-}}{z}}\right)}^{{c}\mathrm{{-}}{a}\mathrm{{-}}{b}}{}_{2}{F}_{1}\left({{c}\mathrm{{-}}{a}{\mathrm{,}}{c}\mathrm{{-}}{b}{\mathrm{;}}{c}{\mathrm{;}}{z}}\right))　`...(7)`

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

しかし定義式`(3)`は、一つの式で`x`の全域をサポートするものの、下図のように絶対値の大きい定義域での精度が低い上、[自由度](https://ja.wikipedia.org/wiki/自由度)([Degree of freedom](https://en.wikipedia.org/wiki/Degrees_of_freedom_(physics_and_chemistry)))`ν`が大きくなると発散しやすい。

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF(%CE%BD%2C%CE%BD)_100.png)

そこで、より数値的に安定な [両側確率](https://www.weblio.jp/content/両側確率)([Two tailed probability](https://en.wikipedia.org/wiki/One-_and_two-tailed_tests)) の定義式を利用する。

> ![](https://latex.codecogs.com/svg.latex?\large&space;{P}\left({{x}\mathrm{\leq}\left|{X}\right|}\right)\mathrm{{=}}\mathop{\int}\nolimits_{\mathrm{{-}}\mathrm{\infty}}\nolimits^{x}{{P}\left({x}\right){dx}}\mathrm{{&plus;}}\mathop{\int}\nolimits_{x}\nolimits^{\mathrm{{&plus;}}\mathrm{\infty}}{{P}\left({x}\right){dx}}\mathrm{{=}}{I}_{\mathit{\beta}\left({x}\right)}\left({\frac{\mathit{\nu}}{2}\mathrm{,}\frac{1}{2}}\right))　`...(8)`  
> ![](https://latex.codecogs.com/svg.latex?\large&space;\mathit{\beta}\left({x}\right)\mathrm{{=}}\frac{\mathit{\nu}}{{x}^{2}\mathrm{{&plus;}}\mathit{\nu}})  

片側確率は、両側確率を負の定義域へ反転させることで定義可能である。

> ![](https://latex.codecogs.com/svg.latex?%5Clarge%20%7BP%7D%5Cleft%28%7B%7BX%7D%5Cmathrm%7B%5Cleq%7D%7Bx%7D%7D%5Cright%29%5Cmathrm%7B%7B%3D%7D%7D%5Cleft%5C%7B%7B%5Cbegin%7Barray%7D%7Bll%7D%7B%7B1%7D%5Cmathrm%7B%7B-%7D%7D%5Cfrac%7B%7BP%7D%5Cleft%28%7B%5Cmathrm%7B%7B&plus;%7D%7D%7Bx%7D%5Cmathrm%7B%5Cleq%7D%5Cleft%7C%7BX%7D%5Cright%7C%7D%5Cright%29%7D%7B2%7D%7D%26%7Bx%5Cmathrm%7B%3E%7D0%7D%5C%5C%20%7B%5Cfrac%7B1%7D%7B2%7D%7D%26%7B%7Bx%7D%5Cmathrm%7B%7B%3D%7D%7D%7B0%7D%7D%5C%5C%20%7B%5Cfrac%7B%7BP%7D%5Cleft%28%7B%5Cmathrm%7B%7B-%7D%7D%7Bx%7D%5Cmathrm%7B%5Cleq%7D%5Cleft%7C%7BX%7D%5Cright%7C%7D%5Cright%29%7D%7B2%7D%7D%26%7Bx%5Cmathrm%7B%3C%7D0%7D%5Cend%7Barray%7D%7D%5Cright.)　`...(9)`

しかしこの定義式`(8)`は、下図のように絶対値の小さい定義域において精度が大幅に低下する。

![](https://github.com/LUXOPHIA/t-Distribution/raw/master/--------/t-CDF(%CE%BD%2C1)_5.png)

そこで正則不完全ベータ関数の関係式を用いて、

> ![](https://latex.codecogs.com/svg.latex?\large&space;{I}_{z}\left({{a}{\mathrm{,}}\hspace{0.33em}{b}}\right)\mathrm{{=}}{1}\mathrm{{-}}{I}_{{1}\mathrm{{-}}{z}}\left({{b}{\mathrm{,}}\hspace{0.33em}{a}}\right))　`...(10)`

以下のように引数の順序を交換した定義式を併用する。

> ![](https://latex.codecogs.com/svg.latex?\large&space;{P}\left({{x}\mathrm{\leq}\left|{X}\right|}\right)\mathrm{{=}}{1}\mathrm{{-}}{I}_{\mathit{\gamma}\left({x}\right)}\left({\frac{1}{2}{\mathrm{,}}\hspace{0.2em}\frac{\mathit{\nu}}{2}}\right))　`...(11)`  
> ![](https://latex.codecogs.com/svg.latex?\large&space;\mathit{\gamma}\left({x}\right)\mathrm{{=}}\frac{{x}^{2}}{{x}^{2}\mathrm{{&plus;}}\mathit{\nu}}) 

もっともこの式`(11)`であっても、下図のように絶対値の大きい定義域では発散してしまうが、それぞれの有効な領域に応じて定義式を切り替えることで、`x`の全域を高精度にサポートすることができる。

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
