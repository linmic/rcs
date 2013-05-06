#!/usr/bin/env node

/*
{ result: 'success',
  data:
   { high:
      { value: '255.00000',
        value_int: '25500000',
        display: '$255.00',
        display_short: '$255.00',
        currency: 'USD' },
     low:
      { value: '105.00000',
        value_int: '10500000',
        display: '$105.00',
        display_short: '$105.00',
        currency: 'USD' },
     avg:
      { value: '166.63413',
        value_int: '16663413',
        display: '$166.63',
        display_short: '$166.63',
        currency: 'USD' },
     vwap:
      { value: '162.65579',
        value_int: '16265579',
        display: '$162.66',
        display_short: '$162.66',
        currency: 'USD' },
     vol:
      { value: '263008.31531393',
        value_int: '26300831531393',
        display: '263,008.32 BTC',
        display_short: '263,008.32 BTC',
        currency: 'BTC' },
     last_local:
      { value: '120.00000',
        value_int: '12000000',
        display: '$120.00',
        display_short: '$120.00',
        currency: 'USD' },
     last_orig:
      { value: '92.00000',
        value_int: '9200000',
        display: '92.00 €',
        display_short: '92.00 €',
        currency: 'EUR' },
     last_all:
      { value: '120.39120',
        value_int: '12039120',
        display: '$120.39',
        display_short: '$120.39',
        currency: 'USD' },
     last:
      { value: '120.00000',
        value_int: '12000000',
        display: '$120.00',
        display_short: '$120.00',
        currency: 'USD' },
     buy:
      { value: '120.00000',
        value_int: '12000000',
        display: '$120.00',
        display_short: '$120.00',
        currency: 'USD' },
     sell:
      { value: '123.40098',
        value_int: '12340098',
        display: '$123.40',
        display_short: '$123.40',
        currency: 'USD' },
     item: 'BTC',
     now: '1365692150664577' } }
*/

var https = require('https');

var url = 'https://data.mtgox.com/api/2/BTCUSD/money/ticker';

https.get(url, function(res){
    var rsp = '';

    res.on('data', function (chunk){
        rsp += chunk;
    });

    res.on('end',function(){
        var data = JSON.parse(rsp).data;
        console.log ('Last: ' + data.last.value + ' | Weighted Avg: ' + data.vwap.value)
    })

});
