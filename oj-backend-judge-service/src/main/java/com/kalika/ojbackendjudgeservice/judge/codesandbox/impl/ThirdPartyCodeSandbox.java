package com.kalika.ojbackendjudgeservice.judge.codesandbox.impl;

/**
 * @Author 倪彤
 * @Date 2023/12/27 18:13
 * @Version 1.0
 */


import com.kalika.ojbackendjudgeservice.judge.codesandbox.CodeSandbox;
import com.kalika.ojbackendmodel.model.codesandbox.ExecuteCodeRequest;
import com.kalika.ojbackendmodel.model.codesandbox.ExecuteCodeResponse;

/**
 * 第三方代码沙箱(调用网上现成的)
 */
public class ThirdPartyCodeSandbox implements CodeSandbox {
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        System.out.println("第三方代码沙箱");
        return null;
    }
}
