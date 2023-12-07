# FizzBuzz


(1..100).each {|n|
  i=n**4% -15
  puts "FizzBuzz\n"[i,i+13]||n
}

=begin
1 ~ 100 の整数に対して、3 と 5 の両方で割り切れるなら FizzBuzz を、
3 でのみ割り切れるなら Fizz 、5 でのみ割り切れるなら Buzz を改行区切りで出力してください。
また、どちらでも割り切れない場合は、その数字を改行区切りで出力してください。

1

2

Fizz

4

Buzz
入力される値
入力は標準入力にて以下のフォーマットで与えられます。

・ 入力は与えられません。

条件
・ 入力は与えられません。

出力される値
3 と 5 の両方で割り切れるなら FizzBuzz を、 3 でのみ割り切れるなら Fizz 、5 でのみ割り切れるなら Buzz を改行区切りで出力してください。また、どちらでも割り切れない場合は、その数字を改行区切りで出力してください。
出力の末尾には改行を入れてください。

入力例

出力例

1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
31
32
Fizz
34
Buzz
Fizz
37
38
Fizz
Buzz
41
Fizz
43
44
FizzBuzz
46
47
Fizz
49
Buzz
Fizz
52
53
Fizz
Buzz
56
Fizz
58
59
FizzBuzz
61
62
Fizz
64
Buzz
Fizz
67
68
Fizz
Buzz
71
Fizz
73
74
FizzBuzz
76
77
Fizz
79
Buzz
Fizz
82
83
Fizz
Buzz
86
Fizz
88
89
FizzBuzz
91
92
Fizz
94
Buzz
Fizz
97
98
Fizz
Buzz
=end
