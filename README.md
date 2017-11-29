# t-Distribution
How to compute the [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution).

----
## [確率密度関数](https://ja.wikipedia.org/wiki/確率密度関数)（[Probability density function](https://en.wikipedia.org/wiki/Probability_density_function)）

> ![](https://upload.wikimedia.org/wikipedia/commons/4/41/Student_t_pdf.svg)  
> \* [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

ｔ分布の確率密度関数は、[ベータ関数](https://ja.wikipedia.org/wiki/ベータ関数)（[Beta function](https://en.wikipedia.org/wiki/Beta_function)）を用いて、以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/83f62791152ac95ae81bc2ff11354bf9bfa88941)　`...(1)`  
> \* [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

ベータ関数 は [ガンマ関数](https://ja.wikipedia.org/wiki/ガンマ関数)（[Beta function](https://en.wikipedia.org/wiki/Beta_function)）を用いて、以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/70c94c96b6a5b81af91bc24bf2bbfea915c8071c)　`...(2)`  
> \* [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

ガンマ関数の計算方法は以下を参照のこと。

> ![](https://media.githubusercontent.com/media/LUXOPHIA/GammaFunc/master/--------/Gamma.png)  
> \* [GammaFunc: How to compute the Gamma function.](https://github.com/LUXOPHIA/GammaFunc)：[LUXOPHIA](https://github.com/LUXOPHIA)：[GitHub](https://github.com)

----
## [累積分布関数](https://ja.wikipedia.org/wiki/確率分布#.E5.88.86.E5.B8.83.E9.96.A2.E6.95.B0)（[CDF：Cumulative distribution function](https://en.wikipedia.org/wiki/Cumulative_distribution_function)）

> ![](https://upload.wikimedia.org/wikipedia/commons/e/e7/Student_t_cdf.svg)  
> \* [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

ｔ分布の累積分布関数は、[正則不完全ベータ関数](https://ja.wikipedia.org/wiki/不完全ベータ関数)（[Regularized incomplete beta function](https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function)）を用いて、以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/1d76813650b551ffae18e9a3466d57097ffd1af1)　`...(3)`  
> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/c9ab1cf1e60389cf1a1583326d995c780a679e75)　`...(4)`  
> \* [t分布](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

正則不完全ベータ関数は、[不完全ベータ関数](https://ja.wikipedia.org/wiki/不完全ベータ関数)（[Incomplete beta function](https://en.wikipedia.org/wiki/Beta_function#Incomplete_beta_function)）と通常のガンマ関数を用いて、以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/df598957dcc02bd38b07e8e12949e930ad1722c5)　`...(5)`  
> \* [t分布](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

不完全ベータ関数は、[ガウスの超幾何関数](https://ja.wikipedia.org/wiki/超幾何級数)（[Gaussian hypergeometric function](https://en.wikipedia.org/wiki/Hypergeometric_function)）を用いて、以下のように定義される。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/67e82953fc336931557e31aaddfc1251281d8908)　`...(6)`  
> \* [Hypergeometric function](https://en.wikipedia.org/wiki/Hypergeometric_function#Special_cases)：[Wikipedia](https://www.wikipedia.org)

しかし 式(3) で示した定義は、x の全域をサポートするものの、[自由度](https://ja.wikipedia.org/wiki/自由度)（[Degree of freedom](https://en.wikipedia.org/wiki/Degrees_of_freedom_(physics_and_chemistry))）ν が大きくなると容易く発散してしまう。そこで**正の定義域**しかサポートされていないが、以下のような定義を用いるのが一般的である。幸い累積分布関数は奇関数なので、負の定義域を定義することも容易である。

> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/0d164fa8bcb0868d34a489b1ec5f6f2eabd5d30f)　`...(7)`  
> ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/2f37cd9b82db9e895de57d4e843b7d53381655e4)　`...(8)`  
> \* [Student's t-Distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)：[Wikipedia](https://www.wikipedia.org)

しかしこの定義式は、ゼロに近い定義域における誤差が大きい。そこで以下の関係式を用い、正則不完全ベータ関数の引数を交換した定義式も併用する。この場合、逆に絶対値の大きい定義域で発散してしまうが、定義域に応じて 式(3) と切り替えて利用することにより、補い合って x の全域をサポートすることができる。

> ![](http://dlmf.nist.gov/8.17.E4.png)　`...(9)`  
> \* [DLMF: 8.17 Incomplete Beta Functions](http://dlmf.nist.gov/8.17)：[DLMF: NIST Digital Library of Mathematical Functions](http://dlmf.nist.gov)

我々の実装では、**| X | < 4.2** か どうかで定義式を切り替えている。

```pascal
function CumDistT( const X_:Double; const V_:Cardinal ) :Double;
var
   X2, B :Double;
begin
     X2 := Pow2( X_ );
     if X2 < 17.62 then B := 1 - RegIncBeta( X2 / ( X2 + V_ ), 1  / 2, V_ / 2 )
                   else B :=     RegIncBeta( V_ / ( X2 + V_ ), V_ / 2, 1  / 2 );
     if X_ < 0 then Result :=     B / 2
               else Result := 1 - B / 2;
end;
```

----

[![Delphi Starter](http://img.en25.com/EloquaImages/clients/Embarcadero/%7B063f1eec-64a6-4c19-840f-9b59d407c914%7D_dx-starter-bn159.png)](https://www.embarcadero.com/jp/products/delphi/starter)
