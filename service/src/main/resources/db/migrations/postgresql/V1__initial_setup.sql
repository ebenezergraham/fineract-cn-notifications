--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--   http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations
-- under the License.
--

-- -----------------------------------------------------
-- Table wada_sms_gateway_configurations
-- -----------------------------------------------------
CREATE TABLE wada_sms_gateway_configurations (
  id SMALLSERIAL PRIMARY KEY,
  identifier VARCHAR(45) NULL DEFAULT NULL,
  account_sid VARCHAR(255) NOT NULL,
  auth_token VARCHAR(255) NOT NULL,
  sender_number VARCHAR(45) NOT NULL,
  state VARCHAR(20) NULL DEFAULT NULL);

-- -----------------------------------------------------
-- Table wada_email_gateway_configurations
-- -----------------------------------------------------
CREATE TABLE wada_email_gateway_configurations (
  id SMALLSERIAL PRIMARY KEY,
  identifier VARCHAR(45) NULL DEFAULT NULL,
  host VARCHAR(45) NOT NULL,
  port VARCHAR(45) NOT NULL,
  username VARCHAR(45) NOT NULL,
  app_password VARCHAR(255) NOT NULL,
  protocol VARCHAR(45)NOT NULL,
  smtp_auth VARCHAR (45)NOT NULL,
  start_tls VARCHAR (45)NOT NULL,
  state VARCHAR(10)NOT NULL);

-- -----------------------------------------------------
-- Table wada_templates
-- -----------------------------------------------------
CREATE TABLE wada_templates (
  id SERIAL PRIMARY KEY,
  template_identifier VARCHAR(45) NULL DEFAULT NULL,
  sender_email VARCHAR(255) NULL DEFAULT NULL,
  subject VARCHAR(255) NULL DEFAULT NULL,
  message VARCHAR(1024) NULL DEFAULT NULL,
  url VARCHAR(255) NOT NULL);

INSERT INTO wada_sms_gateway_configurations VALUES ('1', 'DEFAULT', 'ACdc00866577a42133e16d98456ad15592', '0b2f78b1c083eb71599d014d1af5748e', '+12055486680', 'ACTIVE');
INSERT INTO wada_email_gateway_configurations VALUES ('1', 'DEFAULT', 'smtp.gmail.com', '587','fineractcnnotificationdemo@gmail.com', 'pnuugpwmcibipdpw', 'smtp', 'true', 'true', 'ACTIVE');

/*Insert default template for supported events*/
INSERT INTO wada_templates VALUES ('1','customerCreatedEvent','DEFAULT','Account created','Your account has been created','template');
INSERT INTO wada_templates VALUES ('2','customerUpdatedEvents','DEFAULT','Account updated','Your account has been Updated','template');
INSERT INTO wada_templates VALUES ('3','customerActivatedEvent','DEFAULT','Account Activated','Your account has been Activated','template');
INSERT INTO wada_templates VALUES ('4','customerLockedEvent','DEFAULT','Account Locked','Your account has been Locked','template');
INSERT INTO wada_templates VALUES ('5','customerUnlockedEvent','DEFAULT','Account unlocked','Your account has been Unlocked','template');
INSERT INTO wada_templates VALUES ('6','customerClosedEvent','DEFAULT','Account closed successfully','Your account has been Closed','template');
INSERT INTO wada_templates VALUES ('7','customerReopenedEvent','DEFAULT','Account Reopened','Your account has been reopened','template');
INSERT INTO wada_templates VALUES ('8','contactDetailsChangedEvent','DEFAULT','Contact details has been updated','Your contact has been changed successfully','template');
INSERT INTO wada_templates VALUES ('9','addressChangedEvent','DEFAULT','Residence address has been changed','Your address has been changed successfully','template');

INSERT INTO wada_templates VALUES ('10','sample','DEFAULT','Test Subject','Talk is cheap! Show me the code','template');
