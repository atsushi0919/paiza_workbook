def make_problem(n: 10000, m: 10000, s_len: 100, p: 10000, q: 100, seed: 0)
  # n: 単語数, m: 希望頭文字数, s_len: 単語文字数, p: 価格, q: 希望単語文字数, seed: 乱数固定

  results = ["#{n} #{m}"]

  # s_len文字の文字列と1~pの価格の組み合わせを n個作る
  n.times do
    results << "#{random_str(n: s_len)} #{rand(1..p)}"
  end

  # 1~10文字の文字列を m個作る
  m.times do
    results << "#{random_str(n: rand(1..10))}"
  end
  results.join("\n")
end

def random_str(n: 100, head: "a", tail: "z")
  n.times.map { ("a".."z").to_a.sample }.join
end
