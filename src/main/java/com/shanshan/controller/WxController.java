package com.shanshan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shanshan.bean.UserBean;
import com.shanshan.service.UserService;
import com.shanshan.util.BaseUtil;
import com.shanshan.util.Config;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shanshan.bean.SNSUserInfo;
import com.shanshan.bean.WeixinOauth2Token;
import com.shanshan.service.WxService;
import com.shanshan.util.AbSHA1;
import com.shanshan.util.AdvancedUtil;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by szmg on 17/9/27.
 */
@Controller
public class WxController {
    private static final Logger LOG = Logger.getLogger(ArticleCategoryController.class);

    private String Token = "shanshanToken";

    @Resource
    WxService wxService;

    @Autowired
    UserService userService;

    /**
     * 微信接入
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/wx", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public void connectWeixin(HttpServletRequest request, HttpServletResponse response) throws IOException{
        // 将请求、响应的编码均设置为UTF-8（防止中文乱码）
        request.setCharacterEncoding("UTF-8");  //微信服务器POST消息时用的是UTF-8编码，在接收时也要用同样的编码，否则中文会乱码；
        response.setCharacterEncoding("UTF-8"); //在响应消息（回复消息给用户）时，也将编码方式设置为UTF-8，原理同上；boolean isGet = request.getMethod().toLowerCase().equals("get");

        PrintWriter out = response.getWriter();

        try {

            //判断访问方式
            boolean isGet = request.getMethod().toLowerCase().equals("get");
            if (isGet) {
                //进行认证
                doGet(request, response);
            } else {
                //处理微信post请求
                doPost(request,out);
            }
        } catch (Exception e) {
        }finally{
            out.close();
        }
    }

    private void doPost(HttpServletRequest request, PrintWriter out) {
        String respMessage = "异常消息！";
        try {
            respMessage = wxService.weixinPost(request);
            out.write(respMessage);
        } catch (Exception e) {
        }
    }

    /**
     * 验证URL真实性
     *
     * @param request
     * @param response
     * @return String
     */
    private String doGet(HttpServletRequest request, HttpServletResponse response) {
        // 验证URL真实性
        String signature = request.getParameter("signature");// 微信加密签名
        String timestamp = request.getParameter("timestamp");// 时间戳
        String nonce = request.getParameter("nonce");// 随机数
        String echostr = request.getParameter("echostr");// 随机字符串
        List<String> params = new ArrayList<String>();
        params.add(Token);
        params.add(timestamp);
        params.add(nonce);
        // 1. 将token、timestamp、nonce三个参数进行字典序排序
        Collections.sort(params, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                return o1.compareTo(o2);
            }
        });
        // 2. 将三个参数字符串拼接成一个字符串进行sha1加密
        String temp = AbSHA1.encode(params.get(0) + params.get(1) + params.get(2));
        if (temp.equals(signature)) {
            try {
                response.getWriter().write(echostr);
                return echostr;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }


    /**
     * 微信接入
     * @return
     * @throws IOException
     * 如果用户同意授权，页面将跳转至 redirect_uri/?code=CODE&state=STATE。
     */
    @RequestMapping(value = "/oauth", method = { RequestMethod.GET, RequestMethod.POST })
    @ResponseBody
    public ModelAndView wxOauth(@RequestParam(value = "type", required=false) Integer type,
                                HttpServletRequest request, HttpServletResponse response) throws Exception {
        /**
         1 活动信息 active/active
         2 产品资料 equipment/sbxx
         3 技术文章 artile/artivle
         4 培训课程 coach
         5 技术咨询 jask
         6 故障报修 require
         7 关于山善 aboutss
         8 联系我们 service
         9 我的记录 myrecord
         10 注册登录 login
         */
        Map<Integer,String> map=new HashMap<>();
        map.put(1,"active/active");
        map.put(2,"equipment/sbxx");
        map.put(3,"article/article");
        map.put(4,"coach");
        map.put(5,"jask");
        map.put(6,"require");
        map.put(7,"aboutss");
        map.put(8,"service");
        map.put(9,"myrecord");
        map.put(10,"login");

        ModelAndView mav=null;
        if(BaseUtil.isNotEmpty(type)){
            String viewName = map.get(type);
            if(viewName!=null){
                mav = new ModelAndView(viewName);
            }
        }else{
            mav = new ModelAndView("login");
        }



        // 将请求、响应的编码均设置为UTF-8（防止中文乱码）
        request.setCharacterEncoding("UTF-8");  //微信服务器POST消息时用的是UTF-8编码，在接收时也要用同样的编码，否则中文会乱码；
        response.setCharacterEncoding("UTF-8"); //在响应消息（回复消息给用户）时，也将编码方式设置为UTF-8，原理同上；boolean isGet = request.getMethod().toLowerCase().equals("get");

        // 用户同意授权后，能获取到code
        String code = request.getParameter("code");
        String state = request.getParameter("state");

        LOG.info("=============code=====================::::"+code+"::::=================================");
        LOG.info("=============state=====================::::"+state+"::::=================================");

        // 用户同意授权
        if (code!=null&&!"authdeny".equals(code)) {
            // 获取网页授权access_token
            WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken(Config.AppID, Config.AppSecret, code);
            LOG.info("=============weixinOauth2Token=====================::::"+weixinOauth2Token+"::::=================================");
            if(weixinOauth2Token!=null){
                // 网页授权接口访问凭证
                String accessToken = weixinOauth2Token.getAccessToken();
                LOG.info("=============accessToken=====================::::"+accessToken+"::::=================================");
                // 用户标识
                //oBZHzsmT36jCNkvnRJVLj-6KjSrs
                String openId = weixinOauth2Token.getOpenId();
                LOG.info("=============openId=====================::::"+openId+"::::=================================");
                // 获取用户信息
                SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken, openId);
                LOG.info("=============snsUserInfo=====================::::"+snsUserInfo+"::::=================================");
                if(openId!=null&&snsUserInfo!=null){
                    UserBean userByWxOpenId = userService.getUserByWxOpenId(openId);
                    if(userByWxOpenId==null){ //第一次授权 开始注册A级用户
                        UserBean userBean=new UserBean();
                        userBean.setUserName(snsUserInfo.getNickname());
                        userBean.setUserType(1);
                        userBean.setWxOpenId(snsUserInfo.getWxOpenId());
                        userBean.setSex(snsUserInfo.getSex());//用户的性别，值为1时是男性，值为2时是女性，值为0时是未知
                        userBean.setHeadUrl(snsUserInfo.getHeadImgUrl());

                        //保存微信授权信息 即微信注册 A级用户
                        userService.saveUser(userBean);

                        //插入后再查询 目的是查询出用户id 方便前端 进行 注册
                        UserBean userSaveByWxOpenId = userService.getUserByWxOpenId(openId);
                        LOG.info("=============userSaveByWxOpenId=====================::::"+userSaveByWxOpenId+"::::=================================");
                        if(userSaveByWxOpenId!=null&& BaseUtil.isNotEmpty(userSaveByWxOpenId.getUserId())){
                            LOG.info("=============idid=====================::::"+userSaveByWxOpenId.getUserId()+"::::=================================");
                            LOG.info("=============idid=====================::::"+userSaveByWxOpenId.getWxOpenId()+"::::=================================");
                            snsUserInfo.setUserId(""+userSaveByWxOpenId.getUserId());
                        }
                    }else{//说明之前已经授权了(即之前已经注册了),此时无需做任何操作
                        LOG.info("=============AAAA说明之前已经授权了(即之前已经注册了),此时无需做任何操作BBBB=====================");
                        snsUserInfo.setUserId(""+userByWxOpenId.getUserId());
                    }
                    // 设置要传递的参数
                    mav.addObject("code",200);
                    mav.addObject("data",snsUserInfo);
                }else{
                    mav.addObject("code",100);
                    mav.addObject("data","获取不到用户数据");
                }
            }else{
                mav.addObject("code",100);
                mav.addObject("data","获取不到用户数据");
            }
        }else{
            mav.addObject("code",101);
            mav.addObject("data","未授权成功");
        }
        return mav;

    }

}
