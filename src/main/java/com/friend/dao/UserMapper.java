package com.friend.dao;

import com.friend.pojo.Appealfriend;
import com.friend.pojo.MainPic;
import com.friend.pojo.User;

import java.util.List;
import java.util.Map;
public interface UserMapper {

    public List<User> findAll();
    public User findByup(String username, String password);
    public User findUserByName(String s);
    public Integer insertByInfo(User user);
    public Integer[] findperson(Map<String, Object> map);
    public MainPic findMainPic(Integer i);
    public User findUserById(Integer i);
    public String[] findPicById(Integer i);
    public Integer checklike(Integer fromid, Integer toid);
    public Integer changelike(Integer fromid, Integer toid, String val);
    public Integer addlike(Integer fromid, Integer toid, String val);
    public Integer pendingfriend(Integer fromid, Integer toid);
    public Integer findfriend(Integer fromid, Integer toid);
    public List<Appealfriend> findappealfriend(Integer id);
    public Integer addtofriend(Integer myid, Integer tid);
    public Integer deleteappeal(Integer myid,Integer tid);
    public Integer addpic(Integer id, String url);
    public Integer setmainpic(Integer id, String url);
    public Integer deletepic(Integer id, String url);
    public Integer updateinfo(String gender, String character, Integer sal,
                              Integer height, String email, Integer id);
    public Integer[] findaddedfriend(Integer id);
    public Integer deletefriendbyid(Integer id0, Integer id1);
    public Integer createmainpic(Integer id, String s);
    public Integer setmessage(Integer id, Integer fid, String s);
    public String[] getmessage(Integer id, Integer fid);
}
