import router from '@system.router';
import fetch from '@system.fetch';
import request from '@system.request';
//export var appData = getApp();
//import app from '@system.app'
export default {

    //const app = getApp(),
    data: {
        userId: undefined,
         clickedId: 0,
        picList: [{
                title: 'name1',
                uid: 0,
                img: 'common/images/uid_1.jpg',
        },{
            title: 'name2',
            uid: 1,
            img: 'common/images/uid_2.png',
        },{
            title: 'name3',
            uid: 2,
            img: 'common/images/uid_3.jpeg',
        },{
            title: 'name4',
            uid: 3,
            img: 'common/images/uid_4.jpeg',
        },
        ],
    },

    routerUser() {
        var that = this;
        router.push ({
            uri:'pages/user/user', // 指定要跳转的页面
            params:{
                userId: that.userId,
            },
        })
    },
    routerDetail(id){
        console.log( this.picList[id].img);
        this.$set('clickedId',id);
        router.push ({

            uri:'pages/detail/detail', // 指定要跳转的页面
            //console.log(id);
            params: {
                picNum: id,
                picAdress: this.picList[id].img,
            },
        })
    },

    routerLogic(){
        router.push ({
            uri:'pages/page/page', // 指定要跳转的页面
        })
    },
    getId(){ //有大问题
        console.log('getid:' + this.clickedId);
      return this.clickedId;

    },
}