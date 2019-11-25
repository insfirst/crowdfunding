package com.crowdfunding.controller;

import java.util.HashMap;
import java.util.Map;

/**
 * 视图控制器基类
 */
public class BaseController {

    private ThreadLocal<Map<String,Object>>datas=new ThreadLocal<Map<String,Object>>();

    protected void start(){
        Map<String,Object>resultMap=new HashMap<String,Object>();
        datas.set(resultMap);
    }
    public Object end(){
        Map<String,Object>resultMap=datas.get();
        datas.remove();
        return resultMap;
    }

    public void success(boolean bl){
        Map<String, Object> resultMap = datas.get();
        resultMap.put("success",bl);
    }

    public void param(String key,Object val){
        Map<String, Object> resultMap = datas.get();
        resultMap.put(key,val);
    }
    public void error(String error){
        Map<String, Object> resultMap = datas.get();
        resultMap.put("error",error);
    }
    public void message(String message){
        Map<String, Object> resultMap = datas.get();
        resultMap.put("message",message);
    }
}
