package com.secdn.secdnrapid.common.utils;

/**
 * Redis所有Keys
 *
 */
public class RedisKeys {

    public static String getSysConfigKey(String key){
        return "sys:config:" + key;
    }
}
