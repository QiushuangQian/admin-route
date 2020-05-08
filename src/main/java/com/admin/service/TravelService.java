package com.admin.service;

import com.admin.domain.Travel;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: mousse
 * Date: 2020-04-13
 * Time: 15:24
 * To change this template use File | Settings | File Templates.
 */
public interface TravelService {
    /**
     * 查找所有游记
     *
     * @param page
     * @param size
     * @return
     */
    List<Travel> getAllTravel(Integer page, Integer size);

    /**
     * 添加游记
     *
     * @param travel
     * @return
     */
    int addTravel(Travel travel);

    /**
     * 添加游记到我的喜欢
     *
     * @param userId
     * @param travelId
     * @return
     */
    int addLikeTravel(Long userId, Long travelId);

    /**
     * 查找加入收藏的id
     * 
     * @param userId
     * @param page
     * @param size
     * @return
     */
    List<Travel> getUserLikeTravel(Long userId, Integer page, Integer size);

    /**
     * 删除游记
     *
     * @param travelId
     * @return
     */
    int deleteTravel(Long travelId);

    /**
     * 修改游记
     * @param travel
     * @return
     */
    int updateTravel(Travel travel);

    /**
     * 查看用户没有收藏的游记
     *
     * @param userId
     * @param page
     * @param size
     * @return
     */
    List<Travel> getTravelNoLike(Long userId, Integer page, Integer size);

    /**
     * 取消收藏
     *
     * @param userId
     * @param travelId
     * @return
     */
    int deleteLikeTravel(Long userId, Long travelId);
}
