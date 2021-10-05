import router from '@system.router';
import fetch from '@system.fetch';
import prompt from '@system.prompt';
import http from '@ohos.net.http';

export default {
    data: {
        title: "Hello HarmonyOS",
        isHarmonyOS: true,
        userId: undefined,
        list: {
            userId: "15251836927",
            password: "1234567",
        }
    },
    routerzhuce() {
        router.push({
            uri: 'pages/page3/page3', // 指定要跳转的页面
        })
    },
    switchPage() {
        console.info("Press");
        console.info(JSON.stringify(this.list));
        //        this.list.userId= this.$element('input30').vulue;
        //        this.list.password=this.$element('input31').vulue;
        // 每一个httpRequest对应一个http请求任务，不可复用
        let httpRequest = http.createHttp();
        // 用于订阅http响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
//        httpRequest.on('headerReceive', (err, data) => {
//            if (!err) {
//                console.info('header: ' + data.header);
//            } else {
//                console.info('error:' + err.data);
//            }
//        });
        httpRequest.request(
        // 填写http请求的url地址，可以带参数也可以不带参数。URL地址需要开发者自定义。GET请求的参数可以在extraData中指定
            "http://121.36.100.95:8080/iArt/logininterface/login",
            {
                method: "POST", // 可选，默认为“GET”
                // 开发者根据自身业务需要添加header字段
                header: {
                    'Content-Type': 'application/json'
                    //            'Content-Type': 'application/x-www-form-urlencoded'
                },
                // 当使用POST请求时此字段用于传递内容
                extraData: JSON.stringify(this.list),
//                extraData: this.list,
                readTimeout: 60000, // 可选，默认为60000ms
                connectTimeout: 60000 // 可选，默认为60000ms
            }, (err, data) => {
            if (!err) {
                // data.result为http响应内容，可根据业务需要进行解析
                console.info('Result:' + data.result);
                console.info('code:' + data.responseCode);
                // data.header为http响应头，可根据业务需要进行解析
                console.info('header:' + data.header);
                console.info("Succes!");
            } else {
                console.info("Fail!");
                console.info('ERR:' + JSON.stringify(err));
                console.info('ERR:' + JSON.stringify(data));
                console.info('REQ:' + JSON.stringify(this.list))
            }
        }
        );
//        router.push({
//            uri: 'pages/page/page', // 指定要跳转的页面
//        })
        //
    }
}