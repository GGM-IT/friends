package com.friend.controller;

import com.friend.pojo.User;
import org.junit.jupiter.api.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestSpring {

    @Test
    public void testSpring(){
        //1.加载Spring的核心配置文件
        ClassPathXmlApplicationContext ac =
                new ClassPathXmlApplicationContext(
                        "spring/applicationContext.xml");
        //2.获取bean实例
        User user = (User) ac.getBean("user");
        System.out.println(user + "   stimba");
    }

}
