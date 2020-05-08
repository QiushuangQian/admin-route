package com.admin.service.impl;

import com.admin.domain.Travel;
import com.admin.mapper.TravelMapper;
import com.admin.service.TravelService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: mousse
 * Date: 2020-04-13
 * Time: 15:24
 * To change this template use File | Settings | File Templates.
 */
@Transactional
@Service
public class TravelServiceImpl implements TravelService {

    @Autowired
    private TravelMapper travelMapper;

    @Override
    public List<Travel> getAllTravel(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return travelMapper.selectAll();
    }

    @Override
    public int addTravel(Travel travel) {
        return travelMapper.insertSelective(travel);
    }

    @Override
    public int addLikeTravel(Long userId, Long travelId) {
        return travelMapper.insertUserAndTravel(userId, travelId);
    }

    @Override
    public List<Travel> getUserLikeTravel(Long userId, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return travelMapper.selectTravelByUserId(userId);
    }

    @Override
    public int deleteTravel(Long travelId) {
        return travelMapper.deleteByPrimaryKey(travelId);
    }

    @Override
    public int updateTravel(Travel travel) {
        return travelMapper.updateByPrimaryKey(travel);
    }

    @Override
    public List<Travel> getTravelNoLike(Long userId, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        return travelMapper.selectTravelNoUserId(userId);
    }

    @Override
    public int deleteLikeTravel(Long userId, Long travelId) {
        return travelMapper.deleteTravelByUserId(userId,travelId);
    }

}
