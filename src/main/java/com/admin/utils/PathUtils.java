package com.admin.utils;

import com.admin.constant.Constant;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: mousse
 * Date: 2020-04-13
 * Time: 14:43
 * To change this template use File | Settings | File Templates.
 */
public class PathUtils {

    /**
     * 获取所有路径的集合
     *
     * @param start
     * @param pathway1
     * @param pathway2
     * @param pathway3
     * @return
     */
    public static List<Integer> getAllPath(String start, String pathway1, String pathway2, String pathway3) {

        String startGet = HttpClientUtils.doGet("http://api.map.baidu.com/geocoding/v3/?output=json&ak=" + Constant.BaiduAPI.BAIDUAPI_AK + "&callback=showLocation&address=" + start);
        String path1Get = HttpClientUtils.doGet("http://api.map.baidu.com/geocoding/v3/?output=json&ak=" + Constant.BaiduAPI.BAIDUAPI_AK + "&callback=showLocation&address=" + pathway1);
        String path2Get = HttpClientUtils.doGet("http://api.map.baidu.com/geocoding/v3/?output=json&ak=" + Constant.BaiduAPI.BAIDUAPI_AK + "&callback=showLocation&address=" + pathway2);
        String path3Get = HttpClientUtils.doGet("http://api.map.baidu.com/geocoding/v3/?output=json&ak=" + Constant.BaiduAPI.BAIDUAPI_AK + "&callback=showLocation&address=" + pathway3);

        //截取返回值中结果的部分，去掉showLocation&&....这些字符
        String startJsonStr = splitStr(startGet);
        String path1JsonStr = splitStr(path1Get);
        String path2JsonStr = splitStr(path2Get);
        String path3JsonStr = splitStr(path3Get);

        //将字符串转换为json对象（方便调用属性）
        JSONObject starJson = JSONObject.parseObject(startJsonStr);
        JSONObject path1Json = JSONObject.parseObject(path1JsonStr);
        JSONObject path2Json = JSONObject.parseObject(path2JsonStr);
        JSONObject path3Json = JSONObject.parseObject(path3JsonStr);

//        String s ="name:123";
//        s.name;
        //返回计算最佳路径的集合参数
        List<Integer> list = new ArrayList<>();

        int lineLength1 = getLineLength(starJson, path1Json);
        int lineLength2 = getLineLength(starJson, path2Json);
        int lineLength3 = getLineLength(starJson, path3Json);
        int lineLength4 = getLineLength(path1Json, path2Json);
        int lineLength5 = getLineLength(path1Json, path3Json);
        int lineLength6 = getLineLength(path2Json, path3Json);

        list.add(lineLength1);
        list.add(lineLength2);
        list.add(lineLength3);
        list.add(lineLength4);
        list.add(lineLength5);
        list.add(lineLength6);

        return list;

    }

    /**
     *
     * 获取每个长度的路径
     *
     * @param starJson
     * @param path0Json
     * @return
     */
    private static int getLineLength(JSONObject starJson, JSONObject path0Json) {
        //查找最佳路径api的参数
        Map<String, String> params = new HashMap<String, String>();
        //起点位置
        String startLng = starJson.getJSONObject("result").getJSONObject("location").getString("lng");  // 经度值
        String startLat = starJson.getJSONObject("result").getJSONObject("location").getString("lat");  // 纬度值
        //位置定位
        String path0Lng = path0Json.getJSONObject("result").getJSONObject("location").getString("lng");
        String path0Lat = path0Json.getJSONObject("result").getJSONObject("location").getString("lat");


        params.put("output", "json");//输出方式为json

        params.put("tactics", "11");//10不走高速   11常规路线   12距离较短（考虑路况）  13距离较短（不考虑路况）
        params.put("ak", Constant.BaiduAPI.BAIDUAPI_AK);
        // origins 起点 destinations 目的地
        params.put("origins", startLat + "," + startLng + "|" + startLat + "," + startLng);
        params.put("destinations", path0Lat + "," + path0Lng + "|" + path0Lat + "," + path0Lng);

        String result = HttpClientUtils.doGet("http://api.map.baidu.com/routematrix/v2/driving", params);
        JSONArray jsonArray = JSONObject.parseObject(result).getJSONArray("result");
        //获取json长度
        int JsonLen = 0;
        for (Object object : jsonArray) {
            JsonLen++;
        }


        Map<String, String> map = null;
        for (int i = 0; i < JsonLen; i++) {
            map = new HashMap<>();

            map.put("duration", jsonArray.getJSONObject(i).getJSONObject("duration").getString("text"));
            map.put("distanceT", jsonArray.getJSONObject(i).getJSONObject("distance").getString("text"));
            map.put("distanceV", jsonArray.getJSONObject(i).getJSONObject("distance").getString("value"));
        }

        String distanceText = map.get("distanceT");//加入集合
        if (distanceText.contains(".")) {
            String[] split = distanceText.split("\\.");
            return Integer.parseInt(split[0]);
        }

        String substring = distanceText.substring(0, distanceText.length() - 2);

        return Integer.parseInt(substring);
    }

    //将String换成Jason格式

    private static String splitStr(String originDouble) {
        String[] split = originDouble.split("\\(");
        return split[1].substring(0, split[1].length() - 1);
    }

}
