package io.ballerinax.servicenow;

import io.ballerina.runtime.api.Environment;
import io.ballerina.runtime.api.Future;
import io.ballerina.runtime.api.PredefinedTypes;
import io.ballerina.runtime.api.async.Callback;
import io.ballerina.runtime.api.values.BError;
import io.ballerina.runtime.api.values.BMap;
import io.ballerina.runtime.api.values.BObject;
import io.ballerina.runtime.api.values.BString;
import io.ballerina.runtime.api.values.BTypedesc;

public class ReadOperationExecutor {
    public static Object create(Environment env, BObject client, BString tableName, BMap payload,
                                       Object sysparmDisplayValue, Object sysparmExcludeReferenceLink,
                                       Object sysparmFields, Object sysparmInputDisplayValue, Object sysparmView,
                                       Object accept, Object contentType, Object xNoResponseBody,
                                       BTypedesc targetType) {
        return invokeClientMethod(env, client, tableName, payload, sysparmDisplayValue, sysparmExcludeReferenceLink,
                sysparmFields, sysparmInputDisplayValue, sysparmView, accept, contentType, xNoResponseBody, targetType,
                "processCreate");
    }

    public static Object getById(Environment env, BObject client, BString tableName, BString sysId,
                                       Object sysparmDisplayValue, Object sysparmExcludeReferenceLink,
                                       Object sysparmFields, Object sysparmQueryNoDomain, Object sysparmView,
                                       Object accept, BTypedesc targetType) {
        return invokeClientMethod(env, client, tableName, sysId, sysparmDisplayValue, sysparmExcludeReferenceLink,
                sysparmFields, sysparmQueryNoDomain, sysparmView, accept, targetType,
                "processGetById");
    }

    public static Object update(Environment env, BObject client, BString tableName, BString sysId, BMap payload,
                                Object sysparmDisplayValue, Object sysparmExcludeReferenceLink, Object sysparmFields,
                                Object sysparmInputDisplayValue, Object sysparmQueryNoDomain, Object sysparmView,
                                Object accept, Object contentType, Object xNoResponseBody,
                                BTypedesc targetType) {
        return invokeClientMethod(env, client, tableName, sysId, payload, sysparmDisplayValue,
                sysparmExcludeReferenceLink, sysparmFields, sysparmInputDisplayValue, sysparmQueryNoDomain, sysparmView,
                accept, contentType, xNoResponseBody, targetType, "processUpdate");
    }

    public static Object patch(Environment env, BObject client, BString tableName, BString sysId, BMap payload,
                                Object sysparmDisplayValue, Object sysparmFields, Object sysparmInputDisplayValue,
                                Object sysparmQueryNoDomain, Object sysparmView, Object accept, Object contentType,
                                Object xNoResponseBody, BTypedesc targetType) {
        return invokeClientMethod(env, client, tableName, sysId, payload, sysparmDisplayValue,
                sysparmFields, sysparmInputDisplayValue, sysparmQueryNoDomain, sysparmView, accept, contentType,
                xNoResponseBody, targetType, "processPatch");
    }

    private static Object invokeClientMethod(Environment env, BObject client, BString tableName, BMap payload,
                                             Object sysparmDisplayValue, Object sysparmExcludeReferenceLink,
                                             Object sysparmFields, Object sysparmInputDisplayValue, Object sysparmView,
                                             Object accept, Object contentType, Object xNoResponseBody,
                                             BTypedesc targetType, String methodName) {
        Object[] paramFeed = new Object[25];
        paramFeed[0] = targetType;
        paramFeed[1] = true;
        paramFeed[2] = tableName;
        paramFeed[3] = true;
        paramFeed[4] = payload;
        paramFeed[5] = true;
        paramFeed[6] = sysparmDisplayValue;
        paramFeed[7] = true;
        paramFeed[8] = sysparmExcludeReferenceLink;
        paramFeed[9] = true;
        paramFeed[10] = sysparmFields;
        paramFeed[11] = true;
        paramFeed[12] = sysparmInputDisplayValue;
        paramFeed[13] = true;
        paramFeed[14] = sysparmView;
        paramFeed[15] = true;
        paramFeed[16] = accept;
        paramFeed[17] = true;
        paramFeed[18] = contentType;
        paramFeed[19] = true;
        paramFeed[20] = xNoResponseBody;
        paramFeed[21] = true;
        return invokeClientMethod(env, client, methodName, paramFeed);
    }

