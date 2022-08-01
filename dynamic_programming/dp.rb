n = 3
k = 6
ary = [1, 3, 5]

# dpテーブルの生成・初期化
dp = Array.new(n + 1) { Array.new(k + 1, false) }
# 何も選ばなければ 0 が作れる
dp[0][0] = true

# 二重ループでdpテーブル更新
0.upto(n - 1) do |i|
  0.upto(k) do |j|
    dp[i + 1][j] = if ary[i] <= j
        dp[i][j - ary[i]]
      else
        dp[i][j]
      end
  end
end

# ary の先頭から n 個を使って k が作れるか？
p dp[n][k]
# > true

pp dp
# > [[true, false, false, false, false, false, false],
# >  [true, true, false, false, false, false, false],
# >  [true, true, false, true, true, false, false],
# >  [true, true, false, true, true, true, true]]

# 確認用コード

=begin
0.upto(n-1) do |i|
        for (int k = 0; k <= K; k++) {
            if (k - a[i] >= 0) dp[i + 1][k] = dp[i + 1][k] | dp[i][k - a[i]];
            dp[i + 1][k] = dp[i + 1][k] | dp[i][k];
        }
    }
=end

=begin
int main() {
    // 入力
    int N, K;
    cin >> N >> K;
    vector<int> a(N);
    for (int i = 0; i < N; i++) {
        cin >> a[i];
    }
    // 二次元配列
    vector<vector<bool>> dp(N + 1, vector<bool>(K + 1, false));
    // 初期化
    for (int i = 0; i <= N; i++) {
        dp[i][0] = true;
    }
    // 更新
    for (int i = 0; i < N; i++) {
        for (int k = 0; k <= K; k++) {
            if (k - a[i] >= 0) dp[i + 1][k] = dp[i + 1][k] | dp[i][k - a[i]];
            dp[i + 1][k] = dp[i + 1][k] | dp[i][k];
        }
    }
    if (dp[N][K]) {
        cout << "Yes" << endl;
    } else {
        cout << "No" << endl;
    }
    return 0;
}
=end
