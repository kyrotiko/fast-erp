package com.yy.fasterp.utils;

import java.lang.reflect.Field;
import java.util.Collection;

/**
 * @author yuanyang(417168602 @ qq.com)
 * @date 2019/3/25 10:01
 */
public class CollectionUtils {

    public static Boolean isEmpty(Collection collection) {
        return collection == null || collection.size() == 0;
    }
}
