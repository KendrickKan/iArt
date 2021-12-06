import router from '@system.router';
import prompt from '@system.prompt';
import http from '@ohos.net.http';
export default {
    data: {
        url: "http://127.0.0.1:8080/iArt/logininterface/get_inf",
        userId: undefined,
        list: {
            userType: undefined,
            userId: undefined,
            userName: undefined,
            password: undefined,
            gender: undefined,
            age: undefined,
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
            value: undefined,
        },{
            text: '绑定家长ID：',
            value: undefined,
        },],
    },
    onInit(){
        this.list.userId = this.userId;
        let httpRequest= http.createHttp();
        httpRequest.request("http://127.0.0.1:8080/iArt/logininterface/get_inf",
            {
                method: 'POST', //
                header: {
                 'Content-Type': 'application/x-www-form-urlencoded'
                },
                // 当使用POST请求时此字段用于传递内容
                extraData:"userId="+this.userId,
                readTimeout: 60000, // 可选，默认为60000ms
                connectTimeout: 60000 // 可选，默认为60000ms
            },(err, data) => {
                if (!err) {
                    let datas = JSON.parse(data.result);
                    if(datas.errno == 200){
                        prompt.showToast({
                            message: '查询成功',
                            duration: 2000,
                        });
                        this.userInflist[0].value = datas.userId;
                        this.userInflist[1].value = datas.userType;
                        this.userInflist[2].value = datas.gender;
                        this.userInflist[3].value = datas.age;
                    }else if(datas.errno == 500){
                        prompt.showToast({
                            message: '查询失败',
                            duration: 2000,
                        });
                    }

                    console.info('header:' + data.header);
                } else {
                    console.info('error:' + err.data);
//                    this.userInflist[3].value = "SB"
                }
            });
            this.getBindedid();

    },
    getBindedid(){
        let httpRequest= http.createHttp();
        if (this.list.userType == "parent") {

            httpRequest.request("http://127.0.0.1:8080/iArt/c_p_dmap/get_binding_P",
                {
                    method: 'POST', // 可选，默认为“GET”
                    // 开发者根据自身业务需要添加header字段
                    header: {
                        //            'Content-Type': 'application/json'
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    // 当使用POST请求时此字段用于传递内容
                    extraData:"userId="+this.userId,
                    readTimeout: 60000, // 可选，默认为60000ms
                    connectTimeout: 60000 // 可选，默认为60000ms
                },(err, data) => {
                    if (!err) {
                        let datas = JSON.parse(data.result);
                        if(datas.errno == 200){
                            prompt.showToast({
                                message: '查询成功',
                                duration: 2000,
                            });
                            this.userInflist[4].value = datas.childUserId;
                            this.userInflist[5].value = datas.doctorUserId;
                        }else if(datas.errno == 500){
                            prompt.showToast({
                                message: '查询失败',
                                duration: 2000,
                            });
                        }

                        console.info('header:' + data.header);
                    } else {
                        console.info('error:' + err.data);
                        //                    this.userInflist[3].value = "SB"
                    }
                });

        }else if (this.list.userType == "child") {
            httpRequest.request("http://127.0.0.1:8080/iArt/c_p_dmap/get_binding_C",
                {
                    method: 'POST', // 可选，默认为“GET”
                    // 开发者根据自身业务需要添加header字段
                    header: {
                        //            'Content-Type': 'application/json'
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    // 当使用POST请求时此字段用于传递内容
                    extraData:"userId="+this.userId,
                    readTimeout: 60000, // 可选，默认为60000ms
                    connectTimeout: 60000 // 可选，默认为60000ms
                },(err, data) => {
                    if (!err) {
                        let datas = JSON.parse(data.result);
                        if(datas.errno == 200){
                            prompt.showToast({
                                message: '查询成功',
                                duration: 2000,
                            });
                            this.userInflist[4].value = datas.parentUserId;
                            this.userInflist[5].value = datas.doctorUserId;
                        }else if(datas.errno == 500){
                            prompt.showToast({
                                message: '查询失败',
                                duration: 2000,
                            });
                        }

                        console.info('header:' + data.header);
                    } else {
                        console.info('error:' + err.data);
                        //                    this.userInflist[3].value = "SB"
                    }
                });


        }else if (this.list.userType == "doctor"){
            httpRequest.request("http://127.0.0.1:8080/iArt/c_p_dmap/get_binding_D",
                {
                    method: 'POST', // 可选，默认为“GET”
                    // 开发者根据自身业务需要添加header字段
                    header: {
                        //            'Content-Type': 'application/json'
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    // 当使用POST请求时此字段用于传递内容
                    extraData:"userId="+this.userId,
                    readTimeout: 60000, // 可选，默认为60000ms
                    connectTimeout: 60000 // 可选，默认为60000ms
                },(err, data) => {
                    if (!err) {
                        let datas = JSON.parse(data.result);
                        if(datas.errno == 200){
                            prompt.showToast({
                                message: '查询成功',
                                duration: 2000,
                            });
                            this.userInflist[5].value = datas.childUserId;
                            this.userInflist[4].value = datas.parentrUserId;
                        }else if(datas.errno == 500){
                            prompt.showToast({
                                message: '查询失败',
                                duration: 2000,
                            });
                        }

                        console.info('header:' + data.header);
                    } else {
                        console.info('error:' + err.data);
                        //                    this.userInflist[3].value = "SB"
                    }
                });

        }
    },
    //接口结束
    routerLogic(){
        router.push ({
            uri:'pages/page/page', // 指定要跳转的页面
        })
    },
    switchTitle() {

    }
}