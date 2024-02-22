package com.kalika.ojbackendjudgeservice.judge.codesandbox.impl;

/**
 * @Author 倪彤
 * @Date 2023/12/27 18:12
 * @Version 1.0
 */

import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;

import com.kalika.ojbackendcommon.common.ErrorCode;
import com.kalika.ojbackendcommon.exception.BusinessException;
import com.kalika.ojbackendjudgeservice.judge.codesandbox.CodeSandbox;
import com.kalika.ojbackendmodel.model.codesandbox.ExecuteCodeRequest;
import com.kalika.ojbackendmodel.model.codesandbox.ExecuteCodeResponse;
import org.apache.commons.lang3.StringUtils;

/**
 * 远程代码沙箱
 */
public class RemoteCodeSandbox implements CodeSandbox {
    //定义鉴权请求头和密钥
    private static final String AUTH_REQUEST_HEADER = "auth";
    private static final String AUTH_REQUEST_SECRET = "secretKey";

    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        System.out.println("远程代码沙箱");
        String url = "http://124.71.40.42:8100/executeCode";
        String jsonStr = JSONUtil.toJsonStr(executeCodeRequest);
        String responseStr = HttpUtil.createPost(url)
                .header(AUTH_REQUEST_HEADER, AUTH_REQUEST_SECRET)
                .body(jsonStr)
                .execute()
                .body();
        if (StringUtils.isBlank(responseStr)) {
            throw new BusinessException(ErrorCode.API_REQUEST_ERROR, "executeCode remoteSandbox error, message=" + responseStr);
        }
        return JSONUtil.toBean(responseStr, ExecuteCodeResponse.class);
    }
}
