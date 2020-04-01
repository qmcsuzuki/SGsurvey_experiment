# SGsurvey_experiment


QMC点集合:
- Sobol列: Statistics and Machine Learning Toolboxの組み込み関数を使用。
- 2-order Sobol列: Josef Dick先生のブログのコード（リンクは以下）を使用（このリポジトリには含まれていない）
  - https://quasirandomideas.wordpress.com/2010/06/17/how-to-generate-higher-order-sobol-points-in-matlab-and-some-numerical-examples/
- 格子: Dirk Nuyence 先生のコード（リンクは以下）を使用（このリポジトリには含まれていない）
のものを使用（このリポジトリには含まれていない）
  - https://people.cs.kuleuven.be/~dirk.nuyens/fast-cbc/
  - LatticePoints.m: 上コード群のラッパー関数。2^m に近い素数点からなる格子を返す

被積分関数:
- Sobolev_c: 
- 

実験をするための関数
- experiment.m: 被積分関数とパラメータを指定することで上記各種点集合によるQMC積分誤差をプロットするメイン関数
  - Errors.m: 被積分関数とQMC点集合の種類を指定してQMC積分誤差の配列を返す関数