    private static Object invokeClientMethod(Environment env, BObject client, BString tableName, BString sysId,
                                             Object sysparmDisplayValue, Object sysparmExcludeReferenceLink,
                                             Object sysparmFields, Object sysparmQueryNoDomain, Object sysparmView,
                                             Object accept, BTypedesc targetType,String methodName) {
        Object[] paramFeed = new Object[25];
        paramFeed[0] = targetType;
        paramFeed[1] = true;
        paramFeed[2] = tableName;
        paramFeed[3] = true;
        paramFeed[4] = sysId;
        paramFeed[5] = true;
        paramFeed[6] = sysparmDisplayValue;
        paramFeed[7] = true;
        paramFeed[8] = sysparmExcludeReferenceLink;
        paramFeed[9] = true;
        paramFeed[10] = sysparmFields;
        paramFeed[11] = true;
        paramFeed[12] = sysparmQueryNoDomain;
        paramFeed[13] = true;
        paramFeed[14] = sysparmView;
        paramFeed[15] = true;
        paramFeed[16] = accept;
        paramFeed[17] = true;
        return invokeClientMethod(env, client, methodName, paramFeed);
    }

    private static Object invokeClientMethod(Environment env, BObject client, BString tableName, BString sysId,
                                             BMap payload, Object sysparmDisplayValue, Object sysparmFields,
                                             Object sysparmInputDisplayValue, Object sysparmQueryNoDomain,
                                             Object sysparmView, Object accept, Object contentType,
                                             Object xNoResponseBody, BTypedesc targetType, String methodName) {
        Object[] paramFeed = new Object[30];
        paramFeed[0] = targetType;
        paramFeed[1] = true;
        paramFeed[2] = tableName;
        paramFeed[3] = true;
        paramFeed[4] = sysId;
        paramFeed[5] = true;
        paramFeed[6] = payload;
        paramFeed[7] = true;
        paramFeed[8] = sysparmDisplayValue;
        paramFeed[9] = true;
        paramFeed[10] = sysparmFields;
        paramFeed[11] = true;
        paramFeed[12] = sysparmInputDisplayValue;
        paramFeed[13] = true;
        paramFeed[14] = sysparmQueryNoDomain;
        paramFeed[15] = true;
        paramFeed[16] = sysparmView;
        paramFeed[17] = true;
        paramFeed[18] = accept;
        paramFeed[19] = true;
        paramFeed[20] = contentType;
        paramFeed[21] = true;
        paramFeed[22] = xNoResponseBody;
        paramFeed[23] = true;
        return invokeClientMethod(env, client, methodName, paramFeed);
    }

    private static Object invokeClientMethod(Environment env, BObject client, BString tableName, BString sysId, BMap payload,
                                             Object sysparmDisplayValue, Object sysparmExcludeReferenceLink,
                                             Object sysparmFields, Object sysparmInputDisplayValue,
                                             Object sysparmQueryNoDomain, Object sysparmView, Object accept,
                                             Object contentType, Object xNoResponseBody, BTypedesc targetType,
                                             String methodName) {
        Object[] paramFeed = new Object[30];
        paramFeed[0] = targetType;
        paramFeed[1] = true;
        paramFeed[2] = tableName;
        paramFeed[3] = true;
        paramFeed[4] = sysId;
        paramFeed[5] = true;
        paramFeed[6] = payload;
        paramFeed[7] = true;
        paramFeed[8] = sysparmDisplayValue;
        paramFeed[9] = true;
        paramFeed[10] = sysparmExcludeReferenceLink;
        paramFeed[11] = true;
        paramFeed[12] = sysparmFields;
        paramFeed[13] = true;
        paramFeed[14] = sysparmInputDisplayValue;
        paramFeed[15] = true;
        paramFeed[16] = sysparmQueryNoDomain;
        paramFeed[17] = true;
        paramFeed[18] = sysparmView;
        paramFeed[19] = true;
        paramFeed[20] = accept;
        paramFeed[21] = true;
        paramFeed[22] = contentType;
        paramFeed[23] = true;
        paramFeed[24] = xNoResponseBody;
        paramFeed[25] = true;
        return invokeClientMethod(env, client, methodName, paramFeed);
    }

    private static Object invokeClientMethod(Environment env, BObject client, String methodName, Object[] paramFeed) {
        Future balFuture = env.markAsync();

        if (client.getType().isIsolated() && client.getType().isIsolated(methodName)) {
            env.getRuntime().invokeMethodAsyncConcurrently(client, methodName,
                    null, null, new Callback() {
                        @Override
                        public void notifySuccess(Object result) {
                            balFuture.complete(result);
                        }

                        @Override
                        public void notifyFailure(BError bError) {
                            balFuture.complete(bError);
                        }
                    }, null, PredefinedTypes.TYPE_NULL, paramFeed);
        } else {
            env.getRuntime().invokeMethodAsyncSequentially(client, methodName,
                    null, null, new Callback() {
                        @Override
                        public void notifySuccess(Object result) {
                            balFuture.complete(result);
                        }

                        @Override
                        public void notifyFailure(BError bError) {
                            balFuture.complete(bError);
                        }
                    }, null, PredefinedTypes.TYPE_NULL, paramFeed);
        }
        return null;
    }
}
