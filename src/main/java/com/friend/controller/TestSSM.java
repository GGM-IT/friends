package com.friend.controller;

import java.io.IOException;
import java.util.*;

import com.friend.dao.PhotoDao;
import com.friend.dao.UserMapper;
import com.friend.pojo.*;
import com.friend.util.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.friend.dao.DoorMapper;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.swing.BakedArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
/** 测试类：测试SSM开发环境 */
@Controller /* 这个注解表示当前类属于Controller层代码 */
public class TestSSM {

    /** 自动装配：由spring自动为属性赋值(对象)  */
    @Autowired
    UserMapper mapper;

    @RequestMapping(value = "/login.do")//, produces = "text/html; charset=utf-8")
    public String login(HttpServletRequest request, HttpServletResponse response,
                        String username, String password, String remname,
                        String autologin) throws IOException {
//        System.out.println(username + password + "   " + remname + autologin);
        //找数据库

//        System.out.println(username + password + "   " + remname + autologin);
        User user = mapper.findByup(username, password);
        if(user == null)
        {
//            System.out.println("here");
            request.setAttribute("msg", "用户或密码错误");
            return "login";
        }
        LogInfo li = new LogInfo(user.getUsername(), user.getRole(), user.getId());
        HttpSession session = request.getSession();
        System.out.println(li);
        session.setAttribute("user", li);

        if(remname != null)
        {
            Cookie ck = new Cookie("remname", user.getUsername());
            ck.setMaxAge(30*24*3600);
            response.addCookie(ck);
        }
        else
        {
            Cookie ck = new Cookie("remname", "");
            ck.setMaxAge(0);
            response.addCookie(ck);
        }
        if(autologin != null)
        {
            Cookie ck = new Cookie("logname", user.getUsername());
            ck.setMaxAge(30*24*3600);
            response.addCookie(ck);
            ck = new Cookie("logrole", user.getRole());
            ck.setMaxAge(30*24*3600);
            response.addCookie(ck);
        }
        else
        {
            Cookie ck = new Cookie("logname", "");
            ck.setMaxAge(0);
            response.addCookie(ck);
            ck = new Cookie("logrole", "");
            ck.setMaxAge(0);
            response.addCookie(ck);
        }
        return "index";
    }
    @RequestMapping(value = "/jmplogin.do")
    public String jmplogin()
    {
        return "login";
    }

    @RequestMapping(value = "/myspacejmp.do")
    public String myspacejmp(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        LogInfo s = (LogInfo)session.getAttribute("user");
        System.out.println(s.getUserName());
        User user = mapper.findUserByName(s.getUserName());
//        System.out.println(user);
        request.setAttribute("show", user);
        return "myspace";
    }

    @RequestMapping(value = "/logout.do")
    public String logout(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        session.invalidate();
        return "index";
    }

    @RequestMapping(value = "/regist.do")
    public String regist(HttpServletRequest request, String username, String password, String gender,
                        String charact, Integer sal, Integer height, String email)
    {
        HttpSession session = request.getSession();
        String s1 = (String)session.getAttribute("code");
        String s2 = request.getParameter("valistr");
//        System.out.println(username + password + gender + height);
        User user = new User(null, username, password, "user", gender, charact, sal, height, email);
        if(s1.equalsIgnoreCase(s2))
        {
            mapper.insertByInfo(user);
            user = mapper.findUserByName(username);
            LogInfo li = new LogInfo(user.getUsername(), user.getRole(), user.getId());
            session.setAttribute("user", li);
            MainPic mp = mapper.findMainPic(li.getId());
            if(mp == null) {
                mapper.createmainpic(li.getId(), li.getUserName());
            }
            return "success";
        }
        else {
            request.setAttribute("wrong", "验证码错误");
            return "regist";
        }
    }

    @RequestMapping(value = "/jmpregist.do")
    public String jmpregist()
    {
        return "regist";
    }

    @RequestMapping(value = "/image.do")
    public void image(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setDateHeader("Expires", -1);
        response.setHeader("Cache-Control", "no-cache");

        VerifyCode vc = new VerifyCode();
        //将图片保存到response缓冲区中, 再响应给浏览器
        vc.drawImage(response.getOutputStream());

        //获取图片上的验证码
        String code = vc.getCode();
        //将验证码文本保存到session中, 用于后期的校验
        request.getSession().setAttribute("code", code);
    }

