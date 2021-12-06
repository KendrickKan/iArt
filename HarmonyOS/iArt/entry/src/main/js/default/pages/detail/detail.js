import prompt from '@system.prompt';
import http from '@ohos.net.http';
export default {
    data: {
        userId: undefined,
        parentAns: '谢谢老师',
        detList: [{
                      value: 3,
                      word: '心理健康倾向评价',
                  },{
                      value: 2,
                      word: '社交兴趣障碍评价',
                  },{
                      value: 4,
                      word: '潜在危险综合评价',
                  },
        ],
        addReview_list:{

            uri: "http://127.0.0.1:8080/iArt/review/addReview",
            Pic_ID: undefined,
            User_ID: undefined,
            Message:  undefined,

        },
        searchRev_list:{
            uri:"http://127.0.0.1:8080/iArt/review/searchReviewDatas",
            Review_ID: undefined,
        },
        searchDatas_list:{
            uri:"http://127.0.0.1:8080/iArt/review/searchDatas",
            Pic_ID: undefined,
        },

        picAdress: null,
        picNum: 0,
    },
    onInit(){

        this.searchDatas_list.Review_ID= this.picNum;
        this.addReview_list.Pic_ID= this.picNum;
        this.getDatas();
        this.getRev();

    },
    getRev(){
        //获得评价数据
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
            this.searchRev_list.uri,
            {
                method: 'POST',
                header: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                // 当使用POST请求时此字段用于传递内容
                extraData: "Review_ID="+ this.searchRev_list.Review_ID,
                readTimeout: 60000, // 可选，默认为60000ms
                connectTimeout: 60000 // 可选，默认为60000ms
            },(err, data) => {
            if (!err) {
                // data.result为http响应内容，根据业务需要进行解析
                let ret = data.result;
                if(ret.errno == 200){
                    prompt.showToast({
                        message: '获取留言成功',
                        duration: 2000,
                    });
                   this.parentAns=ret.Message;
                }else if( ret.errno == 500){
                    prompt.showToast({
                        message: '获取失败',
                        duration: 2000,
                    });

                }


            } else {
                console.info('REQ:' + JSON.stringify(this.list))
            }
        }
        );
    },
    getDatas(){
        //获得评价数据
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
            this.searchDatas_list.uri,
            {
                method: 'POST',
                header: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                // 当使用POST请求时此字段用于传递内容
                extraData: "Pic_ID="+ this.searchDatas_list.Pic_ID,
                readTimeout: 60000, // 可选，默认为60000ms
                connectTimeout: 60000 // 可选，默认为60000ms
            },(err, data) => {
            if (!err) {
                // data.result为http响应内容，根据业务需要进行解析
                let ret = data.result;
                if(ret.errno == 200){
                    prompt.showToast({
                        message: '获取成功',
                        duration: 2000,
                    });
                    this.detList[0].value= ret.MentalHealth
                    this.detList[1].value=ret.SocialInterest
                    this.detList[2].value= ret.PotentialDanger

                }else if( ret.errno == 500){
                    prompt.showToast({
                        message: '获取失败',
                        duration: 2000,
                    });

                }


            } else {
                console.info('REQ:' + JSON.stringify(this.list))
            }
        }
        );
    },
    submiteAns() {
        let httpRequest = http.createHttp();



        prompt.showToast({
            message: '回复成功',
            duration: 2000,
            width: 75,
            height: 50,
            size: 25
        });


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
            this.addReview_list.uri,
            {
                method: 'POST',
                header: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                // 当使用POST请求时此字段用于传递内容
                extraData: "Pic_ID="+ this.addReview_list.Pic_ID + "&User_ID="+ this.addReview_list.User_ID+"&Message="+this.addReview_list.Message,
                readTimeout: 60000, // 可选，默认为60000ms
                connectTimeout: 60000 // 可选，默认为60000ms
            },(err, data) => {
            if (!err) {
                // data.result为http响应内容，根据业务需要进行解析
                let ret = data.result;
                if(ret.errno == 200){
                    prompt.showToast({
                        message: '提交成功',
                        duration: 2000,
                    });

                }else if( ret.errno == 500){
                    prompt.showToast({
                        message: '评论添加失败',
                        duration: 2000,
                    });

                }


            } else {
                console.info('REQ:' + JSON.stringify(this.list))
            }
        }
        );

    }
}