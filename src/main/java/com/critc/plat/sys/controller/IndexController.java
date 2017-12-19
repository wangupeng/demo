package com.critc.plat.sys.controller;

import com.critc.plat.sys.model.Index;
import com.critc.plat.sys.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by wangyupeng on 2017/10/13.
 */
@Controller
@RequestMapping("/index")
public class IndexController {

    @Autowired
    private IndexService indexService;

    @RequestMapping
    public String index(){
        return "plat/sys/index";
    }

    /**
     * 事件查询
     * @param index
     * @return
     */
    @RequestMapping("/listEventByUser")
    @ResponseBody
    public List<Index> listEventByUser(Index index){
        return indexService.listEventByUser(index);
    }

    /**
     * 插入事件
     * @param index
     * @return
     */
    @RequestMapping("/addIndexEvent")
    @ResponseBody
    public String addIndexEvent(Index index){
        return indexService.addEvent(index);
    }

    /**
     * 修改事件
     * @param index
     * @return
     */
    @RequestMapping("/updateEventContent")
    @ResponseBody
    public int updateEventContent(Index index){
        return indexService.updateEventContent(index);
    }

    /**
     * 事件拖动
     * @param index
     * @return
     */
    @RequestMapping("/eventDrag")
    @ResponseBody
    public String eventDrag(Index index){
        return indexService.eventDrag(index);
    }

    /**
     * 事件删除
     * @param index
     * @return
     */
    @RequestMapping("/deleteEvent")
    @ResponseBody
    public int deleteEventById(Index index){
        return indexService.deleteEventById(index.getEventId());
    }
}
