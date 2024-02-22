package com.kalika.ojbackendjudgeservice.judge.codesandbox;

/**
 * @Author 倪彤
 * @Date 2023/12/27 21:07
 * @Version 1.0
 */

import com.kalika.ojbackendmodel.model.codesandbox.ExecuteCodeRequest;
import com.kalika.ojbackendmodel.model.codesandbox.ExecuteCodeResponse;
import lombok.extern.slf4j.Slf4j;

/**
 * 代理类
 */
@Slf4j
public class CodeSandboxProxy implements  CodeSandbox{

    private final CodeSandbox codeSandbox;

    public CodeSandboxProxy(CodeSandbox codeSandbox){
        this.codeSandbox = codeSandbox;
    }
    @Override
    public ExecuteCodeResponse executeCode(ExecuteCodeRequest executeCodeRequest) {
        log.info("代码沙箱请求信息"+executeCodeRequest.toString());
        ExecuteCodeResponse executeCodeResponse = codeSandbox.executeCode(executeCodeRequest);
        log.info("代码沙箱响应信息"+executeCodeResponse.toString());
        return executeCodeResponse;
    }
}
