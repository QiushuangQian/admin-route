package com.admin.controller;

import com.admin.domain.Travel;
import com.admin.domain.User;
import com.admin.service.TravelService;
import com.admin.utils.PathUtils;
import com.admin.utils.TicketUtils;
import com.admin.utils.TspUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: mousse
 * Date: 2020-04-13
 * Time: 15:09
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping("/travel")
public class TravelController {

    @Autowired
    private TravelService travelService;


    @GetMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = false, defaultValue = "8") Integer size) {

        List<Travel> travels = travelService.getAllTravel(page, size);
        PageInfo<Travel> pageInfo = new PageInfo<>(travels);

        ModelAndView mv = new ModelAndView();

        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("travel-list");
        return mv;

    }

    @PostMapping("/insert.do")
    public String addTravel(Travel travel) {

        travelService.addTravel(travel);

        return "redirect:findAll.do";
    }

    @PostMapping("/update.do")
    public String updateTravel(Travel travel) {

        travelService.updateTravel(travel);

        return "redirect:findAll.do";
    }
    
    @GetMapping("/deleteById.do")
    public String delete(Long travelId) {

        travelService.deleteTravel(travelId);

        return "redirect:findAll.do";
    }

    @GetMapping("/user.do")
    public ModelAndView user(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                             @RequestParam(name = "size", required = false, defaultValue = "8") Integer size,
                             HttpServletRequest request){

        User user = (User) request.getSession().getAttribute("user");
        List<Travel> travels = travelService.getTravelNoLike(user.getUserId(), page, size);
        PageInfo<Travel> pageInfo = new PageInfo<>(travels);

        ModelAndView mv = new ModelAndView();

        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("travel-user");
        return mv;
    }


    @GetMapping("/collection.do")
    public String collection(Long travelId, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        travelService.addLikeTravel(user.getUserId(), travelId);

        return "travel-user";
    }

    @GetMapping("/uncollection.do")
    public String uncollection(Long travelId, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        travelService.deleteLikeTravel(user.getUserId(), travelId);

        return "travel-like";
    }


    //查看我的喜欢
    @GetMapping("/like.do")
    public ModelAndView like(@RequestParam(name = "page", required = false, defaultValue = "1") Integer page,
                             @RequestParam(name = "size", required = false, defaultValue = "8") Integer size,
                             HttpServletRequest request) {
        
        User user = (User) request.getSession().getAttribute("user");
        List<Travel> travels = travelService.getUserLikeTravel(user.getUserId(), page, size);
        PageInfo<Travel> pageInfo = new PageInfo<>(travels);

        ModelAndView mv = new ModelAndView();

        mv.setViewName("travel-like");
        mv.addObject("pageInfo", pageInfo);

        return mv;
    }

    @GetMapping("/get.do")
    public String get() {
        return "travel-path";
    }

    
    @PostMapping("/path.do")
    public ModelAndView path(String path0, String path1, String path2, String path3) throws IOException {
        ModelAndView mv = new ModelAndView();
        //百度API  获取所有路径
        List<Integer> allPath = PathUtils.getAllPath(path0, path1, path2, path3);
        //TSP算法   根据百度API获取所有路径得到最近路径的距离和最佳路径
        Map<Integer, int[]> path = TspUtils.search(allPath);
        Collection<int[]> values1 = path.values();
        //最短路径的长度
        int pathValue = 0;
        //最短路径
        String routeValue = null;
        for (Integer integer : path.keySet()) {
            pathValue = integer;
            Collection<int[]> values = path.values();
            for (int[] value : values) {
                routeValue = Arrays.toString(value);
            }
        }
        mv.addObject("pathValue","最近距离为" + pathValue + "公里");
        mv.addObject("routeValue","按坐标最佳线路为:" + routeValue);
        //页面解析获取所有路径的票价
        List<Integer> allPrice = TicketUtils.getAllPrice(path0, path1, path2, path3);
        //最佳价格和路径
        Map<Integer, int[]> price = TspUtils.search(allPrice);
        int priceValue = 0;
        String routeValue2 = null;
        for (Integer integer : price.keySet()) {
            priceValue = integer;
            Collection<int[]> values = price.values();
            for (int[] value : values) {
                routeValue2 = Arrays.toString(value);
            }
        }

        mv.addObject("priceValue","最节约的火车总价格为:¥" + priceValue + ".00");
        mv.addObject("routeValue2","按价格最佳线路为:" + routeValue2);

        //跳转的页面
        mv.setViewName("travel-path");

        return mv;
    }

}
