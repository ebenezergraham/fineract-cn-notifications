/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.apache.fineract.cn.notification.importer;

import org.apache.fineract.cn.notification.AbstractNotificationTest;
import org.apache.fineract.cn.notification.api.v1.domain.Template;
import org.apache.fineract.cn.notification.api.v1.events.NotificationEventConstants;
import org.apache.fineract.cn.notification.service.internal.importer.TemplateImporter;
import org.junit.Assert;
import org.junit.Test;

import java.io.IOException;
import java.net.URL;


public class TestTemplateImport extends AbstractNotificationTest {
	
	public TestTemplateImport() {
		super();
	}
	
	@Test
	public void testTemplateImportHappyCase() throws IOException, InterruptedException {
		final Template template = new Template();
		template.setTemplateIdentifier("test-sample");
		template.setSenderEmail("test@example.com");
		template.setSubject("Test");
		template.setMessage("Message");
		template.setUrl("test/url");
		
		notificationManager.createTemplate(template);
		Assert.assertTrue(eventRecorder.wait(NotificationEventConstants.POST_TEMPLATE, template.getTemplateIdentifier()));
		
		final TemplateImporter importer = new TemplateImporter(notificationManager, logger);
		final URL uri = ClassLoader.getSystemResource("importdata/test-templates.csv");
		importer.importCSV(uri);
		Assert.assertTrue(eventRecorder.wait(NotificationEventConstants.POST_TEMPLATE, "test_sample"));
	}
}
