package org.apache.fineract.cn.notification.service.internal.service.externalServiceClients;

import org.apache.fineract.cn.api.util.UserContextHolder;
import org.apache.fineract.cn.identity.api.v1.client.IdentityManager;
import org.apache.fineract.cn.identity.api.v1.domain.Authentication;
import org.apache.fineract.cn.lang.TenantContextHolder;
import org.apache.fineract.cn.notification.service.ServiceConstants;
import org.apache.fineract.cn.notification.service.internal.config.NotificationProperties;
import org.apache.fineract.cn.permittedfeignclient.service.ApplicationAccessTokenService;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.util.Base64Utils;

@Component
public class NotificationAuthentication {
  private Logger logger;
  private NotificationProperties notificationProperties;
  private IdentityManager identityManager;


  @Autowired
  public NotificationAuthentication(final NotificationProperties notificationPropertities,
                                    final IdentityManager identityManager,
                                    @Qualifier(ServiceConstants.LOGGER_NAME) final Logger logger) {
    this.logger = logger;
    this.notificationProperties = notificationPropertities;
    this.identityManager = identityManager;
  }

  public void authenticate(String tenant) {
    TenantContextHolder.clear();
    TenantContextHolder.setIdentifier(tenant);

    final Authentication authentication =
        this.identityManager.login(notificationProperties.getUser(), Base64Utils.encodeToString(notificationProperties.getPassword().getBytes()));
    UserContextHolder.clear();
    UserContextHolder.setAccessToken(notificationProperties.getUser(), authentication.getAccessToken());
  }
}
