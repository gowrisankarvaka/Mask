%dw 2.0
import * from dw::util::Values
output application/json
---
//masking the values based on keys
//for single password masking
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
    }
    else
    (k1):v1
}else
(k):v

//for masking two passwords
/*payload mapObject (v,k,i) ->
if(k~='three')
{
    (k): v mapObject (v1,k1,i1) ->
    if(k1~='three')
    {
        (k1): v1 mapObject (v2,k2,i2)->
        if(k2~='password')
        {
            (k2):'******'
        }else
        (k2):v2
    }else if(k1~='password')
    {
        (k1): '*******'
    }else
    (k1):v1
}else
(k):v*/

//for masking all values

/*payload mapObject (v,k,i) ->
if(k ~= 'three')
{
    (k): v mapObject (v1,k1,i1) ->
    if(k1 ~= 'three')
    {
        (k1):v1 mapObject (v2,k2,i2) ->
        if(k2 ~= 'password')
        {
            (k2): '********'
        }else
        (k2): v2
    }
    else if(k1 ~= 'password')
    {
        (k1):'*****'
    }else if(k1 ~= 'one' or k1 ~= 'two')
    {
        (k1): '------'
    }else
    (k1):v1
}
else if(k ~= 'one' or k ~= 'two')
{
    (k):'+++++'
}else
(k):v
*/

// this is the simplest way to mask the values
//payload mask 'password' with '*****'
