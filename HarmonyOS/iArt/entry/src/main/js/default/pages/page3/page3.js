import router from '@system.router';
import fetch from '@system.fetch';
export default {
    data: {
        title: "Hello HarmonyOS",
        isHarmonyOS: true,
        userId: undefined,
    },
    routerdenglu() {

        router.push ({
            uri:'pages/page2/page2', // 指定要跳转的页面
        })
    } ,
    switchTitle() {
        let that = this;
        that.title = that.isHarmonyOS ? "Hello World" : "Hello HarmonyOS";
        that.isHarmonyOS = !that.isHarmonyOS;
    }
}