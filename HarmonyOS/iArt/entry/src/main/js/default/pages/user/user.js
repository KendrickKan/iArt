import router from '@system.router';
import fetch from '@system.fetch';
import request from '@system.request';
import http from '@ohos.net.http';
export default {
    data: {
        url: "http://121.41.14.201:8080/iArt/logininterface/get_inf",
        userId: undefined,
        list:{
            key: "7ff4d27c2b9ec2f2e4e80e3822c33b71",
            num: 6,
        },
        userInflist: [{
            text: '用户ID：',
            value: undefined,
            userId: undefined,
                      },{
            text: '用户类型：',
            value: '002',
            userType: undefined,
        },{
            text: '性别：',
            value: '003',
            gender: undefined,
        },{
            text: '年龄：',
            value: '004',
            age: undefined,
        },{
            text: '绑定孩子ID：',
            value: '005',
        },{
            text: '绑定家长ID：',
            value: '006',
        },],
    },
    onInit(){
        //GET TEST
//        let httpRequest = http.createHttp();
//        httpRequest.request(
//        // 填写http请求的url地址，可以带参数也可以不带参数。URL地址需要开发者自定义。GET请求的参数可以在extraData中指定
//            "http://api.tianapi.com/esports/index",
//            {
//                method: 'POST', // 可选，默认为“GET”
//                // 开发者根据自身业务需要添加header字段
//                header: {
//                    //            'Content-Type': 'application/json'
//                    'Content-Type': 'application/x-www-form-urlencoded'
//                },
//                // 当使用POST请求时此字段用于传递内容
//                extraData: {
//                    key: "7ff4d27c2b9ec2f2e4e80e3822c33b71"
//                },
//                readTimeout: 60000, // 可选，默认为60000ms
//                connectTimeout: 60000 // 可选，默认为60000ms
//            },(err, data) => {
//            if (!err) {
//                // data.result为http响应内容，可根据业务需要进行解析
//                this.userInflist[0].value = data.result;
//                console.info('Result:' + data.result);
//                this.userInflist[1].value = data.result.code;
//                console.info('code:' + data.responseCode);
//                // data.header为http响应头，可根据业务需要进行解析
//                this.userInflist[2].value = data.result.msg;
//                console.info('header:' + data.header);
//            } else {
//                console.info('error:' + err.data);
//                this.userInflist[3].value = "SB"
//            }
//        }
//        );

        let httpRequest= http.createHttp();
        httpRequest.request("http://api.tianapi.com/esports/index?key=7ff4d27c2b9ec2f2e4e80e3822c33b71&num=10",
            {
                method: 'GET',
                header: {
                    'Content-Type': 'application/json'
                },
                readTimeout: 60000,
                connectTimeout: 60000
            },(err, data) => {
                if (!err) {
                    let datas = JSON.parse(data.result);
                    this.userInflist[0].value = data.result;
                    this.userInflist[1].value = datas.code;
                    this.userInflist[2].value = datas.msg;
                    console.info('header:' + data.header);
                } else {
                    console.info('error:' + err.data);
                    this.userInflist[3].value = "SB"
                }
            });
    },
    //fetch接口

    //fetch接口结束
    routerLogic(){
        router.push ({
            uri:'pages/page/page', // 指定要跳转的页面
        })
    },
    switchTitle() {

    }
}