package com.admin.constant;

/**
 * Created by IntelliJ IDEA.
 * User: mousse
 * Date: 2020-03-12
 * Time: 14:19
 * To change this template use File | Settings | File Templates.
 */
public interface Constant {

    //用户状态,1:开启,0:关闭
    interface UserStatus {
        Integer USER_CLOSE = 0;

        Integer USER_OPEN = 1;
    }

    //发消息的状态 0:发送,1:已读
    interface MessageStatus{
        Integer MESSAGE_OPEN = 0;

        Integer MESSAGE_DONE = 1;
    }

    //公告 0:未读,1:已读
    interface AnnounceStatus{
        Integer ANNOUNCE_UNREAD = 0;

        Integer ANNOUNCE_READ = 1;
    }

    interface BaiduAPI{
       String BAIDUAPI_AK = "KGT0lbSukrlfDl29EdZn6uoOt2oiaPnw";

    }


}
