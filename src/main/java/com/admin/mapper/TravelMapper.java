package com.admin.mapper;

import com.admin.domain.Travel;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: mousse
 * Date: 2020-04-13
 * Time: 15:29
 * To change this template use File | Settings | File Templates.
 */
public interface TravelMapper {

    @Select("select * from travel")
    List<Travel> selectAll();

    @Insert("insert into travel (travelName,travelCity,travelDesc) values (#{travelName},#{travelCity},#{travelDesc})")
    int insertSelective(Travel travel);

    @Insert("insert into user_travel (userId,travelId) values (#{userId},#{travelId})")
    int insertUserAndTravel(@Param("userId") Long userId, @Param("travelId") Long travelId);

    @Select("select * from travel where travelId  in (select travelId from user_travel where userId = #{userId})")
    List<Travel> selectTravelByUserId(Long userId);

    @Delete("delete from travel where travelId = #{travelId} ")
    int deleteByPrimaryKey(Long travelId);

    @Update({
            "update travel set ",
            "travelName = #{travelName},travelCity = #{travelCity},travelDesc = #{travelDesc} ",
            "where travelId = #{travelId}"
    })
    int updateByPrimaryKey(Travel travel);

    @Select("select * from travel where travelId not in (select travelId from user_travel where userId = #{userId})")
    List<Travel> selectTravelNoUserId(Long userId);


    @Delete("delete from user_travel where userId = #{userId} and travelId = #{travelId}")
    int deleteTravelByUserId(@Param("userId") Long userId, @Param("travelId") Long travelId);
}
