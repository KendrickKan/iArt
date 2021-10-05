import prompt from '@system.prompt';

export default {
    data: {
        userId: undefined,
        parentAns: '谢谢老师',
        detList: [{
                      value: 3,
                      word: '潜在危险倾向评价',
                  },{
                      value: 2,
                      word: '社交兴趣障碍评价',
                  },{
                      value: 3,
                      word: '心理健康综合评价',
                  },
        ],
//        picList: [{
//                      title: 'name1',
//                      img: 'common/images/uid_1.jpg',
//                  },{
//                      title: 'name2',
//                      img: 'common/images/uid_2.png',
//                  },{
//                      title: 'name3',
//                      img: 'common/images/uid_3.jpeg',
//                  },{
//                      title: 'name4',
//                      img: 'common/images/uid_4.jpeg',
//                  },
//        ],
        picAdress: null,
        picNum: 0,
    },
//    onInit(){
//    },
    submiteAns() {

        prompt.showToast({
            message: '已发送',
            duration: 2000,
        });
    }
}