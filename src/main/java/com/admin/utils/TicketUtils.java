package com.admin.utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: mousse
 * Date: 2020-04-13
 * Time: 21:20
 * To change this template use File | Settings | File Templates.
 */
public class TicketUtils {

    public static List<Integer> getAllPrice(String path0, String path1, String path2, String path3) throws IOException {
        List<Integer> list = new ArrayList<>();

        list.add(getOnePrice(path0, path1));
        list.add(getOnePrice(path0, path2));
        list.add(getOnePrice(path0, path3));
        list.add(getOnePrice(path1, path2));
        list.add(getOnePrice(path1, path3));
        list.add(getOnePrice(path2, path3));

        return list;
    }

    private static Integer getOnePrice(String path0, String path1) throws IOException {
        String date = DateUtils.date2String(new Date(), "yyyy-MM-dd");
        String url = "http://www.chepiao100.com/yupiao/" + path0 + "," + path1 + "," + date + ".html";

        System.out.println("url = " + url);

        String html = HttpClientUtils.doGet(url);

        Document parse = Jsoup.parse(html);

        String text = parse.select("#tableSort > div.items > ul > li:nth-child(1) > div.list.pri_wp > div:nth-child(2)").text();

        String[] split = text.split("¥");

        if (split[1].contains(".")) {
            String[] split1 = split[1].split("\\.");
            return  Integer.parseInt(split1[0]);
        }

        return Integer.parseInt(split[1]);
    }

}
