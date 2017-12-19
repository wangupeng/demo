package com.critc.plat.sys.dao;

import com.critc.plat.sys.model.Index;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by wangyupeng on 2017/10/13.
 */
@Mapper
public interface IndexDao {
    /**
     * 插入事件
     * @param index
     * @return
     */
    int addEvent(Index index);

    /**
     * 事件查询
     * @param index
     * @return
     */
    List<Index> listEventByUser(Index index);

    /**
     * 修改事件
     * @param index
     * @return
     */
    int updateEventContent(Index index);

    /**
     * 删除事件
     * @param eventId
     * @return
     */
    int deleteEventById(String eventId);
}
