import router from '@system.router';
import prompt from '@system.prompt';
import http from '@ohos.net.http';
export default {
    data: {
        title: "Hello HarmonyOS",
        isHarmonyOS: true,
        userId: undefined,
        list: {
            userType: undefined,
            userId: undefined,
            userName: undefined,
            password: undefined,
            gender: undefined,
            age: undefined,
        }
    },
    routerdenglu() {
        this.list.userType= this.$element('input8').vulue;
        this.list.userId=this.$element('input10').vulue;
        this.list.userName= this.$element('input11').vulue;
        this.list.password=this.$element('input12').vulue;
        this.list.gender= this.$element('input13').vulue;
        this.list.age=this.$element('input26').vulue;

        let httpRequest = http.createHttp();
        // 用于订阅http响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
        httpRequest.on('headerReceive', (err, data) => {
            if (!err) {
                console.info('header: ' + data.header);
            } else {
                console.info('error:' + err.data);
            }
        });
        httpRequest.request(
        // 填写http请求的url地址，可以带参数也可以不带参数。URL地址需要开发者自定义。GET请求的参数可以在extraData中指定
            "http://127.0.0.1:8080/iArt/logininterface/regist",
            {
                method: 'POST', //
                header: {

                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                // 当使用POST请求时此字段用于传递内容
                extraData:"userType="+this.list.userType + "&userId=" +this.list.userId +"&userName=" + this.list.userName + "&password=" + this.list.password + "&gender=" +this.list.gender + "&age=" + this.list.age,
                readTimeout: 60000, // 可选，默认为60000ms
                connectTimeout: 60000 // 可选，默认为60000ms
            },(err, data) => {
            if (!err) {
                // data.result为http响应内容，可根据业务需要进行解析
                let ret = data.result;
                if(ret.errno == 200){
                    prompt.showToast({
                        message: '注册成功',
                        duration: 2000,
                    });
                    router.push ({
                        uri:'pages/page2/page2', // 指定要跳转的页面
                        params:{
                            userId: this.list.userId,
                        },
                    })
                }else if( ret.errno == 500){
                    prompt.showToast({
                        message: ' 注册失败',
                        duration: 2000,
                    });
                }

            } else {
                console.info('REQ:' + JSON.stringify(this.list))
            }
        }
        );
    } ,
    routerback() {
        router.push ({
            uri:'pages/page2/page2', // 指定要跳转的页面
        })
    }
}