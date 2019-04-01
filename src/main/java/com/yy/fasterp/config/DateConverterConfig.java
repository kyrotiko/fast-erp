package com.yy.fasterp.config;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author yuanyang(417168602 @ qq.com)
 * @date 2019/3/30 16:32
 */
public class DateConverterConfig implements Converter<String, Date> {
    private static final List<String> FORMATS = new ArrayList<>(4);

    static {
        FORMATS.add("yyyy-MM");
        FORMATS.add("yyyy-MM-dd");
        FORMATS.add("yyyy-MM-dd hh:mm");
        FORMATS.add("yyyy-MM-dd hh:mm:ss");
    }

    @Override
    public Date convert(String source) {
        String value = source.trim();
        if ("".equals(value)) {
            return null;
        }
        if (source.matches("^\\d{4}-\\d{1,2}$")) {
            return parseDate(source, FORMATS.get(0));
        } else if (source.matches("^\\d{4}-\\d{1,2}-\\d{1,2}$")) {
            return parseDate(source, FORMATS.get(1));
        } else if (source.matches("^\\d{4}-\\d{1,2}-\\d{1,2} {1}\\d{1,2}:\\d{1,2}$")) {
            return parseDate(source, FORMATS.get(2));
        } else if (source.matches("^\\d{4}-\\d{1,2}-\\d{1,2} {1}\\d{1,2}:\\d{1,2}:\\d{1,2}$")) {
            return parseDate(source, FORMATS.get(3));
        } else {
            throw new IllegalArgumentException("Invalid boolean value '" + source + "'");
        }
    }

    /**
     * 格式化日期
     *
     * @param dateStr String 字符型日期
     * @param format  String 格式
     * @return Date 日期
     */
    public Date parseDate(String dateStr, String format) {
        Date date = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(format);
            date = dateFormat.parse(dateStr);
        } catch (Exception e) {

        }
        return date;
    }
}