    @RequestMapping(value = "/checkuser.do", produces = "text/html; charset=utf-8")
    @ResponseBody
    public String checkuser(HttpServletRequest request)
    {
        String s = request.getParameter("username");
        User user = mapper.findUserByName(s);
        System.out.println(user);
        if(user != null)
            return "用户名已存在";
        return "";
    }

    @RequestMapping(value = "/findperson.do")
    public String findperson(String gender, Integer height, Integer salary, String looks, HttpServletRequest request)
    {
//        System.out.println(gender + height + salary + looks);
        Map<String, Object> map = new HashMap<String, Object>();
        MainPic mp;// = new String[]{};
        List<MainPic> list = new LinkedList<MainPic>();
        map.put("gender", gender);
        map.put("height", height);
        map.put("salary", salary);
        map.put("charact", looks);
        Integer[] ids = mapper.findperson(map);
        for(Integer i : ids)
        {
            mp = mapper.findMainPic(i);
            list.add(mp);
        }
        if(list.isEmpty())
            return "nothing";
        request.setAttribute("userlist", list);
        return "match";
    }

    @RequestMapping(value = "/userdetail.do")
    public String userdetail(HttpServletRequest request, Integer id)
    {
        User user = mapper.findUserById(id);
        request.setAttribute("userinfo",user);
//        System.out.println(user);
        String[] pics = mapper.findPicById(id);
        for(String s : pics)
            System.out.println(s);
        request.setAttribute("userpics",pics);
        return "userdetail";
    }

    @RequestMapping(value = "/changelike.do")
    @ResponseBody
    public Integer changelike(Integer fromid, Integer toid, String val)
    {
        /*try {
            System.out.println(mapper.addlike(fromid, toid, val) + "here");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;*/
        if(mapper.checklike(fromid, toid) != null) {
//            System.out.println("here");
            return mapper.changelike(fromid, toid, val);
        }
        else {
            System.out.println("here" + val);
            return mapper.addlike(fromid, toid, val);
        }
    }
    @RequestMapping(value = "/addfriend.do")
    @ResponseBody
    public Integer addfriend(Integer fromid, Integer toid)
    {
//        System.out.println(fromid + "" + toid);

        if(mapper.findfriend(fromid, toid) == null)
            return mapper.pendingfriend(fromid,toid);
        return 1;
    }

    @RequestMapping(value = "/myfriend.do")
    public String myfriend(HttpServletRequest request)
    {
        //展示所有好友照片

        //展示所有请求好友信息
        HttpSession session = request.getSession();
        LogInfo li = (LogInfo)session.getAttribute("user");
        Integer[] all = mapper.findaddedfriend(li.getId());
        MainPic mp;
        List<MainPic> st = new LinkedList<MainPic>();
        for(Integer i : all)
        {
            mp = mapper.findMainPic(i);
            st.add(mp);
        }
        session.setAttribute("friend", st);
        List<Appealfriend> list = new LinkedList<Appealfriend>();
        list = mapper.findappealfriend(li.getId());
        for(Appealfriend a : list)
            System.out.println(a);
        request.setAttribute("pfriend", list);
        return "myfriend";
    }

    @RequestMapping(value = "/accept.do")
    @ResponseBody
    public Integer accept(Integer myid, Integer tid)
    {
        mapper.addtofriend(myid, tid);
        mapper.addtofriend(tid, myid);
        mapper.deleteappeal(myid,tid);
        return 1;
    }

    @RequestMapping(value = "/deny.do")
    @ResponseBody
    public Integer deny(Integer myid, Integer tid)
    {
        return mapper.deleteappeal(myid,tid);
    }

    @RequestMapping(value = "/mypics.do")
    public String mypics(HttpServletRequest request)
    {
        //展示 所有个人照片提供 上传 删除 功能
        HttpSession session = request.getSession();
        LogInfo li = (LogInfo)session.getAttribute("user");
        String[] s = mapper.findPicById(li.getId());
        session.setAttribute("pics", s);
        return "mypics";
    }

