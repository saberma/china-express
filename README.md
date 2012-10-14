## 中国快递查询 [![Build Status](https://secure.travis-ci.org/saberma/china-express.png)](http://travis-ci.org/saberma/china-express)

支持顺丰、EMS、申通、圆通、中通、宅急送、韵达、天天快递、联邦快递、汇通等，无须验证码

### 安装

    gem install china-express --no-ri --no-rdoc

### 使用

请前往 [爱查快递API申请](http://www.ickd.cn/api/reg.html)，申请成功，爱查会给你发 `key` 到你的邮箱

    Express.key = 'your_key_here'
    Express.search (单号', '快递公司')

### 示例

    result = Express.search('123456', '顺丰')
    result.success? # true
    result.data # [{'time' => "2012-10-08 09:20", 'content' => "签收人是:马"}]
