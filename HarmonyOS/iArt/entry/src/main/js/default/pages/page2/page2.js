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
            userId:15251836927,
            password:1234567,
        }
    },
    routerzhuce() {
        router.push ({
            uri:'pages/page3/page3', // 指定要跳转的页面
        })
    },
    switchPage(){
        router.push ({
            uri:'pages/page/page', // 指定要跳转的页面
        })
    },

//switchPage() {
//        this.list.userId= this.$element('input30').vulue;
//        this.list.password=this.$element('input31').vulue;
//
//let httpRequest = http.createHttp();
//// 用于订阅http响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
//httpRequest.on('headerReceive', (err, data) => {
//    if (!err) {
//        console.info('header: ' + data.header);
//    } else {
//        console.info('error:' + err.data);
//    }
//});
//httpRequest.request(
//    // 填写http请求的url地址，可以带参数也可以不带参数。URL地址需要开发者自定义。GET请求的参数可以在extraData中指定
//    "http://127.0.0.1:8080/iArt/logininterface/regist",
//    {
//        method: 'POST',
//        header: {
//            'Content-Type': 'application/x-www-form-urlencoded'
//        },
//        // 当使用POST请求时此字段用于传递内容
//        extraData:"userId="+this.list.userId+ "&password="+this.list.password,
//        readTimeout: 60000, // 可选，默认为60000ms
//        connectTimeout: 60000 // 可选，默认为60000ms
//    },(err, data) => {
//        if (!err) {
//            // data.result为http响应内容，根据业务需要进行解析
//            let ret = data.result;
//            if(ret.errno == 200){
//                prompt.showToast({
//                    message: '登陆成功',
//                    duration: 2000,
//                });
//                router.push ({
//                    uri:'pages/page/page', // 指定要跳转的页面
//                    params:{
//                        userId: this.list.userId,
//                    },
//                })
//            }else if( ret.errno == 504){
//                prompt.showToast({
//                    message: ' 未找到用户',
//                    duration: 2000,
//                });
//            }else if( ret.errno == 501){
//                prompt.showToast({
//                    message: '密码错误',
//                    duration: 2000,
//                });
//            }else if( ret.errno == 203){
//                prompt.showToast({
//                    message: '登陆成功（为孩子用户）',
//                    duration: 2000,
//                });
//                router.push ({
//                    uri:'pages/page/page', // 指定要跳转的页面
//                    params:{
//                        userId: this.list.userId,
//                    },
//                })
//            }else if( ret.errno == 204){
//                prompt.showToast({
//                    message: '登陆成功（为家长用户）',
//                    duration: 2000,
//                });
//                router.push ({
//                    uri:'pages/page/page', // 指定要跳转的页面
//                    params:{
//                        userId: this.list.userId,
//                    },
//                })
//            }else if( ret.errno == 205){
//                prompt.showToast({
//                    message: '登陆成功（为医师用户）',
//                    duration: 2000,
//                });
//                router.push ({
//                    uri:'pages/page/page', // 指定要跳转的页面
//                    params:{
//                        userId: this.list.userId,
//                    },
//                })
//            }
//
//
//        } else {
//            console.info('REQ:' + JSON.stringify(this.list))
//        }
//    }
//);
//
////
// }
}