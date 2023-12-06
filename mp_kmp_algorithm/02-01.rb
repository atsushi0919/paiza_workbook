# 問題 6 : 一致する接頭辞と接尾辞 4 (paizaランク A 相当)
# https://paiza.jp/works/mondai/mp_kmp_algorithm/mp_kmp_algorithm__a_little_fast_step1

INPUT1 = <<"EOS"
11
abracadabra
EOS

OUTPUT1 = <<"EOS"
0
0
0
1
0
1
0
1
2
3
4
EOS

def kmp_table(s)
  i = 2
  j = 0
  s_l = s.length

  table = Array.new(s_l, 0)
  table[0] = -1
  while i <= s_l
    if s[i - 1] == s[j]
      table[i] = j + 1
      i += 1
      j += 1
    elsif j > 0
      j = table[j]
    else
      table[i] = 0
      i += 1
    end
  end

  table
end

# 入力
_, s = $stdin.read.split

# 処理
table = kmp_table(s)

# 出力
puts table[1..].join("\n")

=begin
def make_kmp_table(t):
    i = 2
    j = 0
    m = len(t)
    tbl = [0] * (m + 1)
    tbl[0] = -1
    while i <= m:
        if t[i - 1] == t[j]:
            tbl[i] = j + 1
            i += 1
            j += 1
        elif j > 0:
            j = tbl[j]
        else:
            tbl[i] = 0
            i += 1
    return tbl
 
 
def kmp(s, t):
    matched_indices = []
    tbl = make_kmp_table(t)
    i = 0
    j = 0
    n = len(s)
    m = len(t)
    while i + j < n:
        if t[j] == s[i + j]:
            j += 1
            if j == m:
                matched_indices.append(i)
                i += j - tbl[j]
                j = tbl[j]
        else:
            i += j - tbl[j]
            if j > 0:
                j = tbl[j]
    return matched_indices

def mp_naive_n2(s)
  mp = Array.new(s.size + 1, -1)
  mp[0] = -1
  mp[1] = 0
  (2..(s.size)).each do |i|
    if (s[mp[i - 1]] == s[i - 1])
      mp[i] = mp[i - 1] + 1
    else
      prefix_r = mp[i - 1]
      while (prefix_r > 0)
        is_same = true
        (0..(prefix_r - 1)).each do |j|
          if (s[j] != s[i - prefix_r + j])
            is_same = false
            break
          end
        end
        break if (is_same)
        prefix_r -= 1
      end
      mp[i] = prefix_r
    end
  end
  return mp
end

N = gets.to_i
S = gets.chomp

ans = mp_naive_n2(S)
(1..N).each { |i| puts ans[i] }

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
英小文字からなる長さ N の文字列 S が入力として与えられるので、1 ≦ i ≦ N を満たす i それぞれについて、以下の問題に答えてください。
・S の 1 文字目から i 文字目までの部分文字列を T_{i} とする。T_{i} の接頭辞であり、接尾辞でもあるような文字列のうち最長のものの長さを出力してください。
ただし、空文字列の長さは 0 とし、
文字列 T の接頭辞、接尾辞は空文字列を含み、T 自身を含まないものとします。


例えば S = aabaaab に対して i = 5 の場合、
S の 1 文字目から i 文字目までの部分文字列は aabaa なので、
・接頭辞 : { φ, a, aa, aab, aaba }
・接尾辞 : { φ, a, aa, baa, abaa }
となります。接頭辞かつ接尾辞である文字列は φ, a, aa の 3 つなので、答えは aa の長さである 2 となります。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます

N
S

1 行目には文字列の長さを表す整数 N が与えられ、2 行目には文字列 S が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1 ≦ i ≦ N を満たす i それぞれについて、
i 行目に
・S の 1 文字目から i 文字目までの部分文字列について、接頭辞であり、接尾辞でもあるような文字列のうち最長のものの長さを表す整数
を出力してください。
ただし、最後には改行を入れ、
余計な文字や空白、空行を出力しないようにしてください。

条件
すべてのテストケースにおいて、以下の条件を満たします。
・2 ≦ N ≦ 5000
・S は英小文字のみからなる文字列

入力例1
11
abracadabra

出力例1
0
0
0
1
0
1
0
1
2
3
4
=end
