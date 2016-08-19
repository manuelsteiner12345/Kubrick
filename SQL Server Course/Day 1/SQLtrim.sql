-- space in the middle is counted as a character, it is normal, but with datalength, the space after the expression are also counted
select len('hello world  ') --11
select datalength('hello world  ') --13
select datalength(ltrim(rtrim('hello world  '))) --11

s