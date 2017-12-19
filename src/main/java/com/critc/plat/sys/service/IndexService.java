package com.critc.plat.sys.service;

import com.critc.plat.sys.dao.IndexDao;
import com.critc.plat.sys.model.Index;
import com.critc.plat.sys.model.SysUser;
import com.critc.plat.util.date.DateUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by wangyupeng on 2017/10/13.
 */
@Service
public class IndexService {

    @Autowired
    private IndexDao indexDao;

    /**
     * 事件查询
     * @param index
     * @return
     */
    public List<Index> listEventByUser(Index index){
        //获取当前登录用户
        SysUser sysUser = (SysUser) SecurityUtils.getSubject().getSession().getAttribute("userSession");
        index.setUserName(sysUser.getUserName());

        return indexDao.listEventByUser(index);
    }

    /**
     * 插入事件
     * @param index
     * @return
     */
    public String addEvent(Index index){
        //获取当前登录用户
        SysUser sysUser = (SysUser) SecurityUtils.getSubject().getSession().getAttribute("userSession");
        index.setUserName(sysUser.getUserName());

        String eventId = DateUtil.getShortSystemTime();
        index.setEventId(eventId);
        int n = indexDao.addEvent(index);
        if(n<=0) eventId = "";
        return eventId;
    }

    /**
     * 修改事件
     * @param index
     * @return
     */
    public int updateEventContent(Index index){
        return indexDao.updateEventContent(index);
    }

    /**
     * 事件拖动
     * @param index
     * @return
     */
    @Transactional
    public String eventDrag(Index index){
        String eventId = "";
        if(deleteEventById(index.getEventId())>0){
            eventId = addEvent(index);
        }
        return eventId;
    }

    /**
     * 删除事件
     * @param eventId
     * @return
     */
    public int deleteEventById(String eventId){
        return indexDao.deleteEventById(eventId);
    }

}
