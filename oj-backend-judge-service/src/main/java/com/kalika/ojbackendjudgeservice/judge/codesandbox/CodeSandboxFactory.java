package com.kalika.ojbackendjudgeservice.judge.codesandbox;

/**
 * @Author 倪彤
 * @Date 2023/12/27 21:07
 * @Version 1.0
 */

import com.kalika.ojbackendjudgeservice.judge.codesandbox.impl.ExampleCodeSandbox;
import com.kalika.ojbackendjudgeservice.judge.codesandbox.impl.RemoteCodeSandbox;
import com.kalika.ojbackendjudgeservice.judge.codesandbox.impl.ThirdPartyCodeSandbox;

/**
 * 静态代码沙盒工厂（根据字符串参数创建指定的代码沙箱实例）
 */
public class CodeSandboxFactory {
    public static CodeSandbox newInstance(String type) {
        switch (type) {
            case "example":
                return new ExampleCodeSandbox();
            case "remote":
                return new RemoteCodeSandbox();
            case "thirdParty":
                return new ThirdPartyCodeSandbox();
            default:
                return new ExampleCodeSandbox();
        }

    }
}
