package com.critc.plat.sys.service;

import com.critc.plat.common.base.BaseService;
import com.critc.plat.sys.dao.SysLogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by wangyupeng on 2017/8/18.
 */
@Component

public class SysLogService extends BaseService{

    @Autowired
    private SysLogDao sysLogDao;

}
