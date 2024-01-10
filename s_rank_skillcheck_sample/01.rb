# 島探し (paizaランク S 相当)
# https://paiza.jp/works/mondai/s_rank_skillcheck_sample/search-island

INPUT1 = <<"EOS"
4 5
0 1 1 0
1 0 1 0
1 0 0 0
0 0 1 1
0 1 1 1
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
6 6
1 1 1 1 1 1
1 0 1 0 0 0
1 0 1 0 1 1
0 1 0 0 0 1
1 0 1 1 1 1
0 1 0 0 0 0
EOS
OUTPUT2 = <<"EOS"
5
EOS

# c=0;(w,h),*a=INPUT2.split($/).map{|l|l.split.map &:to_i}
c=0;(w,h),*a=*$<.map{|l|l.split.map &:to_i}
(0...h).each{|y|
  (0...w).each{|x|
    next if a[y][x]!=1
    c+=1
    s=[[y, x]]
    while s.size>0
      i,j=s.pop
      a[i][j]=2
      [[-1,0],[0,1],[1,0],[0,-1]].each{|k,l|
        m,n=i+k,j+l
        s<<[m,n] if 0<=m&&m<h&&0<=n&&n<w&&a[m][n]==1
      }
    end
  }
}
p c