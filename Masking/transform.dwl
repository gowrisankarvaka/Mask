%dw 2.0
output application/json
---
payload mapObject (v,k,i) ->
if(k as String =='three')
{
(k): v mapObject (v1,k1,i1)->
if(k1 as String == 'three')
{
(k1): v1 mapObject (v2,k2,i2) ->
if(k2 as String == 'password')
{
(k2): '******'
}else
(k2): v2
}else if(k1 as String == 'password')
{
(k1):'*******'
}
else
(k1):v1
}else
(k):v