    @RequestMapping(value = "/addphoto.do")
    public String addphoto(HttpServletRequest request) {
        List<String> list = new ArrayList<String>();
        String filename = PhotoDao.getPhotoNewName();
        ServletContext servletContext = null;
        servletContext = request.getSession().getServletContext();
        //第一步:获取页面上上传的图片资源
        HttpSession session = request.getSession();
        LogInfo li = (LogInfo)session.getAttribute("user");
        Integer id = li.getId();
        List<FileItem> items = PhotoDao.getRequsetFileItems(request, servletContext);
        boolean isLoadToSQL = false;
        for (FileItem item : items) {
            if (!item.isFormField()) {
                //判断后缀名是否是jpg
                if (PhotoDao.isGif(item)) {
                    isLoadToSQL = PhotoDao.saveFile(item, filename, request);
                    mapper.addpic(id, filename);
                    String[] s = mapper.findPicById(li.getId());
                    session.setAttribute("pics", s);
                } else {
                    System.out.println("后缀格式有误，保存文件失败");
                }
            }
        }
        return "mypics";
    }

    @RequestMapping(value = "/setmainpic.do")
    @ResponseBody
    public Integer setmainpic(Integer id, String url)
    {
        System.out.println(id + ""+url);
        return mapper.setmainpic(id, url);
    }

    @RequestMapping(value = "/deletepic.do")
    public String deletepic(HttpServletRequest request, Integer id, String url)
    {
        mapper.deletepic(id, url);
        HttpSession session = request.getSession();
        LogInfo li = (LogInfo)session.getAttribute("user");
        String[] s = mapper.findPicById(li.getId());
        session.setAttribute("pics", s);
        return "mypics";
    }

    @RequestMapping(value = "/editinfo.do")
    public String editinfo(Integer id, HttpServletRequest request)
    {
        User user = mapper.findUserById(id);
        request.setAttribute("info", user);
        return "newinfo";
    }


    @RequestMapping(value = "/update.do")
    public void update(HttpServletRequest request, String gender, String character, Integer sal, Integer height, String email)
    {
        HttpSession session = request.getSession();
        LogInfo li = (LogInfo)session.getAttribute("user");
        Integer id = li.getId();
//       System.out.println(gender + character + sal + height + email);
         mapper.updateinfo(gender, character, sal, height, email, id);
    }
    @RequestMapping(value = "/deletefriend.do")
    public String deletefriend(HttpServletRequest request, Integer myid, Integer id)
    {
        mapper.deletefriendbyid(myid, id);
        mapper.deletefriendbyid(id, myid);
        HttpSession session = request.getSession();
        LogInfo li = (LogInfo)session.getAttribute("user");
        Integer[] all = mapper.findaddedfriend(li.getId());
        MainPic mp;
        List<MainPic> st = new LinkedList<MainPic>();
        for(Integer i : all)
        {
            mp = mapper.findMainPic(i);
            st.add(mp);
        }
        session.setAttribute("friend", st);
        return "myfriend";
    }

    @RequestMapping(value = "/friendetail.do")
    public String friendetail(HttpServletRequest request, Integer id)
    {
        HttpSession session = request.getSession();
        LogInfo li = (LogInfo)session.getAttribute("user");
        String[] s = mapper.findPicById(id);
        User user = mapper.findUserById(id);
        request.setAttribute("pics1", s);
        request.setAttribute("friend1", user);
        String[] s2 = mapper.getmessage(li.getId(), id);
        request.setAttribute("fmessage", s2);
        return "friendetail";
    }

    @RequestMapping(value = "/message.do")
    public String message(HttpServletRequest request, Integer friendid, String message)
    {
//        System.out.println(friendid + message);
        String[] s = mapper.findPicById(friendid);
        User user = mapper.findUserById(friendid);
        request.setAttribute("pics1", s);
        request.setAttribute("friend1", user);
        HttpSession session = request.getSession();
        LogInfo li = (LogInfo)session.getAttribute("user");
        String[] s2 = mapper.getmessage(li.getId(), friendid);
        request.setAttribute("fmessage", s2);
        message.replaceAll("\n", "<br/>");
        mapper.setmessage(li.getId(), friendid, message);
        return "friendetail";
    }
}