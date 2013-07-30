/*
SQLyog Community Edition- MySQL GUI v5.21 Beta 1
Host - 5.5.27 : Database - ctsmsdb
*********************************************************************
Server version : 5.5.27
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `ctsmsdb`;

USE `ctsmsdb`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('2',1,'leave.bpmn20.xml','1','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.kafeitu.me/demo/activiti/leave\">\n  <process id=\"leave\" name=\"请假流程\" isExecutable=\"true\">\n    <documentation>请假流程演示</documentation>\n    <startEvent id=\"startevent1\" name=\"Start\" activiti:initiator=\"applyUserId\"></startEvent>\n    <userTask id=\"deptLeaderAudit\" name=\"部门领导审批\" activiti:candidateGroups=\"deptLeader\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway5\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"modifyApply\" name=\"调整申请\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${leaveModifyProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <userTask id=\"hrAudit\" name=\"人事审批\" activiti:candidateGroups=\"hr\"></userTask>\n    <exclusiveGateway id=\"exclusivegateway6\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <userTask id=\"reportBack\" name=\"销假\" activiti:assignee=\"${applyUserId}\">\n      <extensionElements>\n        <activiti:taskListener event=\"complete\" delegateExpression=\"${leaveReportProcessor}\"></activiti:taskListener>\n      </extensionElements>\n    </userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway7\" name=\"Exclusive Gateway\"></exclusiveGateway>\n    <sequenceFlow id=\"flow2\" sourceRef=\"startevent1\" targetRef=\"deptLeaderAudit\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" sourceRef=\"deptLeaderAudit\" targetRef=\"exclusivegateway5\"></sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"不同意\" sourceRef=\"exclusivegateway5\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"同意\" sourceRef=\"exclusivegateway5\" targetRef=\"hrAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${deptLeaderPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" sourceRef=\"hrAudit\" targetRef=\"exclusivegateway6\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" name=\"同意\" sourceRef=\"exclusivegateway6\" targetRef=\"reportBack\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"reportBack\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" name=\"不同意\" sourceRef=\"exclusivegateway6\" targetRef=\"modifyApply\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!hrPass}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"重新申请\" sourceRef=\"exclusivegateway7\" targetRef=\"deptLeaderAudit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${reApply}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow11\" sourceRef=\"modifyApply\" targetRef=\"exclusivegateway7\"></sequenceFlow>\n    <sequenceFlow id=\"flow12\" name=\"结束流程\" sourceRef=\"exclusivegateway7\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${!reApply}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\n    <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"10.0\" y=\"90.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"deptLeaderAudit\" id=\"BPMNShape_deptLeaderAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"90.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway5\" id=\"BPMNShape_exclusivegateway5\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modifyApply\" id=\"BPMNShape_modifyApply\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"218.0\" y=\"190.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"hrAudit\" id=\"BPMNShape_hrAudit\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"358.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway6\" id=\"BPMNShape_exclusivegateway6\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"495.0\" y=\"87.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"reportBack\" id=\"BPMNShape_reportBack\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"590.0\" y=\"80.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"625.0\" y=\"283.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway7\" id=\"BPMNShape_exclusivegateway7\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"250.0\" y=\"280.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"45.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"90.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"195.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"250.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"270.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"190.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"290.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"358.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-24.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"463.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"495.0\" y=\"107.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"535.0\" y=\"107.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"590.0\" y=\"107.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"-22.0\" y=\"-17.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"642.0\" y=\"135.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"642.0\" y=\"283.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"515.0\" y=\"127.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"514.0\" y=\"217.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"323.0\" y=\"217.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"250.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"299.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"142.0\" y=\"135.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow11\" id=\"BPMNEdge_flow11\">\n        <omgdi:waypoint x=\"270.0\" y=\"245.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"270.0\" y=\"280.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow12\" id=\"BPMNEdge_flow12\">\n        <omgdi:waypoint x=\"290.0\" y=\"300.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"625.0\" y=\"300.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"10.0\" y=\"0.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('3',1,'leave.png','1','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0<\0\0�\0\0\0�4#\0\01�IDATx���l��}p:�m&�a\r�beH�k���f������,�X�[B`A���@�DA������hX�	Ú�]j�[��q(���i�����j�#˱�0�ӱ�2��гd�%Jz���\\���9�������x��}���~�ϗGލ%\0\0\06{\0\0\0�Ѵ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-=T�Յ�����ݻwW*���J�=�����������ا�q�ԸF�E�ֈ[ /4-�=z4M�iU�뮻�ﾧO�:��^Α{:G�ٻwo:\'iy�}r�׈k$�ĭ�rG���������={�{��������K/��-������\'�h\\#��<���)MKiU������/�_?gt\Z�|힝;w����>]D�\Zq�䑸�@~iZژ��ݨj��ǽ�}���a��E��H�[q䗦��ѣG�������2~�w��w�^��H�F\\#y$n�-�k��7�V��J��V�/�f��3g�c�����c�:F�5�\Z�#q+n��Ӵ����������W�㖩�Ƒ��*ո�777��1\"��H�[q䝦�M����������}p�_\'ɳ��֓�K;�<r�������/������V������&�x=����ԾOG�1Q�w�����}ꆫ��C>� q��\Z)Cx����-P6��7���8y���gkcll�L�����|!�����$�����coyǮN���<w.y��d��<}!�ӿzl�rgK8Μ==>>��\rQ����替r���ݻ����\Z)�5R����[��дT��������OOO�����������|U�m۶�t���gj#�U�^L�]����.��g_�?�����߿�$�\\H^^O~���G�����Q�Δs����\rOmI��w��_���[�]�H���򄷸-R�崥|��*is2>>��+i�r�������ڸ�k_������̤�b׮]y��ݍ��J}��={!9�Zr��H+�������s?���[뗒����<���R����%]mddaq�]#��F��#�q[��Jk���ĉimK{��9��N��ܻ�㓓�KKK����(N��>.��ɋ�&?9��\'��s�&n�il�ʱ����O|���M�-�(dak]�\roa���{>f�{����\\#C\r�Ƴ�-F�e��|t�������o�lW�jaZ#���W�V~��Q�^����_!8�Z��W����<r��_��o��m������T�����j��uZ�\r�o�2�M_j�o�iw��\Zvxg0��m�(���Q�o�������ծ4�?��δ����x�h�8��G���.%?�^�i܋�\'�=������������?�o�z��9��z���?�p�sK5\nVغ/�ѷ�&�폜;}i?���\\_##�Ƴ��{����Ҏe׮]��X�-�ngeeeh�yi��p���Q��im{y=����ǯ�?��ʎ������s�O��O���sIZ�����j���,�޷�d��a��y�H���фw�Y��:n��������w,�r��-�=����������y|�؉��/?��~��_<���z��o������?8�ؓ�?��;�������Faۢ�%�`���?��?,�k,�}p���\ZYxg0��m~��&48p`+��:��{zzz�Ƕ	��g��7�����?��G��X�Q����n�}K�z�흣��t\'���^#��Ƴ��i���\'NLNN�c��O}�Ӈ\Z��e���6�(l�[�\r�o	_���7���F��<���Ȉ�;��,n��\0���Qڱl��u�=�7V2�Kb��ŗ�~G�[�}���&�>u�m����;v|���A�-��\\����F�p�Hчw�Y��.n���G�������Xj㳟����8m��~G�[�%���xzPiSݺ��-�j��A�-]&����5_��p���\Z���gq���h�;���ߏd��Ŗ�۷��8m��\Z����.K����]�n�}�&y]�*�H���X��x�9�[��z䣴>m۶mHKm�ܹ�رc�9ڞ6\n�O�~GN[��3g�.��wZ���%]*]�����N�3���j�v��Ӈ�5��k$bxg0��m^����h~~~vvv�M��cnnn4G[�����Sb6\n۪���Za�r��:�irzOڨ�.�?�h�%�=_�z����Q�F�|��N�m��`�z�}��:th�M˽�}3-��9�ԓO>Y���^{�#G������u?�5��L����ꫯY�eaדk$�׈��D�f9n��G>����T�5�>u��+�9�T�Z}�[�R�mW]u�{��Ɵ�m��6��*l�Oq���mv�K�,/�B�F�|��N�m��`�z�!��q�x��ٴ@��hk�~��mo{�\'>��;/���x��F�#k���)���.��K��.��F�|��N�m��`�z䣴4��F������~�t��F�c,Kg��tI�nx���W^ye����Ç�$p��~����oyc#�F�w�c �cL�dF�|411��ɓ#hZFs�5�]w]��MoH����r��O�7�Y+l]N�\'҅݋/���m�L���\\��B�}��{>��\Z��5\"�;�Y�[�-ꑏ��!-�1�iY[[������\'?�����P��Fa{n���_��󿠍tzz�FB��q�u����)N�v]�t��.�\r�\Z�մ��<�Gy��N��mx�ݙ�{8��غ�hvv���ņ1����;w��hS�>�������T�R���k��썲�FK�������n�n��F��B�n���\'adg����®��+�_�epIn���&©��6�c��(���I���r����%�s�=`�l]�|t����~���ڴ�M�޽���aqqq~~�����<��jzp�SZ��\ZܱA�޲Vغ��N�N�����Km?�ua��%]_�}�^}�p���5\"�;��!�ܘ�[C7�\n�~�G~\Z�둏��_�T�ڴ�ٳ��ѣ�9ڞ6�ó}�Ƨ�n��i����i��~w������v��7�}�6�ua�iIW{3�N�׸���n 6![�ۦ�m=��y��F#�ۭDxc@6}5��4���;\r�o�_9s6-����̂����J�����s���t��s�n�Y�o��q#��}�=g ��ۤօ�޽o����օ]�u�a��%]�MI���%�3{���m�������<8ʞG�[��z磡�������Gp��6��3�����Mu�lӗ�����N�1�]�K�61r]غ,��~`E�®0K�p[���X�t���X��kDx�����Q����;���h�;U��J�2�OkI��7VVWWGp��6j��8�i����-+�����;/�����=���Oݖ�]�u����®HK�p�Fz^>=�KS<Ǎ��_#�;~܆�j��l*M���q��IP>ZXX�護�e���v���R�N�7�z�������o�\Z���v}?�0pb���j]�u�X�\'N�,Ғ.�C�g u	��\"����=�S�鼷���a�%b��y��Qh>�Ї?|����XҢ�cǎ�.����Q��k4>�v�~O��Oo}Jӿ�mOwX���}\'!�����k�X҅�b��{5���(�k���=�S�3V�����88��\0u��hmmm�Ν����ڛ�<}��P�m6��S}�Ƨ�n7�6�����s;m<�N߷����\'!���~v�Y҅�\\��{)u���\rI����5R��ޙ\r�.�)�G����-@M�hyy9�[�Lr`!�Ї?|�׾>��ڴ�5-M���N��ڶ}u)�߷�R6}��7-I?�\"-��\ri�3Vï������҆wܦ�g2o}@���~�c�:�7�����cǎ�xp��\'O��O6;�d��]��d_��)�ۭi��z������\r�B��m�]�o��$�>u���+ؒ.��\"$�\"\n�j`��,��u��3��wf��5�7}���?���}�\0��w>Z[[K����ߍ~������k�c6�#������Q���}aW�%]8�H�����-@�%��|T�VӦ妛&�&��3��WN����vZ~�Qؖ�~G![��]!�t�\\#ŸF���q��������m�ݶm۶}��iO����=w��?>z��c��������v{X6\n���~GQ[�®�K�p���\\#�\noq[��Jk���Z�...����رc���{Ҏeaaammm �:��㯽��K�3�\Z.l��/�¹F�t��\'��m��(\'��M*��3����K\'��F�[ma���S^҅s��\Z)Ix�ۂ�-PB�ћLMM�.%O����611��\rW��K=^҅s��\Z�Ї>T���ŋ[�l4-or�����OD/�\Z2�����اn��p�!\\#ŻF���tq[��ʦ���/+++��Z��K��F�������b�S7teX؅p��\Z)Cl����-P6ůU��پK�w���?����T�6\neX�r��\Z)Il�ۂ�-P6��U}�V��w���c�=I3�����&&~em���\'mJ���\Z)�5R����[�lJQ�����<9y���b��0:����+���/�>]#R��] �H����Ķ�-R�eS�Zկcǎ������$�\Z�cq�����\Z�D�Nyv�\\#��FJ��0q�M�jU��������������H�����_.,����=�ӻ�۱O�H�ja�5R�k�l�-n��@ٔ�Vm������?ݾ�o�16�m۵33Lk[���X�v�\\#��x���2��m�<�-P6e�U9����\Z+�2�q��\0!Ԫ|x衇҅���Z�)/;�Jl�e�Bȕ�p�\r7���~�b�HyYXPTb;.�B�́?��?�������\'N�ޝ������v\\� �\\�ukkk��㵦�ꫯ~���{�J���q��re�MOO7���\r7�0??{�����q��re������7����j�\Z{�J���q��re�}��_�5*�}�{�M˯�گ---�޵ұ����v\\� �\\�i������wT*�m۶��m��w�󝚖ѳ����v\\� �\\�u\'N�XYYI~Q����@,\n�Jl�e�Bȕ����e�)*���!W�������v\\� �\\�\n[\\柢�q��ren(lq��Jl�e�Bȕ����e�)*���!W�������v\\� �\\�\n[\\柢�q��ren(lq��Jl�e�Bȕ����e�)*���!W�������v\\� �\\�\n[\\柢�q��ren(lq��Jl�e�Bȕ����e�)*���!W�������v\\� �\\�\n[\\Q��Ig�Y\\� �\\�\n[\\�������|���RZq��ren(lq�;�m�e#M_j��S�P	���?@�27��ش�}	�ӗ��°����?@�27�����N|���a�>�#��2�\0!���P��\n���OZ7�啖�-x���]q��ren(lq�S��/Uz��FIt�e�Bȕ����2�m{���!M�WZ���!W��W��o�+ڶ%IC�����)�0�����+sCa�kd����\0C\"��2�\0!���P��մt�B\\�e�Bȕ����5��%�=���$��2�\0!���P��2��؎����+sCa���STb;.�B��\r�-.�OQ���?@�27���?E%��2�\0!���P��2��؎����+sCa���STb;.�B��\r�-.�OQ���?@�27���?E%��2�\0!���P��2��؎����+sCa���STb;.�B��\r�m��i���Lol߾=���o���r�]���[�2�\0!���P�F�_��X�[n�eqq1�����-q��ren(l�W�V���Ǝ�}�{�������b�\Z����!W����>���������3�����\\읂A�[�2�\0!���P�b����k˭��Z�T��j�=�A�[�2�\0!���P�b�ַ�u�UW��?55�Y(�%.�B��\r�-�|���%�����-q��ren(l�����)$�%.�B��\r�-.�OQ���?@�27�Yت���������ݻ+�J맦�Dz��LOO���{�ek���%;�?@�27JX؎=�.�ӎ宻�����>u���z9Gz��9rd�޽霤�K�Cq�0�d��!W�F�\n�������={�{��������K/��K:9����OEP�ܒA� �\\��)li�299���_>�~��4���=;w�\\YY�}�Ƚ��l2�\0!���(Oa�����X^7��{����7��ا��+On�&�B�̍���G������U#d�����;����\'�|+In�,�B�̍2�j�Z�T�ae��kF�8s��;v��Ȱe�-Yf�Bȕ�Q��6???;;�~����e��)p�J5�������>u�XrK���ren���MOO���M���=�$�^L�ZO�w.y�\\�ș��柿��C��[M�&���|�����S�>��2�s����d�SG��!�d��!W�F\n����ɓ��_8[�!�I�����/$?;���$��_~�-�����֓��%Ͻ��T��/$�W�m��r���������O9V�ܒe� �\\�e(l۶m{�����Fzȯ^L�]����.��g_�?�����߿�$�\\H^^O~���%�7��F�r����������?@�27�P�6\Z�W�#�����ג��x����������s?����뗒��̃�y�鹥\Ze�\r�G��e�Bȕ�Q�¶�x����ܴ\\L^|5�əd=IΟ;7q�MccW�����m|�#�mzn�Fb��?q��ren���m4/�G���N�����䧯\'������_�[�~�u�4�75-�x�sK5��������+s��m��X�����]J~V��Jˋ�\'�=������������?�o�z��9��z���?�p�sK5��������c�E��~Bȕ�Q��?���!�}������\'?~e���Wv��_���㟞K~RM~ZMN�KҶ���nzn�Fb�!YYY�T*����\\�\0!���(Cakj<v�r�w���#�/;�����}��������W�?��O~��x��{��~t�9��[?\Z�yд�;G���������!W�F\n�F������\0��#izb�Fb�!ٿ!�^��� �\\�e(lM�i��Q��`H����=\Z{/J��B�̍2��M�ŗ�~Gb�aX]]�T*�j5����� �\\�e(lMˋF����0<x��n��e��!W�F\n�F��S��Q��`��j�RY]]��#e��!W�F\n�F����Q��`�fgg���c����\0[\'W�F\n�FӲj�;:��������h�!�p���}����.+Cn�:�27�P�4-iZ���>������]�z���F�juvvVǒe��\0[\'W�F\n�F���F��16:4>>^�X�۷o�GԤ����+���\n˔2�v���+s��-=Ƌl�;j�������������k׮t�\Z�����ҁ����`���4�YS���uren���m4-/��t�v��=�177�����������v���+s��m�r���������o��o��/�r}�z��NNN�>�DV�ԑkN@�27�P�6���;\Z�����]��.w��~��=z��o|���];�k�����E��LB��1����ren���m,�4�Q�l��k���d~���N��`���\0�1�R����\r7LNN���8q\"�	e��^�]RAӗ\Z�[��SN\r@�27�P؆���Խ4�hl9Z��.?����}\\�����2??���8��ȠtiZھ���K��$;��ren���m,�ިm���x��[��g�x����m�b�:��i�r�Ǻ��\"N��y!W�F\n�������7\Z�_��t��Ȧ{�6��v��[�0�Q��(��O���t}��q��!k��ren���m,���o��2��1�����ƍ4>���~��O��ԁ4�߶�Lۦ��f�\Z� �\\�e(l��|�7ۺ��=�h|d�;C��[�\0c�:�m��z;�ii5�=gs��ren���m��O\r|�7[���G�=�_!y�vBnw�Ȑ0��c\0����mI�П�6$m#Axd�B�̍2��������n������w�j������>u^����t�66m�\'S��ren���m��\Z��E_�T�ߦ{�k||�Úr�]c3�C��ا��`���N�sF\0Bȕ�Q��6�������o�o�{����:�i���Mhꜻl�X��ren�����x�ғC\ZM�/�\Zow�sk��7>��Fxh�O�I�_�ren���m��`�;�PT�_�ren���m4-�F���E��!W�F\n�F��}��Q�؀�r���+s��m||����t�{F_��E��!W�F\n[�Ry�?�t���(Cl@Q�~Bȕ�Q��655�����<a���/����D�SlRr;��ɕ�Q��v�����ODo�5�d�����O�Ie��\0[\'W�F\n�����į�V}�R�8��?������T���uren����lߥ�F����aff*�I6�$�`����(Ia�V��w���c�=I3�����&&~em���\'\rؼ��v�-�+s�<�myyyr����$9at\ZiǒvwKK_�}��-)On�\n�27JU؎;��-��$y�h��_���,-���\'\nتR�v�M�+s�l��Z��������������$9n�����¿���3=�;��P���9ren���---��������cc۶];3���o�}Z��+en�\\�\n[\\>� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\�\n[\\�� �\\����!��ʝE-�額��ONN�7�oߞ�����}yy9��Q��	0Xren�,lco�����r�X}U�}��_m=�[n�eqq1��Q��	0<ren�U����e�~����j�z�5�4�������۷�����5 Ǽ�Яb�5�{cХ�h�7\Z7R���7�t������2�s���[�����}�3������S@�y�_E[bX�~ ��h�UB\Z��ۭ�I�z�F�_}�o���J�R�Vc��o^��W�ךҴ�|������[zn��Y�V��ַ�������������h��iZz���Ր綽]��\\>��Ԛ��;�Wq�s�YH[���1� ��b��R�������ȫ�\0ኹ�,�������JKH����iI\n}h@,^�d��z��˿���+-5kkk����F,��*�����JK��#�^0��M�~�ls;�i�r��7���ݻw�[��*d�8�27z��WwM�L:���M�v;�|��ֱ<����/���[�-�V���������SSS�=��󫫫�w ����,���q�-3b�Km�[�MK{��Q��3����C�I�\0�4-�Q�TVVVb�E��v,�`s���v��ճ]i��|o)P�iɍ���\'N�ދ��Ա�[��T�������R~�w~�ȑ����q��߳gO�#����\Z�DӒ#�*yii)�^�B��E�Z]]mz�峟��O��[^|���y����_r�+\0MKn�������ދ��X�-@O+++i�Q�=�����+M���������cǎ�> ��4-��v,i�{/\n.�cѷ\0]T����X�p��Y�q�u��Hە��-�X(3MKn,//OLL�ދ\"�cѷ\0�����;�#G��D�R�0۶m�m\'M5� \ZMK��[���\\ǢoZ-..n�5��q�׾^����c@��<I��m��{/\n��cIW	7�4���_|��;�r���h599Y�;�-v,�Q����۷����4-y��*��<pm;����xc��o�u,���h���P����a M�+g���Ȍ��rҴ���Ғ_k�.KMS��ر�[�Vi����@:��HSMm�۶m�}�\0hZ�g���~�6�K�3[��֎�����(��گ\'�A��Ri.�m�gv%�iɥ�����)+���������ط�Ѷ�=_�z��-P`+++m�4??_Kilǒ�O}�ӵ��%`�G��%��=Z�T����O\\6��{���[���ꐎE����O�2���^{�ȑ���۷��խ�iX���o�6�k׮(���%��5qڴ�����Tz�/\nyw�}K`Ǣo��V�oy�[jyફ�z�{����K��k_�67�>u���4�Ǜ\0�84-��VУG��MK��?�\"��X��-=;}X�_���mo��\'>Q{\'���o�C�z��7�=\0�&�Q.i�r�}�\\���_^y�M�W\\q���:��\r�l�����3�>�i����ة`�$>��ĉi���K�{.ھWXM��oi���]I�c�&�����W����.�}�)����7����8�!�җ���/MLL�����a4-�7d�=\0�&�Q:!}K��%�oѱ�S�����[��};�_��݄��\Z���\'?���߅���W�/����>ҬR۸�jJHŢ���-m;�+��\"�oѱ�ScѶ!�����wilZ�]�m�ų�>;>>>55U�T����hmvv�6�t�oZ�8y������X���EIu�[:}����/����־E�BO�-D�V�{��;���-..��Ϸ����&v�ޏ�i��w�6>333��LŢ�Z��NK��:}�dcߢc!D۞�m���v�;�v)[�mzZ^^�Mu�+^9sv�MK��jO[��\n0jj��ڷ����Km��-{��/Mt,���=ow�B�Muz\0�R�Tjs{����X��2����`�T,ʮK����X\Z���0tjE:53��E_�b����j��cǎ���������؇�����.� Y�[t,lZS���Տ�F�J���X�����Y[[����c ��<X�y(\'u.k�[���\'O�X�t�FB�ڮto�غ��_���{?}�T�ڷo_��Cł7��d�б�i�/�$�^$�t����[�N�e�v��U;�i��Y���+g���$����j�#�C݂��oߢcasZ�¤�Տ�Ǵ>�SK�i�nee���oi�����N��_�w,���KKK� \Zu�$�oѱ0(�=�����޶�kg�;O\'i�Q������&����o��<��\0bR��YHߢczZ\\\\l|��;vtz{��X>z뭍���@�mt�[t,@���剉��$m]n���O�<�ګ�ѝw�ٳ���i���\0Mtҩoѱ\0}Y[[ۿ���x�_�۹sg�/�����{�\ZMt�ڷ�X��Iۏ��ٶ�I�4�;v,�.d���i�[t,�U�Յ���{���ljT*������C����J�=����O�ұ\0\0D�i���^�R��X\0\0�д\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0��i\0\02M�\0\0d��\0\0�4M\0\0�i�\0\0 �4-\0\0@�iZ\0\0�LӴ\0\0\0���m&G��]@\0\0\0\0IEND�B`�',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','101',2),('schema.history','create(5.12)',1),('schema.version','5.12',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`) values ('24','leave:1:4','20','20','startevent1',NULL,NULL,'Start','startEvent',NULL,'2013-06-26 17:20:49','2013-06-26 17:20:50',9),('25','leave:1:4','20','20','deptLeaderAudit','26',NULL,'部门领导审批','userTask','2','2013-06-26 17:20:50','2013-06-26 17:21:04',14663),('30','leave:1:4','20','20','exclusivegateway5',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2013-06-26 17:21:04','2013-06-26 17:21:04',0),('31','leave:1:4','20','20','hrAudit','32',NULL,'人事审批','userTask',NULL,'2013-06-26 17:21:04',NULL,NULL);

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

insert  into `act_hi_detail`(`ID_`,`TYPE_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`ACT_INST_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`TIME_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('22','VariableUpdate','20','20',NULL,NULL,'applyUserId','string',0,'2013-06-26 17:20:49',NULL,NULL,NULL,'2',NULL),('29','VariableUpdate','20','20',NULL,'25','deptLeaderPass','boolean',0,'2013-06-26 17:21:04',NULL,NULL,1,NULL,NULL);

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  UNIQUE KEY `ACT_UNIQ_HI_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`) values ('20','20','1','leave:1:4','2013-06-26 17:20:49',NULL,NULL,'2','startevent1',NULL,NULL,NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`) values ('26','leave:1:4','deptLeaderAudit','20','20','部门领导审批',NULL,NULL,NULL,'2','2013-06-26 17:20:50','2013-06-26 17:20:58','2013-06-26 17:21:04',14661,'completed',50,NULL,NULL),('32','leave:1:4','hrAudit','20','20','人事审批',NULL,NULL,NULL,NULL,'2013-06-26 17:21:04',NULL,NULL,NULL,NULL,50,NULL,NULL);

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('21','20','20',NULL,'applyUserId','string',0,NULL,NULL,NULL,'2',NULL),('28','20','20',NULL,'deptLeaderPass','boolean',0,NULL,NULL,1,NULL,NULL);

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('c',1,'本公司管理员','assignment'),('d',1,'部门管理员','assignment'),('departAdmin',1,'部门管理员','assignment'),('deptLeader',1,'系统管理员','assignment'),('e',1,'本部门管理员','assignment'),('f',1,'普通用户','assignment'),('g',1,'山东省管理员','assignment'),('hr',1,'公司管理员','assignment');

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('1','deptLeader'),('10','hr'),('11','c'),('12','d'),('13','e'),('14','f'),('2','deptLeader'),('3','hr'),('4','c'),('5','d'),('6','e'),('7','g'),('7','hr'),('8','hr'),('9','deptLeader');

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('1',1,'Thinkgem','','thinkgem@163.com','',NULL),('10',1,'山东省分公司技术部','','thinkgem@163.com','',NULL),('11',1,'济分公司领导','','thinkgem@163.com','',NULL),('12',1,'济分历城领导','','thinkgem@163.com','',NULL),('13',1,'济分历下领导','','thinkgem@163.com','',NULL),('14',1,'济分历下综合部','','thinkgem@163.com','',NULL),('2',1,'管理员','','thinkgem@163.com','',NULL),('3',1,'综合部','','thinkgem@163.com','',NULL),('4',1,'市场部','','thinkgem@163.com','',NULL),('5',1,'技术部','','thinkgem@163.com','',NULL),('6',1,'研发部','','thinkgem@163.com','',NULL),('7',1,'山分领导','','thinkgem@163.com','',NULL),('8',1,'山分综合部','','thinkgem@163.com','',NULL),('9',1,'山分市场部','','thinkgem@163.com','',NULL);

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`DEPLOY_TIME_`) values ('1','SpringAutoDeployment',NULL,'2013-06-26 17:17:02');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`SUSPENSION_STATE_`) values ('leave:1:4',1,'http://www.kafeitu.me/demo/activiti/leave','请假流程','leave',1,'1','leave.bpmn20.xml','leave.png','请假流程演示',0,1);

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_RU_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`) values ('20',2,'20','1',NULL,'leave:1:4',NULL,'hrAudit',1,0,1,0,1,2);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('23',1,NULL,'starter','2',NULL,'20',NULL),('33',1,'hr','candidate',NULL,'32',NULL,NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`SUSPENSION_STATE_`) values ('32',1,'20','20','leave:1:4','人事审批',NULL,NULL,'hrAudit',NULL,NULL,NULL,50,'2013-06-26 17:21:04',NULL,1);

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('21',1,'string','applyUserId','20','20',NULL,NULL,NULL,NULL,'2',NULL),('28',1,'boolean','deptLeaderPass','20','20',NULL,NULL,NULL,1,NULL,NULL);

/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `category_id` bigint(20) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色（red：红色；green：绿色；blue：蓝色；yellow：黄色；orange：橙色）',
  `image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限，过期后将权重设置为：0',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) DEFAULT NULL COMMENT '推荐位，多选（1：首页焦点图；2：栏目页文章推荐；）',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='文章表';

/*Data for the table `cms_article` */

insert  into `cms_article`(`id`,`category_id`,`title`,`color`,`image`,`keywords`,`description`,`weight`,`weight_date`,`hits`,`posid`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,3,'文章标题标题标题标题','green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,3,'文章标题标题标题标题','red',NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,3,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,3,'文章标题标题标题标题','green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,3,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,3,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,4,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,4,'文章标题标题标题标题','blue',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,4,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,4,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,5,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,5,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,5,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,7,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(15,7,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(16,7,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(17,7,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(18,8,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(19,8,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(20,8,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(21,8,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(22,9,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(23,9,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(24,9,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(25,9,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(26,9,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(27,11,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(28,11,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(29,11,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(30,11,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(31,11,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(32,12,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(33,12,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(34,12,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(35,12,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(36,12,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(37,13,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(38,13,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(39,13,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(40,13,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(41,14,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(42,14,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(43,14,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(44,14,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(45,14,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(46,15,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(47,15,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(48,15,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(49,16,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(50,17,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(51,17,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(52,26,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(53,26,'文章标题标题标题标题',NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_article_data` */

DROP TABLE IF EXISTS `cms_article_data`;

CREATE TABLE `cms_article_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `content` text COMMENT '文章内容',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='文章详表';

/*Data for the table `cms_article_data` */

insert  into `cms_article_data`(`id`,`content`,`copyfrom`,`relation`,`allow_comment`) values (1,'文章内容内容内容内容','来源','1,2,3','1'),(2,'文章内容内容内容内容','来源','1,2,3','1'),(3,'文章内容内容内容内容','来源','1,2,3','1'),(4,'文章内容内容内容内容','来源','1,2,3','1'),(5,'文章内容内容内容内容','来源','1,2,3','1'),(6,'文章内容内容内容内容','来源','1,2,3','1'),(7,'文章内容内容内容内容','来源','1,2,3','1'),(8,'文章内容内容内容内容','来源','1,2,3','1'),(9,'文章内容内容内容内容','来源','1,2,3','1'),(10,'文章内容内容内容内容','来源','1,2,3','1'),(11,'文章内容内容内容内容','来源','1,2,3','1'),(12,'文章内容内容内容内容','来源','1,2,3','1'),(13,'文章内容内容内容内容','来源','1,2,3','1'),(14,'文章内容内容内容内容','来源','1,2,3','1'),(15,'文章内容内容内容内容','来源','1,2,3','1'),(16,'文章内容内容内容内容','来源','1,2,3','1'),(17,'文章内容内容内容内容','来源','1,2,3','1'),(18,'文章内容内容内容内容','来源','1,2,3','1'),(19,'文章内容内容内容内容','来源','1,2,3','1'),(20,'文章内容内容内容内容','来源','1,2,3','1'),(21,'文章内容内容内容内容','来源','1,2,3','1'),(22,'文章内容内容内容内容','来源','1,2,3','1'),(23,'文章内容内容内容内容','来源','1,2,3','1'),(24,'文章内容内容内容内容','来源','1,2,3','1'),(25,'文章内容内容内容内容','来源','1,2,3','1'),(26,'文章内容内容内容内容','来源','1,2,3','1'),(27,'文章内容内容内容内容','来源','1,2,3','1'),(28,'文章内容内容内容内容','来源','1,2,3','1'),(29,'文章内容内容内容内容','来源','1,2,3','1'),(30,'文章内容内容内容内容','来源','1,2,3','1'),(31,'文章内容内容内容内容','来源','1,2,3','1'),(32,'文章内容内容内容内容','来源','1,2,3','1'),(33,'文章内容内容内容内容','来源','1,2,3','1'),(34,'文章内容内容内容内容','来源','1,2,3','1'),(35,'文章内容内容内容内容','来源','1,2,3','1'),(36,'文章内容内容内容内容','来源','1,2,3','1'),(37,'文章内容内容内容内容','来源','1,2,3','1'),(38,'文章内容内容内容内容','来源','1,2,3','1'),(39,'文章内容内容内容内容','来源','1,2,3','1'),(40,'文章内容内容内容内容','来源','1,2,3','1'),(41,'文章内容内容内容内容','来源','1,2,3','1'),(42,'文章内容内容内容内容','来源','1,2,3','1'),(43,'文章内容内容内容内容','来源','1,2,3','1'),(44,'文章内容内容内容内容','来源','1,2,3','1'),(45,'文章内容内容内容内容','来源','1,2,3','1'),(46,'文章内容内容内容内容','来源','1,2,3','1'),(47,'文章内容内容内容内容','来源','1,2,3','1'),(48,'文章内容内容内容内容','来源','1,2,3','1'),(49,'文章内容内容内容内容','来源','1,2,3','1'),(50,'文章内容内容内容内容','来源','1,2,3','1'),(51,'文章内容内容内容内容','来源','1,2,3','1'),(52,'文章内容内容内容内容','来源','1,2,3','1'),(53,'文章内容内容内容内容','来源','1,2,3','1');

/*Table structure for table `cms_category` */

DROP TABLE IF EXISTS `cms_category`;

CREATE TABLE `cms_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `site_id` bigint(20) DEFAULT '1' COMMENT '站点编号',
  `office_id` bigint(20) DEFAULT NULL COMMENT '归属机构',
  `parent_id` bigint(20) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(255) NOT NULL COMMENT '所有父级编号',
  `module` varchar(20) DEFAULT NULL COMMENT '栏目模块（article：文章；picture：图片；download：下载；link：链接；special：专题）',
  `name` varchar(100) NOT NULL COMMENT '栏目名称',
  `image` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标（ _blank、_self、_parent、_top）',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，填写有助于搜索引擎优化',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字，填写有助于搜索引擎优化',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) DEFAULT '1' COMMENT '是否在导航中显示（1：显示；0：不显示）',
  `in_list` char(1) DEFAULT '1' COMMENT '是否在分类页中显示列表（1：显示；0：不显示）',
  `show_modes` char(1) DEFAULT '0' COMMENT '展现方式（0:有子栏目显示栏目列表，无子栏目显示内容列表;1：首栏目内容列表；2：栏目第一条内容）',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) DEFAULT NULL COMMENT '是否需要审核',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_parent_ids` (`parent_ids`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='栏目表';

/*Data for the table `cms_category` */

insert  into `cms_category`(`id`,`site_id`,`office_id`,`parent_id`,`parent_ids`,`module`,`name`,`image`,`href`,`target`,`description`,`keywords`,`sort`,`in_menu`,`in_list`,`show_modes`,`allow_comment`,`is_audit`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,0,1,0,'0,',NULL,'顶级栏目',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,1,3,1,'0,1,','article','组织机构',NULL,NULL,NULL,NULL,NULL,10,'1','1','0','0','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,1,3,2,'0,1,2,','article','网站简介',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,1,3,2,'0,1,2,','article','内部机构',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,1,3,2,'0,1,2,','article','地方机构',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,1,3,1,'0,1,','article','质量检验',NULL,NULL,NULL,NULL,NULL,20,'1','1','1','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,1,3,6,'0,1,6,','article','产品质量',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,1,3,6,'0,1,6,','article','技术质量',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,1,3,6,'0,1,6,','article','工程质量',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,1,4,1,'0,1,','article','软件介绍',NULL,NULL,NULL,NULL,NULL,20,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,1,4,10,'0,1,10,','article','网络工具',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,1,4,10,'0,1,10,','article','浏览工具',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,1,4,10,'0,1,10,','article','浏览辅助',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,1,4,10,'0,1,10,','article','网络优化',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(15,1,4,10,'0,1,10,','article','邮件处理',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(16,1,4,10,'0,1,10,','article','下载工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(17,1,4,10,'0,1,10,','article','搜索工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(18,1,5,1,'0,1,','link','友情链接',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(19,1,5,18,'0,1,18,','link','常用网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(20,1,5,18,'0,1,18,','link','门户网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(21,1,5,18,'0,1,18,','link','购物网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(22,1,5,18,'0,1,18,','link','交友社区',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(23,1,5,18,'0,1,18,','link','音乐视频',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(24,1,6,1,'0,1,',NULL,'百度一下',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(25,1,6,1,'0,1,',NULL,'全文检索',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(26,2,6,1,'0,1,','article','测试栏目',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(27,1,6,1,'0,1,',NULL,'公共留言',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_comment` */

DROP TABLE IF EXISTS `cms_comment`;

CREATE TABLE `cms_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `category_id` bigint(20) NOT NULL COMMENT '栏目编号',
  `content_id` bigint(20) NOT NULL COMMENT '栏目内容的编号（Article.id、Photo.id、Download.id）',
  `title` varchar(255) DEFAULT NULL COMMENT '栏目内容的标题（Article.title、Photo.title、Download.title）',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` bigint(20) DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

/*Data for the table `cms_comment` */

/*Table structure for table `cms_guestbook` */

DROP TABLE IF EXISTS `cms_guestbook`;

CREATE TABLE `cms_guestbook` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) NOT NULL COMMENT '留言分类（1咨询、2建议、3投诉、4其它）',
  `content` varchar(255) NOT NULL COMMENT '留言内容',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(100) NOT NULL COMMENT '电话',
  `workunit` varchar(100) NOT NULL COMMENT '单位',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` bigint(20) DEFAULT NULL COMMENT '回复人',
  `re_date` datetime DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板';

/*Data for the table `cms_guestbook` */

/*Table structure for table `cms_link` */

DROP TABLE IF EXISTS `cms_link`;

CREATE TABLE `cms_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `category_id` bigint(20) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '链接名称',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色（red：红色；green：绿色；blue：蓝色；yellow：黄色；orange：橙色）',
  `image` varchar(255) DEFAULT NULL COMMENT '链接图片，如果上传了图片，则显示为图片链接',
  `href` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限，过期后将权重设置为：0',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='友情链接';

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`category_id`,`title`,`color`,`image`,`href`,`weight`,`weight_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,19,'JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,19,'ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,19,'百度一下',NULL,NULL,'http://www.baidu.com',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,19,'谷歌搜索',NULL,NULL,'http://www.google.com',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,20,'新浪网',NULL,NULL,'http://www.sina.com.cn',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,20,'腾讯网',NULL,NULL,'http://www.qq.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,21,'淘宝网',NULL,NULL,'http://www.taobao.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,21,'新华网',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,22,'赶集网',NULL,NULL,'http://www.ganji.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,22,'58同城',NULL,NULL,'http://www.58.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,23,'视频大全',NULL,NULL,'http://v.360.cn/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,23,'凤凰网',NULL,NULL,'http://www.ifeng.com/',0,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '站点名称',
  `title` varchar(100) NOT NULL COMMENT '站点标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述，填写有助于搜索引擎优化',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字，填写有助于搜索引擎优化',
  `theme` varchar(255) DEFAULT 'default' COMMENT '主题',
  `copyright` text COMMENT '版权信息',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='站点表';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`name`,`title`,`description`,`keywords`,`theme`,`copyright`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,'默认站点','JeeSite Web','JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,'子站点测试','JeeSite Subsite','JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `oa_leave` */

DROP TABLE IF EXISTS `oa_leave`;

CREATE TABLE `oa_leave` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `oa_leave` */

insert  into `oa_leave`(`id`,`process_instance_id`,`start_time`,`end_time`,`leave_type`,`reason`,`apply_time`,`reality_start_time`,`reality_end_time`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,'20','2013-06-26 17:20:25','2013-06-30 17:20:29','1','家里有事,需要请假',NULL,NULL,NULL,2,'2013-06-26 17:20:49',2,'2013-06-26 17:20:50',NULL,'0');

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(255) NOT NULL COMMENT '所有父级编号',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `name` varchar(100) NOT NULL COMMENT '区域名称',
  `type` char(1) DEFAULT NULL COMMENT '区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_parent_ids` (`parent_ids`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='区域表';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`code`,`name`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,0,'0,','100000','中国','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,1,'0,1,','110000','北京市','2',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,2,'0,1,2,','110101','东城区','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,2,'0,1,2,','110102','西城区','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,2,'0,1,2,','110103','朝阳区','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,2,'0,1,2,','110104','丰台区','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,2,'0,1,2,','110105','海淀区','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,1,'0,1,','370000','山东省','2',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,8,'0,1,2,','370531','济南市','3',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,8,'0,1,2,','370532','历城区','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,8,'0,1,2,','370533','历城区','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,8,'0,1,2,','370534','历下区','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,8,'0,1,2,','370535','天桥区','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,8,'0,1,2,','370536','槐荫区','4',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`label`,`value`,`type`,`description`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,'正常','0','del_flag','删除标记',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,'删除','1','del_flag','删除标记',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,'显示','1','show_hide','显示/隐藏',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,'隐藏','0','show_hide','显示/隐藏',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,'是','1','yes_no','是/否',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,'否','0','yes_no','是/否',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,'红色','red','color','颜色值',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,'绿色','green','color','颜色值',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,'蓝色','blue','color','颜色值',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,'黄色','yellow','color','颜色值',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,'橙色','orange','color','颜色值',50,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,'默认主题','default','theme','主题方案',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,'天蓝主题','cerulean','theme','主题方案',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,'橙色主题','readable','theme','主题方案',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(15,'红色主题','united','theme','主题方案',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(16,'Flat主题','flat','theme','主题方案',60,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(17,'国家','1','sys_area_type','区域类型',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(18,'省份、直辖市','2','sys_area_type','区域类型',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(19,'地市','3','sys_area_type','区域类型',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(20,'区县','4','sys_area_type','区域类型',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(21,'公司','1','sys_office_type','机构类型',60,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(22,'部门','2','sys_office_type','机构类型',70,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(23,'一级','1','sys_office_grade','机构等级',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(24,'二级','2','sys_office_grade','机构等级',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(25,'三级','3','sys_office_grade','机构等级',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(26,'四级','4','sys_office_grade','机构等级',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(27,'所有数据','1','sys_data_scope','数据范围',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(28,'所在公司及以下数据','2','sys_data_scope','数据范围',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(29,'所在公司数据','3','sys_data_scope','数据范围',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(30,'所在部门及以下数据','4','sys_data_scope','数据范围',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(31,'所在部门数据','5','sys_data_scope','数据范围',50,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(32,'仅本人数据','8','sys_data_scope','数据范围',90,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(33,'按明细设置','9','sys_data_scope','数据范围',100,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(34,'系统管理','1','sys_user_type','用户类型',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(35,'部门经理','2','sys_user_type','用户类型',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(36,'普通用户','3','sys_user_type','用户类型',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(37,'基础主题','basic','cms_theme','站点主题',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(38,'蓝色主题','blue','cms_theme','站点主题',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'1'),(39,'红色主题','red','cms_theme','站点主题',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'1'),(40,'文章模型','article','cms_module','栏目模型',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(41,'图片模型','picture','cms_module','栏目模型',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'1'),(42,'下载模型','download','cms_module','栏目模型',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'1'),(43,'链接模型','link','cms_module','栏目模型',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(44,'专题模型','special','cms_module','栏目模型',50,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'1'),(45,'默认展现方式','0','cms_show_modes','展现方式',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(46,'首栏目内容列表','1','cms_show_modes','展现方式',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(47,'栏目第一条内容','2','cms_show_modes','展现方式',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(48,'发布','0','cms_del_flag','内容状态',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(49,'删除','1','cms_del_flag','内容状态',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(50,'审核','2','cms_del_flag','内容状态',15,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(51,'首页焦点图','1','cms_posid','推荐位',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(52,'栏目页文章推荐','2','cms_posid','推荐位',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(53,'咨询','1','cms_guestbook','留言板分类',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(54,'建议','2','cms_guestbook','留言板分类',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(55,'投诉','3','cms_guestbook','留言板分类',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(56,'其它','4','cms_guestbook','留言板分类',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(57,'公休','1','oa_leave_type','请假类型',10,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(58,'病假','2','oa_leave_type','请假类型',20,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(59,'事假','3','oa_leave_type','请假类型',30,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(60,'调休','4','oa_leave_type','请假类型',40,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(61,'婚假','5','oa_leave_type','请假类型',60,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(62,'接入日志','1','sys_log_type','日志类型',30,1,'2013-06-03 08:00:00',1,'2013-06-03 08:00:00',NULL,'0'),(63,'异常日志','2','sys_log_type','日志类型',40,1,'2013-06-03 08:00:00',1,'2013-06-03 08:00:00',NULL,'0'),(64,'采购合同','1','contract_type','采购合同',1,2,'2013-07-11 15:29:27',2,'2013-07-11 15:29:27',NULL,'0'),(65,'销售合同','2','contract_type','销售合同',2,2,'2013-07-11 15:29:55',2,'2013-07-11 15:29:55',NULL,'0'),(66,'汽运','1','trans_type','运输类型',1,2,'2013-07-16 16:07:23',2,'2013-07-16 16:07:23',NULL,'0'),(67,'铁运','2','trans_type','运输类型',2,2,'2013-07-16 16:08:04',2,'2013-07-16 16:08:04',NULL,'0'),(68,'无票','1','pay_mode','结算方式',1,2,'2013-07-16 16:09:08',2,'2013-07-16 16:09:08',NULL,'0'),(69,'一票','2','pay_mode','结算方式',2,2,'2013-07-16 16:09:21',2,'2013-07-16 16:09:21',NULL,'0'),(70,'两票煤的增值税','3','pay_mode','结算方式',3,2,'2013-07-16 16:09:59',2,'2013-07-16 16:09:59',NULL,'0'),(71,'原煤','1','coal_type','煤炭种类',1,2,'2013-07-16 16:15:11',2,'2013-07-16 16:15:11',NULL,'0'),(72,'通过地磅吨位','1','pay_type','结算类型',1,2,'2013-07-16 16:16:04',2,'2013-07-16 16:16:04',NULL,'0'),(73,'通过轨道衡','2','pay_type','结算类型',2,2,'2013-07-16 16:16:23',2,'2013-07-16 16:16:23',NULL,'0'),(74,'是','1','tax_flag','是否含税',1,2,'2013-07-16 16:18:58',2,'2013-07-16 16:18:58',NULL,'0'),(75,'否','0','tax_flag','是否含税',0,2,'2013-07-16 16:19:07',2,'2013-07-16 16:19:07',NULL,'0');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型（1：接入日志；2：异常日志）',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`type`,`create_by`,`create_date`,`remote_addr`,`user_agent`,`request_uri`,`method`,`params`,`exception`) values (1,'1',2,'2013-06-26 17:20:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/jeesite/a/oa/leave/save','POST','id=&startTime=2013-06-26 17:20:25&endTime=2013-06-30 17:20:29&reason=家里有事,需要请假&leaveType=1',''),(2,'1',2,'2013-06-26 17:29:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/jeesite/a/sys/role/save','POST','id=4&menuIds=1,27,28,29,30,62,63,64,65,66,31,40,41,42,43,44,45,46,48,49,47,50,51,52,53,54,55,56,58,59,57,60,61...&dataScope=4&office.name=北京市总公司&name=部门管理员&officeIds=&roleType=assignment&office.id=1&oldName=部门管理员&enname=departAdmin',''),(3,'2',2,'2013-06-26 17:42:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/jeesite/a/sys/user/modifyPwd','GET','','org.springframework.web.util.NestedServletException: Handler processing failed; nested exception is java.lang.OutOfMemoryError: PermGen space'),(4,'2',2,'2013-06-26 17:42:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/jeesite/a/oa/leave','GET','','org.springframework.web.util.NestedServletException: Handler processing failed; nested exception is java.lang.OutOfMemoryError: PermGen space'),(5,'1',2,'2013-07-11 11:22:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=file&sort=30&parent.id=1&name=合同管理&target=&permission=&href=&parent.name=顶级菜单&isShow=1',''),(6,'1',2,'2013-07-11 11:27:56','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=69&icon=file&sort=300&parent.id=1&name=合同管理&target=&permission=&href=&parent.name=顶级菜单&isShow=1',''),(7,'1',2,'2013-07-11 11:30:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=69&name=基础数据管理&target=&permission=&href=&parent.name=合同管理&isShow=1',''),(8,'1',2,'2013-07-11 11:30:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=69&icon=&sort=300&parent.id=1&name=合同管理&target=&permission=&href=&parent.name=顶级菜单&isShow=1',''),(9,'1',2,'2013-07-11 11:30:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=user&sort=30&parent.id=70&name=供方管理&target=&permission=&href=&parent.name=基础数据管理&isShow=1',''),(10,'1',2,'2013-07-11 11:31:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=user&sort=40&parent.id=70&name=需方管理&target=&permission=&href=&parent.name=基础数据管理&isShow=1',''),(11,'1',2,'2013-07-11 11:32:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=71&icon=user&sort=30&parent.id=70&name=供方管理&target=&permission=&href=/coal/supply&parent.name=基础数据管理&isShow=1',''),(12,'1',2,'2013-07-11 11:32:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=72&icon=user&sort=40&parent.id=70&name=需方管理&target=&permission=&href=/coal/demand&parent.name=基础数据管理&isShow=1',''),(13,'1',2,'2013-07-11 11:35:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=71&name=查看&target=&permission=coal:supply:view&href=&parent.name=供方管理&isShow=0',''),(14,'1',2,'2013-07-11 11:35:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=71&name=修改&target=&permission=coal:supply:edit&href=&parent.name=供方管理&isShow=0',''),(15,'1',2,'2013-07-11 11:35:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=72&name=查看&target=&permission=coal:demand:view&href=&parent.name=需方管理&isShow=0',''),(16,'1',2,'2013-07-11 11:35:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=72&name=修改&target=&permission=coal:demand:edit&href=&parent.name=需方管理&isShow=0',''),(17,'2',2,'2013-07-11 11:38:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/supply/save','POST','supplyId=&supplyName=呼伦贝尔煤矿','org.springframework.dao.InvalidDataAccessResourceUsageException: Unknown column \'supply_name\' in \'field list\'; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Unknown column \'supply_name\' in \'field list\''),(18,'2',2,'2013-07-11 11:39:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/supply/save','POST','supplyId=&supplyName=呼伦贝尔煤矿','org.springframework.orm.hibernate3.HibernateJdbcException: JDBC exception on Hibernate data access: SQLException for SQL [n/a]; SQL state [HY000]; error code [1364]; Field \'SUPPLY_ID\' doesn\'t have a default value; nested exception is org.hibernate.exception.GenericJDBCException: Field \'SUPPLY_ID\' doesn\'t have a default value'),(19,'2',2,'2013-07-11 11:40:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/supply/save','POST','supplyId=&supplyName=呼伦贝尔煤矿','org.springframework.orm.hibernate3.HibernateJdbcException: JDBC exception on Hibernate data access: SQLException for SQL [n/a]; SQL state [HY000]; error code [1364]; Field \'SUPPLY_ID\' doesn\'t have a default value; nested exception is org.hibernate.exception.GenericJDBCException: Field \'SUPPLY_ID\' doesn\'t have a default value'),(20,'2',2,'2013-07-11 11:41:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/supply/save','POST','supplyId=&supplyName=内蒙古煤矿','org.springframework.orm.hibernate3.HibernateJdbcException: JDBC exception on Hibernate data access: SQLException for SQL [n/a]; SQL state [HY000]; error code [1364]; Field \'SUPPLY_ID\' doesn\'t have a default value; nested exception is org.hibernate.exception.GenericJDBCException: Field \'SUPPLY_ID\' doesn\'t have a default value'),(21,'1',2,'2013-07-11 11:42:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/supply/save','POST','supplyId=&supplyName=内蒙古煤矿',''),(22,'1',2,'2013-07-11 11:43:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/demand/save','POST','demandName=呼和浩特新华广场&demandId=',''),(23,'1',2,'2013-07-11 11:43:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/demand/delete','GET','id=1',''),(24,'1',2,'2013-07-11 11:57:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=40&parent.id=69&name=合同管理&target=&permission=&href=&parent.name=合同管理&isShow=1',''),(25,'1',2,'2013-07-11 11:58:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=77&name=合同录入&target=&permission=&href=/coal/contract&parent.name=合同管理&isShow=1',''),(26,'1',2,'2013-07-11 11:59:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=78&icon=file&sort=30&parent.id=77&name=合同录入&target=&permission=&href=/coal/contract&parent.name=合同管理&isShow=1',''),(27,'1',2,'2013-07-11 11:59:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=78&name=查看&target=&permission=coal:contract:view&href=&parent.name=合同录入&isShow=0',''),(28,'1',2,'2013-07-11 12:00:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=&sort=30&parent.id=78&name=修改&target=&permission=coal:contract:edit&href=&parent.name=合同录入&isShow=0',''),(29,'2',2,'2013-07-11 12:00:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.coal_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.coal_contract\' doesn\'t exist'),(30,'2',2,'2013-07-11 12:00:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.coal_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.coal_contract\' doesn\'t exist'),(31,'2',2,'2013-07-11 12:01:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.coal_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.coal_contract\' doesn\'t exist'),(32,'2',2,'2013-07-11 12:01:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.coal_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.coal_contract\' doesn\'t exist'),(33,'2',2,'2013-07-11 12:02:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'name\' of bean class [com.zhongxin.ctsms.modules.coal.entity.Contract]: Bean property \'name\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(34,'2',2,'2013-07-11 12:03:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'name\' of bean class [com.zhongxin.ctsms.modules.coal.entity.Contract]: Bean property \'name\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(35,'2',2,'2013-07-11 12:03:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'name\' of bean class [com.zhongxin.ctsms.modules.coal.entity.Contract]: Bean property \'name\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(36,'2',2,'2013-07-11 12:04:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'name\' of bean class [com.zhongxin.ctsms.modules.coal.entity.Contract]: Bean property \'name\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(37,'2',2,'2013-07-11 12:07:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.PropertyNotFoundException: The class \'com.zhongxin.ctsms.modules.coal.entity.Contract\' does not have the property \'id\'.'),(38,'2',2,'2013-07-11 14:21:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: /WEB-INF/views/modules/coal/contractForm.jsp(51,16) PWC6287: The attribute prefix fncoal does not correspond to any imported tag library'),(39,'2',2,'2013-07-11 14:21:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(40,'2',2,'2013-07-11 14:22:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(41,'2',2,'2013-07-11 14:22:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(42,'2',2,'2013-07-11 14:27:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(43,'2',2,'2013-07-11 14:28:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(44,'2',2,'2013-07-11 14:36:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(45,'2',2,'2013-07-11 14:36:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(46,'2',2,'2013-07-11 14:36:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: javax.el.ELException: Problems calling function \'fncoal:getSupplyName\''),(47,'2',2,'2013-07-11 15:22:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: /WEB-INF/views/modules/coal/contractForm.jsp(81,28) PWC6297: The function getDemandName cannot be located with the specified prefix'),(48,'1',2,'2013-07-11 15:29:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=采购合同&value=1&label=采购合同&type=contract_type',''),(49,'1',2,'2013-07-11 15:29:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/sys/dict/save','POST','id=&sort=2&description=销售合同&value=2&label=销售合同&type=contract_type',''),(50,'1',2,'2013-07-11 15:41:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/demand/save','POST','demandName=呼和浩特新华广场&demandId=&remarks=',''),(51,'1',2,'2013-07-11 15:42:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2017-07-31&number=1000&remarks=&supplyId=1&amount=50000000000&demandName=呼和浩特新华广场&signDate=2013-07-18&contractSid=&contractType=1&contractId=T123098423&supplyName=内蒙古煤矿',''),(52,'1',2,'2013-07-11 15:48:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2014-07-11&number=1000&remarks=&supplyId=1&amount=50000000000&demandName=呼和浩特新华广场&signDate=2013-07-11&contractSid=&contractType=1&contractId=T123098423&supplyName=内蒙古煤矿',''),(53,'2',2,'2013-07-11 15:59:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/demand/findByName','GET','name=呼和浩特','org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.QueryParameterException: Position beyond number of declared ordinal parameters. Remember that ordinal parameters are 1-based! Position: 1; nested exception is java.lang.IllegalArgumentException: org.hibernate.QueryParameterException: Position beyond number of declared ordinal parameters. Remember that ordinal parameters are 1-based! Position: 1'),(54,'2',2,'2013-07-11 16:07:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/demand/findByName','GET','name=呼和浩特','org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.QueryParameterException: Position beyond number of declared ordinal parameters. Remember that ordinal parameters are 1-based! Position: 1; nested exception is java.lang.IllegalArgumentException: org.hibernate.QueryParameterException: Position beyond number of declared ordinal parameters. Remember that ordinal parameters are 1-based! Position: 1'),(55,'2',2,'2013-07-11 16:18:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=50000000000&demandName=呼和浩特新华广场&signDate=2013-07-11&contractSid=&contractType=1&contractId=T123098423&supplyName=内蒙古煤矿','org.springframework.orm.hibernate3.HibernateJdbcException: JDBC exception on Hibernate data access: SQLException for SQL [n/a]; SQL state [HY000]; error code [1364]; Field \'CONTRACT_SID\' doesn\'t have a default value; nested exception is org.hibernate.exception.GenericJDBCException: Field \'CONTRACT_SID\' doesn\'t have a default value'),(56,'2',2,'2013-07-11 16:19:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2016-07-11&number=1000&remarks=&supplyId=1&amount=50000000000&demandName=呼和浩特新华广场&signDate=2013-07-11&contractSid=&contractType=1&contractId=T123098423&supplyName=内蒙古煤矿','org.springframework.dao.DataIntegrityViolationException: Data truncation: Out of range value for column \'AMOUNT\' at row 1; SQL [n/a]; nested exception is org.hibernate.exception.DataException: Data truncation: Out of range value for column \'AMOUNT\' at row 1'),(57,'1',2,'2013-07-11 16:21:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&signDate=2013-07-11&contractSid=&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(58,'2',2,'2013-07-11 16:41:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.apache.jasper.JasperException: /WEB-INF/views/modules/coal/contractList.jsp(39,22) PWC6297: The function getSupplyName cannot be located with the specified prefix'),(59,'2',2,'2013-07-11 16:44:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/','POST','pageSize=10&contractId=33&pageNo=1&contractType=2','org.springframework.orm.hibernate3.HibernateQueryException: could not resolve property: name of: com.zhongxin.ctsms.modules.coal.entity.Contract; nested exception is org.hibernate.QueryException: could not resolve property: name of: com.zhongxin.ctsms.modules.coal.entity.Contract'),(60,'1',2,'2013-07-11 16:54:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=&demandId=2&endDate=&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&signDate=&contractSid=&contractType=1&contractId=12&supplyName=内蒙古煤矿',''),(61,'1',2,'2013-07-11 16:59:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=&demandId=2&endDate=&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&signDate=&contractSid=&contractType=1&contractId=12&supplyName=内蒙古煤矿',''),(62,'1',2,'2013-07-11 17:16:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=&demandId=2&endDate=&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&signDate=&contractSid=&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(63,'1',2,'2013-07-11 17:18:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=&demandId=2&number=1000&endDate=&remarks=&supplyId=1&demandName=呼和浩特新华广场&amount=5000000000&signDate=&contractSid=&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(64,'1',2,'2013-07-11 17:27:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=&demandId=2&endDate=&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&signDate=&contractSid=&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(65,'1',2,'2013-07-16 12:17:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&fileData[0]=220417mhwhw4ic7necmnhx.jpg&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(66,'1',2,'2013-07-16 12:24:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&fileData[0]=2012年终工作总结模板.pptx&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(67,'1',2,'2013-07-16 12:25:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&fileData[0]=2012年终工作总结模板.pptx&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(68,'1',2,'2013-07-16 12:27:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&fileData[0]=2012年终工作总结模板.pptx&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(69,'1',2,'2013-07-16 12:31:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(70,'1',2,'2013-07-16 14:36:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(71,'2',2,'2013-07-16 15:02:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','id=1','org.apache.jasper.JasperException: javax.el.PropertyNotFoundException: The class \'com.zhongxin.ctsms.modules.coal.entity.Contract\' does not have the property \'id\'.'),(72,'2',2,'2013-07-16 15:02:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','id=1','org.apache.jasper.JasperException: javax.el.PropertyNotFoundException: The class \'com.zhongxin.ctsms.modules.coal.entity.PFile\' does not have the property \'url\'.'),(73,'1',2,'2013-07-16 15:06:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','startDate=2013-07-11&demandId=2&endDate=2015-07-11&number=1000&remarks=&supplyId=1&amount=5000000000&demandName=呼和浩特新华广场&signDate=2013-07-11&contractSid=1&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(74,'2',2,'2013-07-16 15:27:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/form','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'coalType\' of bean class [com.zhongxin.ctsms.modules.coal.entity.Contract]: Bean property \'coalType\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(75,'2',2,'2013-07-16 15:30:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Unknown column \'this_.calorie\' in \'field list\'; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Unknown column \'this_.calorie\' in \'field list\''),(76,'1',2,'2013-07-16 16:05:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','deliveryPlace=内蒙古新欢广场&startDate=&demandId=2&number=1000&endDate=&remarks=&calorie=23456&supplyId=1&taxFlag=1&amount=5000000000&demandName=呼和浩特新华广场&price=4000&signDate=2013-07-16&contractSid=&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(77,'1',2,'2013-07-16 16:05:17','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','deliveryPlace=内蒙古新欢广场&startDate=2013-07-16&demandId=2&number=1000&endDate=2015-07-16&remarks=&calorie=23456&supplyId=1&taxFlag=1&amount=5000000000&demandName=呼和浩特新华广场&price=4000.0&signDate=2013-07-16&contractSid=&contractType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(78,'1',2,'2013-07-16 16:07:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=运输类型&value=1&label=汽运&type=trans_type',''),(79,'1',2,'2013-07-16 16:08:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=2&description=运输类型&value=2&label=铁运&type=trans_type',''),(80,'1',2,'2013-07-16 16:09:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=结算方式&value=1&label=无票&type=pay_mode',''),(81,'1',2,'2013-07-16 16:09:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=2&description=结算方式&value=2&label=一票&type=pay_mode',''),(82,'1',2,'2013-07-16 16:09:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=3&description=结算方式&value=3&label=两票煤的增值税&type=pay_mode',''),(83,'1',2,'2013-07-16 16:15:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=煤炭种类&value=1&label=原煤&type=coal_type',''),(84,'1',2,'2013-07-16 16:16:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=结算类型&value=1&label=通过地磅吨位&type=pay_type',''),(85,'1',2,'2013-07-16 16:16:23','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=2&description=结算类型&value=2&label=通过轨道衡&type=pay_type',''),(86,'1',2,'2013-07-16 16:18:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=1&description=是否含税&value=1&label=是&type=tax_flag',''),(87,'1',2,'2013-07-16 16:19:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/dict/save','POST','id=&sort=0&description=是否含税&value=0&label=否&type=tax_flag',''),(88,'2',2,'2013-07-16 16:19:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/delFile','GET','id=4&prjId=2','java.lang.NumberFormatException: null'),(89,'1',2,'2013-07-16 16:23:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/save','POST','deliveryPlace=内蒙古新欢广场&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2015-07-16&remarks=&calorie=23456&supplyId=1&taxFlag=1&amount=5000000000&demandName=呼和浩特新华广场&payMode=1&transType=1&signDate=2013-07-16&price=4000.0&contractSid=2&contractType=1&payType=1&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(90,'1',2,'2013-07-16 17:12:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/sys/menu/save','POST','id=&icon=file&sort=40&parent.id=77&name=采购合同录入&target=&permission=&href=/coal/contract/purchase&parent.name=合同管理&isShow=1',''),(91,'2',2,'2013-07-16 17:13:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.purchase_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.purchase_contract\' doesn\'t exist'),(92,'2',2,'2013-07-16 17:17:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase','GET','','org.springframework.dao.InvalidDataAccessResourceUsageException: Table \'ctsmsdb.purchase_contract\' doesn\'t exist; SQL [n/a]; nested exception is org.hibernate.exception.SQLGrammarException: Table \'ctsmsdb.purchase_contract\' doesn\'t exist'),(93,'2',2,'2013-07-16 17:19:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/form','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'transType\' of bean class [com.zhongxin.ctsms.modules.coal.entity.contract.PurchaseContract]: Bean property \'transType\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(94,'2',2,'2013-07-16 17:20:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/form','GET','','org.apache.jasper.JasperException: org.springframework.beans.NotReadablePropertyException: Invalid property \'transType\' of bean class [com.zhongxin.ctsms.modules.coal.entity.contract.PurchaseContract]: Bean property \'transType\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?'),(95,'1',2,'2013-07-16 17:21:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=内蒙古新欢广场&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2013-09-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=呼和浩特新华广场&payMode=1&price=4000&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(96,'1',2,'2013-07-16 17:25:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=内蒙古新欢广场&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2013-09-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=呼和浩特新华广场&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(97,'1',2,'2013-07-16 17:25:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=内蒙古新欢广场&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2013-09-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=呼和浩特新华广场&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(98,'1',2,'2013-07-16 17:28:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=内蒙古新欢广场&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2015-07-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=呼和浩特新华广场&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(99,'1',2,'2013-07-16 17:59:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=内蒙古新欢广场&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2016-07-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=呼和浩特新华广场&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(100,'1',2,'2013-07-16 18:03:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=内蒙古新欢广场&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2013-09-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=呼和浩特新华广场&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=内蒙古煤矿',''),(101,'1',2,'2013-07-16 18:05:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11','/ctsms/a/coal/contract/purchase/save','POST','deliveryPlace=内蒙古新欢广场&startDate=2013-07-16&coalType=1&demandId=2&number=1000&endDate=2015-07-16&remarks=&calorie=23456&supplyId=1&taxFlag=0&amount=5000000000&demandName=呼和浩特新华广场&payMode=1&price=4000.0&signDate=2013-07-16&contractSid=&contractId=Y6643234234&supplyName=内蒙古煤矿','');

/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(255) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_parent_ids` (`parent_ids`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(255) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标（mainFrame、 _blank、_self、_parent、_top）',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示（1：显示；0：不显示）',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_parent_ids` (`parent_ids`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`href`,`target`,`icon`,`sort`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,0,'0,','顶级菜单',NULL,NULL,NULL,0,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,1,'0,1,','系统设置',NULL,NULL,NULL,900,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,2,'0,1,2,','系统设置',NULL,NULL,NULL,980,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,3,'0,1,2,3,','菜单管理','/sys/menu/',NULL,'list-alt',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,4,'0,1,2,3,4,','查看',NULL,NULL,NULL,30,'0','sys:menu:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,4,'0,1,2,3,4,','修改',NULL,NULL,NULL,30,'0','sys:menu:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,3,'0,1,2,3,','角色管理','/sys/role/',NULL,'lock',50,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,7,'0,1,2,3,7,','查看',NULL,NULL,NULL,30,'0','sys:role:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,7,'0,1,2,3,7,','修改',NULL,NULL,NULL,30,'0','sys:role:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,3,'0,1,2,3,','字典管理','/sys/dict/',NULL,'th-list',60,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,10,'0,1,2,3,10,','查看',NULL,NULL,NULL,30,'0','sys:dict:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,10,'0,1,2,3,10,','修改',NULL,NULL,NULL,30,'0','sys:dict:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,2,'0,1,2,','机构用户',NULL,NULL,NULL,970,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,13,'0,1,2,13,','区域管理','/sys/area/',NULL,'th',50,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(15,14,'0,1,2,13,14,','查看',NULL,NULL,NULL,30,'0','sys:area:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(16,14,'0,1,2,13,14,','修改',NULL,NULL,NULL,30,'0','sys:area:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(17,13,'0,1,2,13,','机构管理','/sys/office/',NULL,'th-large',40,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(18,17,'0,1,2,13,17,','查看',NULL,NULL,NULL,30,'0','sys:office:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(19,17,'0,1,2,13,17,','修改',NULL,NULL,NULL,30,'0','sys:office:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(20,13,'0,1,2,13,','用户管理','/sys/user/',NULL,'user',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(21,20,'0,1,2,13,20,','查看',NULL,NULL,NULL,30,'0','sys:user:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(22,20,'0,1,2,13,20,','修改',NULL,NULL,NULL,30,'0','sys:user:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(23,2,'0,1,2,','关于帮助',NULL,NULL,NULL,990,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(24,23,'0,1,2,23','项目首页','http://jeesite.com','_blank',NULL,30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(25,23,'0,1,2,23','项目维基','https://github.com/thinkgem/jeesite/wiki','_blank',NULL,50,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(26,23,'0,1,2,23','问题反馈','https://github.com/thinkgem/jeesite/issues/new','_blank',NULL,80,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(27,1,'0,1,','我的面板',NULL,NULL,NULL,100,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(28,27,'0,1,27,','个人信息',NULL,NULL,NULL,990,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(29,28,'0,1,27,28,','个人信息','/sys/user/info',NULL,'user',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(30,28,'0,1,27,28,','修改密码','/sys/user/modifyPwd',NULL,'lock',40,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(31,1,'0,1,','内容管理',NULL,NULL,NULL,500,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(32,31,'0,1,31,','栏目设置',NULL,NULL,NULL,990,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(33,32,'0,1,31,32','栏目管理','/cms/category/',NULL,'align-justify',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(34,33,'0,1,31,32,33,','查看',NULL,NULL,NULL,30,'0','cms:category:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(35,33,'0,1,31,32,33,','修改',NULL,NULL,NULL,30,'0','cms:category:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(36,32,'0,1,31,32','站点设置','/cms/site/',NULL,'certificate',40,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(37,36,'0,1,31,32,36,','查看',NULL,NULL,NULL,30,'0','cms:site:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(38,36,'0,1,31,32,36,','修改',NULL,NULL,NULL,30,'0','cms:site:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(39,32,'0,1,31,32','切换站点','/cms/site/select',NULL,'retweet',50,'1','cms:site:select',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(40,31,'0,1,31,','内容管理',NULL,NULL,NULL,500,'1','cms:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(41,40,'0,1,31,40,','内容发布','/cms/',NULL,'briefcase',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(42,41,'0,1,31,40,41,','文章模型','/cms/article/',NULL,'file',40,'0',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(43,42,'0,1,31,40,41,42,','查看',NULL,NULL,NULL,30,'0','cms:article:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(44,42,'0,1,31,40,41,42,','修改',NULL,NULL,NULL,30,'0','cms:article:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(45,42,'0,1,31,40,41,42,','审核',NULL,NULL,NULL,30,'0','cms:article:audit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(46,41,'0,1,31,40,41,','链接模型','/cms/link/',NULL,'random',60,'0',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(47,46,'0,1,31,40,41,46,','查看',NULL,NULL,NULL,30,'0','cms:link:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(48,46,'0,1,31,40,41,46,','修改',NULL,NULL,NULL,30,'0','cms:link:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(49,46,'0,1,31,40,41,46,','审核',NULL,NULL,NULL,30,'0','cms:link:audit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(50,40,'0,1,31,40,','评论管理','/cms/comment/?status=2',NULL,'comment',40,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(51,50,'0,1,31,40,50,','查看',NULL,NULL,NULL,30,'0','cms:comment:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(52,50,'0,1,31,40,50,','审核',NULL,NULL,NULL,30,'0','cms:comment:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(53,40,'0,1,31,40,','公共留言','/cms/guestbook/?status=2',NULL,'glass',80,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(54,53,'0,1,31,40,53,','查看',NULL,NULL,NULL,30,'0','cms:guestbook:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(55,53,'0,1,31,40,53,','审核',NULL,NULL,NULL,30,'0','cms:guestbook:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(56,40,'0,1,31,40,','文件管理','/../static/ckfinder/ckfinder.html',NULL,'folder-open',90,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(57,56,'0,1,31,40,56,','查看',NULL,NULL,NULL,30,'0','cms:ckfinder:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(58,56,'0,1,31,40,56,','上传',NULL,NULL,NULL,30,'0','cms:ckfinder:upload',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(59,56,'0,1,31,40,56,','修改',NULL,NULL,NULL,30,'0','cms:ckfinder:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(60,31,'0,1,31,','统计分析',NULL,NULL,NULL,600,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(61,60,'0,1,31,60,','信息量统计','/cms/stats/article',NULL,'tasks',30,'1','cms:stats:article',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(62,1,'0,1,','在线办公',NULL,NULL,NULL,200,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(63,62,'0,1,62,','个人办公',NULL,NULL,NULL,30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(64,63,'0,1,62,63,','请假办理','/oa/leave',NULL,'leaf',30,'1',NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(65,64,'0,1,62,63,64,','查看',NULL,NULL,NULL,30,'0','oa:leave:view',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(66,64,'0,1,62,63,64,','修改',NULL,NULL,NULL,30,'0','oa:leave:edit',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(67,2,'0,1,2,','日志查询',NULL,NULL,NULL,985,'1',NULL,1,'2013-06-03 08:00:00',1,'2013-06-03 08:00:00',NULL,'0'),(68,67,'0,1,2,67,','日志查询','/sys/log',NULL,'pencil',30,'1','sys:log:view',1,'2013-06-03 08:00:00',1,'2013-06-03 08:00:00',NULL,'0'),(69,1,'0,1,','合同管理','','','',300,'1','',2,'2013-07-11 11:22:05',2,'2013-07-11 11:30:17',NULL,'0'),(70,69,'0,1,69,','基础数据管理','','','',30,'1','',2,'2013-07-11 11:30:06',2,'2013-07-11 11:30:06',NULL,'0'),(71,70,'0,1,69,70,','供方管理','/coal/supply','','user',30,'1','',2,'2013-07-11 11:30:57',2,'2013-07-11 11:32:34',NULL,'0'),(72,70,'0,1,69,70,','需方管理','/coal/demand','','user',40,'1','',2,'2013-07-11 11:31:17',2,'2013-07-11 11:32:46',NULL,'0'),(73,71,'0,1,69,70,71,','查看','','','',30,'0','coal:supply:view',2,'2013-07-11 11:35:00',2,'2013-07-11 11:35:00',NULL,'0'),(74,71,'0,1,69,70,71,','修改','','','',30,'0','coal:supply:edit',2,'2013-07-11 11:35:23',2,'2013-07-11 11:35:23',NULL,'0'),(75,72,'0,1,69,70,72,','查看','','','',30,'0','coal:demand:view',2,'2013-07-11 11:35:41',2,'2013-07-11 11:35:41',NULL,'0'),(76,72,'0,1,69,70,72,','修改','','','',30,'0','coal:demand:edit',2,'2013-07-11 11:35:54',2,'2013-07-11 11:35:54',NULL,'0'),(77,69,'0,1,69,','合同管理','','','',40,'1','',2,'2013-07-11 11:57:38',2,'2013-07-11 11:57:38',NULL,'0'),(78,77,'0,1,69,77,','合同录入','/coal/contract','','file',30,'1','',2,'2013-07-11 11:58:01',2,'2013-07-11 11:59:11',NULL,'0'),(79,78,'0,1,69,77,78,','查看','','','',30,'0','coal:contract:view',2,'2013-07-11 11:59:42',2,'2013-07-11 11:59:42',NULL,'0'),(80,78,'0,1,69,77,78,','修改','','','',30,'0','coal:contract:edit',2,'2013-07-11 12:00:00',2,'2013-07-11 12:00:00',NULL,'0'),(81,77,'0,1,69,77,','采购合同录入','/coal/contract/purchase','','file',40,'1','',2,'2013-07-16 17:12:01',2,'2013-07-16 17:12:01',NULL,'0');

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(255) NOT NULL COMMENT '所有父级编号',
  `area_id` bigint(20) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `name` varchar(100) NOT NULL COMMENT '机构名称',
  `type` char(1) NOT NULL COMMENT '机构类型（1：公司；2：部门；3：小组）',
  `grade` char(1) NOT NULL COMMENT '机构等级（1：一级；2：二级；3：三级；4：四级）',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_parent_ids` (`parent_ids`),
  KEY `sys_office_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`area_id`,`code`,`name`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,0,'0,',2,'100000','北京市总公司','1','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,1,'0,1,',2,'100001','公司领导','2','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,1,'0,1,',2,'100002','人力部','2','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,1,'0,1,',2,'100003','市场部','2','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(5,1,'0,1,',2,'100004','技术部','2','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,1,'0,1,',2,'100005','研发部','2','1',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,1,'0,1,',8,'200000','山东省分公司','1','2',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(8,7,'0,1,7,',8,'200001','公司领导','2','2',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(9,7,'0,1,7,',8,'200002','综合部','2','2',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(10,7,'0,1,7,',8,'200003','市场部','2','2',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(11,7,'0,1,7,',8,'200004','技术部','2','2',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(12,7,'0,1,7,',9,'201000','济南市分公司','1','3',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(13,12,'0,1,7,12,',9,'201001','公司领导','2','3',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(14,12,'0,1,7,12,',9,'201002','综合部','2','3',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(15,12,'0,1,7,12,',9,'201003','市场部','2','3',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(16,12,'0,1,7,12,',9,'201004','技术部','2','3',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(17,12,'0,1,7,12,',11,'201010','济南市历城区分公司','1','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(18,17,'0,1,7,12,17,',11,'201011','公司领导','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(19,17,'0,1,7,12,17,',11,'201012','综合部','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(20,17,'0,1,7,12,17,',11,'201013','市场部','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(21,17,'0,1,7,12,17,',11,'201014','技术部','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(22,12,'0,1,7,12,',12,'201020','济南市历下区分公司','1','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(23,22,'0,1,7,12,22,',12,'201021','公司领导','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(24,22,'0,1,7,12,22,',12,'201022','综合部','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(25,22,'0,1,7,12,22,',12,'201023','市场部','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(26,22,'0,1,7,12,22,',12,'201024','技术部','2','4',NULL,NULL,NULL,NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `office_id` bigint(20) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围（0：所有数据；1：所在公司及以下数据；2：所在公司数据；3：所在部门及以下数据；4：所在部门数据；8：仅本人数据；9：按明细设置）',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,1,'系统管理员','deptLeader','assignment','1',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(2,1,'公司管理员','hr','assignment','2',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(3,1,'本公司管理员','c','assignment','3',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(4,1,'部门管理员','departAdmin','assignment','4',1,'2013-05-27 08:00:00',2,'2013-06-26 17:29:36',NULL,'0'),(5,1,'本部门管理员','e','assignment','5',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(6,1,'普通用户','f','assignment','8',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0'),(7,7,'山东省管理员','g','assignment','9',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,53),(2,54),(2,55),(2,56),(2,57),(2,58),(2,59),(2,60),(2,61),(2,62),(2,63),(2,64),(2,65),(2,66),(2,67),(2,68),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60),(3,61),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(4,44),(4,45),(4,46),(4,47),(4,48),(4,49),(4,50),(4,51),(4,52),(4,53),(4,54),(4,55),(4,56),(4,57),(4,58),(4,59),(4,60),(4,61),(4,62),(4,63),(4,64),(4,65),(4,66),(4,67),(4,68),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(5,13),(5,14),(5,15),(5,16),(5,17),(5,18),(5,19),(5,20),(5,21),(5,22),(5,23),(5,24),(5,25),(5,26),(5,27),(5,28),(5,29),(5,30),(5,31),(5,32),(5,33),(5,34),(5,35),(5,36),(5,37),(5,38),(5,39),(5,40),(5,41),(5,42),(5,43),(5,44),(5,45),(5,46),(5,47),(5,48),(5,49),(5,50),(5,51),(5,52),(5,53),(5,54),(5,55),(5,56),(5,57),(5,58),(5,59),(5,60),(5,61),(5,62),(5,63),(5,64),(5,65),(5,66),(5,67),(5,68),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10),(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,17),(6,18),(6,19),(6,20),(6,21),(6,22),(6,23),(6,24),(6,25),(6,26),(6,27),(6,28),(6,29),(6,30),(6,31),(6,32),(6,33),(6,34),(6,35),(6,36),(6,37),(6,38),(6,39),(6,40),(6,41),(6,42),(6,43),(6,44),(6,45),(6,46),(6,47),(6,48),(6,49),(6,50),(6,51),(6,52),(6,53),(6,54),(6,55),(6,56),(6,57),(6,58),(6,59),(6,60),(6,61),(6,62),(6,63),(6,64),(6,65),(6,66),(6,67),(6,68),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(7,13),(7,14),(7,15),(7,16),(7,17),(7,18),(7,19),(7,20),(7,21),(7,22),(7,23),(7,24),(7,25),(7,26),(7,27),(7,28),(7,29),(7,30),(7,31),(7,32),(7,33),(7,34),(7,35),(7,36),(7,37),(7,38),(7,39),(7,40),(7,41),(7,42),(7,43),(7,44),(7,45),(7,46),(7,47),(7,48),(7,49),(7,50),(7,51),(7,52),(7,53),(7,54),(7,55),(7,56),(7,57),(7,58),(7,59),(7,60),(7,61),(7,62),(7,63),(7,64),(7,65),(7,66),(7,67),(7,68);

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `office_id` bigint(20) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

/*Data for the table `sys_role_office` */

insert  into `sys_role_office`(`role_id`,`office_id`) values (7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(7,13),(7,14),(7,15),(7,16),(7,17),(7,18),(7,19),(7,20),(7,21),(7,22),(7,23),(7,24),(7,25),(7,26);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `company_id` bigint(20) NOT NULL COMMENT '归属公司',
  `office_id` bigint(20) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`login_ip`,`login_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values (1,1,1,'thinkgem','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','Thinkgem','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','最高管理员','0'),(2,1,1,'admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0002','管理员','thinkgem@163.com','8675','8675',NULL,'0:0:0:0:0:0:0:1','2013-07-17 12:13:16',1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','管理员','0'),(3,1,3,'bj_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0003','综合部','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','综合部','0'),(4,1,4,'bj_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0004','市场部','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','市场部','0'),(5,1,5,'bj_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0005','技术部','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','技术部','0'),(6,1,6,'bj_yfb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0006','研发部','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','研发部','0'),(7,7,8,'sd_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0007','山分领导','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','山东省分公司领导','0'),(8,7,9,'sd_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0008','山分综合部','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','山东省分公司综合部','0'),(9,7,10,'sd_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0009','山分市场部','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','山东省分公司市场部','0'),(10,7,11,'sd_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0010','山东省分公司技术部','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','山东省分公司技术部','0'),(11,12,13,'sdjn_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0011','济分公司领导','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','济南分公司领导','0'),(12,12,18,'sdjnlc_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0012','济分历城领导','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','济南市历城区分公司领导','0'),(13,22,23,'sdjnlx_admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0013','济分历下领导','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','济南市历下区分公司领导','0'),(14,22,24,'sdjnlx_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0014','济分历下综合部','thinkgem@163.com','8675','8675',NULL,NULL,NULL,1,'2013-05-27 08:00:00',1,'2013-05-27 08:00:00','济南市历下区分公司综合部','0');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(2,1),(3,2),(4,3),(5,4),(6,5),(7,2),(7,7),(8,2),(9,1),(10,2),(11,3),(12,4),(13,5),(14,6);

/*Table structure for table `t_aduit_info` */

DROP TABLE IF EXISTS `t_aduit_info`;

CREATE TABLE `t_aduit_info` (
  `AUDIT_ID` bigint(20) NOT NULL,
  `AUDIT_TYPE` char(1) NOT NULL COMMENT '0：合同审核 1：财务审核  2：入库审核  3：其它审核 ',
  `CONTRACT_SID` bigint(20) DEFAULT NULL,
  `FEE_ITEM_ID` int(11) DEFAULT NULL,
  `AUDIT_STAFF_ID` varchar(6) NOT NULL,
  `AUDIT_NOTES` varchar(2048) DEFAULT NULL,
  `AUDIT_STS` char(1) NOT NULL COMMENT '0： 未审核 1：已提交审核 2：审核通过 3：审核不通过',
  `AUDIT_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同审核、财务审核';

/*Data for the table `t_aduit_info` */

/*Table structure for table `t_coal_demand` */

DROP TABLE IF EXISTS `t_coal_demand`;

CREATE TABLE `t_coal_demand` (
  `DEMAND_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEMAND_NAME` varchar(255) DEFAULT NULL,
  `CREATE_BY` bigint(20) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` bigint(20) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `DEL_FLAG` char(1) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DEMAND_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_coal_demand` */

insert  into `t_coal_demand`(`DEMAND_ID`,`DEMAND_NAME`,`CREATE_BY`,`CREATE_DATE`,`UPDATE_BY`,`UPDATE_DATE`,`DEL_FLAG`,`REMARKS`) values (1,'呼和浩特新华广场',2,'2013-07-11 11:43:22',2,'2013-07-11 11:43:22','1',NULL),(2,'呼和浩特新华广场',2,'2013-07-11 15:41:23',2,'2013-07-11 15:41:23','0','');

/*Table structure for table `t_coal_price` */

DROP TABLE IF EXISTS `t_coal_price`;

CREATE TABLE `t_coal_price` (
  `COAL_PRICE_ID` bigint(20) NOT NULL,
  `COAL_TYPE_ID` varchar(6) DEFAULT NULL COMMENT '无烟煤	WY\n             贫煤	PM\n             贫瘦煤	PS\n             瘦煤	SM\n             焦煤	JM\n             肥煤	FM\n             1/3焦煤	1/3JM\n             气肥煤	QF\n             气煤	QM\n             1/2中粘煤	1/2ZN\n             弱粘煤	RN\n             不粘煤	BN\n             长焰煤	CY\n             褐煤	HM\n             ',
  `COAL_PRICE_OLD` varchar(8) DEFAULT NULL,
  `COAL_PRICE` varchar(8) DEFAULT NULL,
  `STS` char(1) DEFAULT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_coal_price` */

/*Table structure for table `t_coal_supply` */

DROP TABLE IF EXISTS `t_coal_supply`;

CREATE TABLE `t_coal_supply` (
  `SUPPLY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUPPLY_NAME` varchar(255) DEFAULT NULL,
  `CREATE_BY` bigint(20) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` bigint(20) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `DEL_FLAG` char(1) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SUPPLY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_coal_supply` */

insert  into `t_coal_supply`(`SUPPLY_ID`,`SUPPLY_NAME`,`CREATE_BY`,`CREATE_DATE`,`UPDATE_BY`,`UPDATE_DATE`,`DEL_FLAG`,`REMARKS`) values (1,'内蒙古煤矿',2,'2013-07-11 11:42:23',2,'2013-07-11 11:42:23','0',NULL);

/*Table structure for table `t_coal_ticket` */

DROP TABLE IF EXISTS `t_coal_ticket`;

CREATE TABLE `t_coal_ticket` (
  `TICKET_U_ID` bigint(20) NOT NULL,
  `BATCH_ID` int(11) DEFAULT NULL,
  `CONTRACT_ID` bigint(20) DEFAULT NULL,
  `SUPPLY_ID` varchar(6) DEFAULT NULL,
  `SEND_TYPE` char(1) DEFAULT NULL COMMENT '1：发往货场 2：发往港口 3：发往客户 4：发往其他',
  `GRANT_TYPE` char(1) DEFAULT NULL COMMENT '1：发送车队 2：发放个人',
  `PICKUP_ADDR` varchar(1024) DEFAULT NULL,
  `UNLOAD_ADDR` varchar(1024) DEFAULT NULL,
  `PICKUP_DATE` datetime DEFAULT NULL,
  `PICKUP_PERSION` varchar(24) DEFAULT NULL,
  `PICKUP_LINK` varchar(12) DEFAULT NULL,
  `TRANS_PRICE_ID` int(11) DEFAULT NULL,
  `TRANS_COUNT` int(11) DEFAULT NULL,
  `FACTORY` varchar(64) DEFAULT NULL,
  `TRUCK_TEAM` varchar(24) DEFAULT NULL,
  `PLATE_NO` varchar(32) DEFAULT NULL,
  `TICKET_PERSION` varchar(12) DEFAULT NULL,
  `TICKET_FALG` varchar(32) DEFAULT NULL,
  `TICKET_START_NO` bigint(20) DEFAULT NULL,
  `TICKET_END_NO` bigint(20) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_coal_ticket` */

/*Table structure for table `t_coal_type` */

DROP TABLE IF EXISTS `t_coal_type`;

CREATE TABLE `t_coal_type` (
  `COAL_TYPE_ID` varchar(6) NOT NULL COMMENT '无烟煤	WY\n             贫煤	PM\n             贫瘦煤	PS\n             瘦煤	SM\n             焦煤	JM\n             肥煤	FM\n             1/3焦煤	1/3JM\n             气肥煤	QF\n             气煤	QM\n             1/2中粘煤	1/2ZN\n             弱粘煤	RN\n             不粘煤	BN\n             长焰煤	CY\n             褐煤	HM\n             ',
  `VDAF` varchar(12) DEFAULT NULL,
  `GRL` varchar(12) DEFAULT NULL,
  `YMM` varchar(12) DEFAULT NULL,
  `B` varchar(12) DEFAULT NULL,
  `PM` varchar(12) DEFAULT NULL,
  `QGR` varchar(12) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国家标准分类：其中炼焦煤类占27．65%，非炼焦煤类占72．35%，前者包括气煤（占13．75%），肥煤（';

/*Data for the table `t_coal_type` */

/*Table structure for table `t_comp_info` */

DROP TABLE IF EXISTS `t_comp_info`;

CREATE TABLE `t_comp_info` (
  `COMP_ID` bigint(20) NOT NULL,
  `COMP_NAME` varchar(512) DEFAULT NULL,
  `CORPORATION` varchar(512) DEFAULT NULL,
  `LINK_PERSION` varchar(32) DEFAULT NULL,
  `LINK_PHONE` varchar(32) DEFAULT NULL,
  `COMP_ADDR` varchar(2048) DEFAULT NULL,
  `MAIL` varchar(32) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `ACCOUNT_ID` varchar(64) DEFAULT NULL,
  `BANK_ID` varchar(32) DEFAULT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_comp_info` */

/*Table structure for table `t_contract` */

DROP TABLE IF EXISTS `t_contract`;

CREATE TABLE `t_contract` (
  `CONTRACT_SID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTRACT_ID` varchar(100) NOT NULL COMMENT '合同编号',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例编号',
  `CONTRACT_TYPE` char(1) NOT NULL COMMENT '1：采购合同 2：销售合同 3：运输合同',
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `SIGN_DATE` datetime NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `DEL_FLAG` char(1) NOT NULL COMMENT '删除标记',
  `CREATE_BY` bigint(20) DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `UPDATE_BY` bigint(20) DEFAULT NULL COMMENT '更新者',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`CONTRACT_SID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='合同编号规则：市公司名称的首字母-承办部门名称的首字母-年月日时间（分）-号码（四位） 示例';

/*Data for the table `t_contract` */

insert  into `t_contract`(`CONTRACT_SID`,`CONTRACT_ID`,`process_instance_id`,`CONTRACT_TYPE`,`STS`,`STS_DATE`,`REMARKS`,`SIGN_DATE`,`START_DATE`,`END_DATE`,`DEL_FLAG`,`CREATE_BY`,`CREATE_DATE`,`UPDATE_BY`,`UPDATE_DATE`) values (2,'Y6643234234',NULL,'1','0','2013-07-16 18:05:50','','2013-07-16 00:00:00','2013-07-16 00:00:00','2015-07-16 00:00:00','0',2,'2013-07-16 18:05:50',2,'2013-07-16 18:05:50');

/*Table structure for table `t_contract_act_info` */

DROP TABLE IF EXISTS `t_contract_act_info`;

CREATE TABLE `t_contract_act_info` (
  `CONTRACT_SID` bigint(20) NOT NULL,
  `ACT_TYPE` char(1) NOT NULL COMMENT '0  审核  1 合同变更 2 合同归档 3 合同作废',
  `ACT_NOTES` varchar(2048) DEFAULT NULL,
  `ACT_STAFF` varchar(6) NOT NULL,
  `ACT_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同变更信息，包括变更，终止合同等';

/*Data for the table `t_contract_act_info` */

/*Table structure for table `t_contract_file` */

DROP TABLE IF EXISTS `t_contract_file`;

CREATE TABLE `t_contract_file` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTRACT_SID` bigint(20) NOT NULL,
  `FILE_TYPE` char(1) DEFAULT NULL,
  `FILE_URL` varchar(256) DEFAULT NULL,
  `FILE_NAME` varchar(256) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='记录合同相关文件信息。上传合同副本';

/*Data for the table `t_contract_file` */

insert  into `t_contract_file`(`ID`,`CONTRACT_SID`,`FILE_TYPE`,`FILE_URL`,`FILE_NAME`,`STS`,`STS_DATE`) values (1,1,NULL,'/upload/Y6643234234/2013071612310914632571225817.zip','2012年终工作总结模板.pptx','0','2013-07-16 12:31:09'),(2,1,NULL,'/upload/Y6643234234/201307161436139238911245256.zip','220417mhwhw4ic7necmnhx.jpg','0','2013-07-16 14:36:13'),(3,1,NULL,'/upload/Y6643234234/201307161506343228711407974.zip','CUC引领专家申请自荐材料－刘庆宇.ppt','0','2013-07-16 15:06:34');

/*Table structure for table `t_contract_info` */

DROP TABLE IF EXISTS `t_contract_info`;

CREATE TABLE `t_contract_info` (
  `CONTRACT_SID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTRACT_ID` varchar(100) NOT NULL COMMENT '合同编号',
  `PROCESS_INSTANCE_ID` varchar(64) DEFAULT NULL COMMENT '流程实例编号',
  `CONTRACT_TYPE` char(1) NOT NULL COMMENT '1：采购合同 2：销售合同 3：运输合同',
  `SUPPLY_ID` bigint(20) DEFAULT NULL,
  `DEMAND_ID` bigint(20) DEFAULT NULL,
  `COAL_TYPE` char(1) DEFAULT NULL COMMENT '煤种',
  `CALORIE` int(10) DEFAULT NULL COMMENT '热卡',
  `PRICE` int(10) DEFAULT NULL COMMENT '执行单价',
  `DELIVERY_PLACE` varchar(255) DEFAULT NULL COMMENT '交货地点',
  `TAX_FLAG` char(1) DEFAULT NULL COMMENT '是否含税 0:不含  1:含',
  `PAY_MODE` varchar(6) DEFAULT NULL COMMENT '结算方式',
  `TRANS_TYPE` varchar(6) DEFAULT NULL COMMENT '运输类型',
  `PAY_TYPE` varchar(6) DEFAULT NULL COMMENT '结算类型',
  `NUMBER` bigint(20) DEFAULT NULL,
  `AMOUNT` bigint(20) DEFAULT NULL COMMENT '单位(分)',
  `FEE_STS` char(1) DEFAULT NULL COMMENT '0：已收 1：已付 2：未收 3：未付',
  `FEE_ITEM_ID` int(11) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `SIGN_DATE` datetime NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `DEL_FLAG` char(1) NOT NULL COMMENT '删除标记',
  `CREATE_BY` bigint(20) DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `UPDATE_BY` bigint(20) DEFAULT NULL COMMENT '更新者',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`CONTRACT_SID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='合同编号规则：市公司名称的首字母-承办部门名称的首字母-年月日时间（分）-号码（四位） 示例';

/*Data for the table `t_contract_info` */

insert  into `t_contract_info`(`CONTRACT_SID`,`CONTRACT_ID`,`PROCESS_INSTANCE_ID`,`CONTRACT_TYPE`,`SUPPLY_ID`,`DEMAND_ID`,`COAL_TYPE`,`CALORIE`,`PRICE`,`DELIVERY_PLACE`,`TAX_FLAG`,`PAY_MODE`,`TRANS_TYPE`,`PAY_TYPE`,`NUMBER`,`AMOUNT`,`FEE_STS`,`FEE_ITEM_ID`,`STS`,`STS_DATE`,`REMARKS`,`SIGN_DATE`,`START_DATE`,`END_DATE`,`DEL_FLAG`,`CREATE_BY`,`CREATE_DATE`,`UPDATE_BY`,`UPDATE_DATE`) values (2,'Y6643234234',NULL,'1',1,2,'1',23456,4000,'内蒙古新欢广场','1','1','1','1',1000,5000000000,NULL,NULL,'0','2013-07-16 16:23:14','','2013-07-16 00:00:00','2013-07-16 00:00:00','2015-07-16 00:00:00','0',NULL,NULL,2,'2013-07-16 16:23:14');

/*Table structure for table `t_contract_item` */

DROP TABLE IF EXISTS `t_contract_item`;

CREATE TABLE `t_contract_item` (
  `CONTRACT_SID` bigint(20) NOT NULL,
  `ATTR_ID` varchar(256) NOT NULL,
  `ATTR_VALUE` varchar(1024) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同属性信息 交货地点：DELI_PLACE 是否含税：TAX_FLAG  0：含 1：不含\n                                     ';

/*Data for the table `t_contract_item` */

/*Table structure for table `t_contract_purchase` */

DROP TABLE IF EXISTS `t_contract_purchase`;

CREATE TABLE `t_contract_purchase` (
  `CONTRACT_SID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUPPLY_ID` bigint(20) DEFAULT NULL,
  `DEMAND_ID` bigint(20) DEFAULT NULL,
  `COAL_TYPE` char(1) DEFAULT NULL COMMENT '煤种',
  `CALORIE` int(10) DEFAULT NULL COMMENT '热卡',
  `PRICE` int(10) DEFAULT NULL COMMENT '执行单价',
  `DELIVERY_PLACE` varchar(255) DEFAULT NULL COMMENT '交货地点',
  `TAX_FLAG` char(1) DEFAULT NULL COMMENT '是否含税 0:不含  1:含',
  `PAY_MODE` varchar(6) DEFAULT NULL COMMENT '结算方式',
  `NUMBER` bigint(20) DEFAULT NULL,
  `AMOUNT` bigint(20) DEFAULT NULL COMMENT '单位(分)',
  PRIMARY KEY (`CONTRACT_SID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='合同编号规则：市公司名称的首字母-承办部门名称的首字母-年月日时间（分）-号码（四位） 示例';

/*Data for the table `t_contract_purchase` */

insert  into `t_contract_purchase`(`CONTRACT_SID`,`SUPPLY_ID`,`DEMAND_ID`,`COAL_TYPE`,`CALORIE`,`PRICE`,`DELIVERY_PLACE`,`TAX_FLAG`,`PAY_MODE`,`NUMBER`,`AMOUNT`) values (2,1,2,'1',23456,4000,'内蒙古新欢广场','0','1',1000,5000000000);

/*Table structure for table `t_cust` */

DROP TABLE IF EXISTS `t_cust`;

CREATE TABLE `t_cust` (
  `CUST_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_cust` */

/*Table structure for table `t_cust_rostor` */

DROP TABLE IF EXISTS `t_cust_rostor`;

CREATE TABLE `t_cust_rostor` (
  `CUST_ROSTER_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_cust_rostor` */

/*Table structure for table `t_cust_score` */

DROP TABLE IF EXISTS `t_cust_score`;

CREATE TABLE `t_cust_score` (
  `CUST_SCORE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_cust_score` */

/*Table structure for table `t_fee_item` */

DROP TABLE IF EXISTS `t_fee_item`;

CREATE TABLE `t_fee_item` (
  `FEE_ITEM_ID` bigint(20) NOT NULL,
  `FEE_TYPE` varchar(6) NOT NULL COMMENT '01：采购煤款付款 02：采购煤款预付款 03：其他款项 11：销售煤款收款 12：销售煤款预收款 13:：其他款项 03：运输款',
  `PRE_FLAG` char(1) DEFAULT NULL,
  `OLD_FEE` int(11) DEFAULT NULL,
  `FEE` int(11) DEFAULT NULL,
  `PAY_TYPE` char(1) DEFAULT NULL COMMENT '0：正常支付 1:在线支付',
  `PAY_ID` int(11) DEFAULT NULL,
  `AUDIT_STS` char(1) DEFAULT NULL COMMENT '0： 未审核 1：已提交审核 2：审核通过 3：审核不通过',
  `AUDIT_ID` int(11) DEFAULT NULL,
  `FEE_STAFF_ID` varchar(6) NOT NULL,
  `FEE_DATE` datetime NOT NULL,
  `CONTRACT_SID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财务收付款，涉及所有费用记录流水。';

/*Data for the table `t_fee_item` */

/*Table structure for table `t_fee_type` */

DROP TABLE IF EXISTS `t_fee_type`;

CREATE TABLE `t_fee_type` (
  `FEE_TYPE` varchar(6) NOT NULL COMMENT '01：采购煤款付款 02：采购煤款预付款 03：其他款项 11：销售煤款收款 12：销售煤款预收款 13:：其他款项  03：运输款',
  `FEE_TYPE_NAME` varchar(32) NOT NULL,
  `PARENT_FEE_TYPE` varchar(6) DEFAULT NULL COMMENT '1：采购费用 2：销售费用 3：运输费用 4：其他费用',
  `PARENT_FEE_TYPE_NAME` varchar(32) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包括所有款项，煤款采购收付款，煤款销售收付款，运输收付款等。';

/*Data for the table `t_fee_type` */

/*Table structure for table `t_load_item` */

DROP TABLE IF EXISTS `t_load_item`;

CREATE TABLE `t_load_item` (
  `LOAD_ITEM_ID` bigint(20) NOT NULL,
  `TICKET_U_ID` bigint(20) NOT NULL,
  `SEND_TYPE` char(1) DEFAULT NULL COMMENT '1：发往货场 2：发往港口 3：发往客户 4：发往其他',
  `FIELD_ID` varchar(32) DEFAULT NULL,
  `LOAD_DATE` datetime DEFAULT NULL,
  `COAL_TYPE_ID` varchar(6) DEFAULT NULL COMMENT '无烟煤	WY\n             贫煤	PM\n             贫瘦煤	PS\n             瘦煤	SM\n             焦煤	JM\n             肥煤	FM\n             1/3焦煤	1/3JM\n             气肥煤	QF\n             气煤	QM\n             1/2中粘煤	1/2ZN\n             弱粘煤	RN\n             不粘煤	BN\n             长焰煤	CY\n             褐煤	HM\n             ',
  `AGENT` varchar(32) DEFAULT NULL,
  `SMS_FLAG` char(1) DEFAULT NULL,
  `SMS_PERSION` varchar(32) DEFAULT NULL,
  `SMS_PHONE` varchar(12) DEFAULT NULL,
  `SMS_NOTE` varchar(2048) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_load_item` */

/*Table structure for table `t_stock` */

DROP TABLE IF EXISTS `t_stock`;

CREATE TABLE `t_stock` (
  `STOCK_ID` bigint(20) NOT NULL COMMENT '前二位是大类，后三位是商品名称，后二位或三位是规格',
  `STOCK_TYPE` varchar(6) NOT NULL,
  `FIELD_ID` varchar(32) DEFAULT NULL,
  `STORAGE_ID` varchar(32) DEFAULT NULL,
  `BATCH_ID` int(11) DEFAULT NULL,
  `COAL_NUM` int(11) DEFAULT NULL,
  `UNIT` varchar(6) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT NULL COMMENT '单位(分)',
  `MAX_MUM` int(11) DEFAULT NULL,
  `MIN_MUM` int(11) DEFAULT NULL,
  `CURR_MUM` int(11) DEFAULT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_stock` */

/*Table structure for table `t_stock_check` */

DROP TABLE IF EXISTS `t_stock_check`;

CREATE TABLE `t_stock_check` (
  `CHECK_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_stock_check` */

/*Table structure for table `t_ticker_detail` */

DROP TABLE IF EXISTS `t_ticker_detail`;

CREATE TABLE `t_ticker_detail` (
  `TICKET_DETAIL_ID` bigint(20) NOT NULL,
  `TICKET_ID` bigint(20) NOT NULL,
  `UNIT` varchar(6) DEFAULT NULL,
  `COAL_PRICE_ID` int(11) DEFAULT NULL,
  `COAL_CALOR` varchar(32) DEFAULT NULL,
  `TRUCK_TEAM` varchar(24) DEFAULT NULL,
  `PLATE_NO` varchar(32) DEFAULT NULL,
  `GROSS_WEIGHT` varchar(32) DEFAULT NULL,
  `TARE_WEIGHT` varchar(32) DEFAULT NULL,
  `NET_WEIGHT` varchar(32) DEFAULT NULL,
  `TO_GROSS_WEIGHT` varchar(32) DEFAULT NULL,
  `TO_TARE_WEIGHT` varchar(32) DEFAULT NULL,
  `TO_NET_WEIGHT` varchar(32) DEFAULT NULL,
  `LOSS_TON` varchar(32) DEFAULT NULL,
  `SURP_TON` varchar(32) DEFAULT NULL,
  `CUT_TON` varchar(32) DEFAULT NULL,
  `CUT_STAND` varchar(32) DEFAULT NULL,
  `BALANCE_TON` varchar(32) DEFAULT NULL,
  `CUT_NUM` int(11) DEFAULT NULL,
  `CHARGE` int(11) DEFAULT NULL,
  `BALANCE_FEE` int(11) DEFAULT NULL,
  `TRANS_FEE` int(11) DEFAULT NULL,
  `BALANCE_FRE` int(11) DEFAULT NULL,
  `CHECK_STAFF` varchar(32) DEFAULT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_ticker_detail` */

/*Table structure for table `t_ticket` */

DROP TABLE IF EXISTS `t_ticket`;

CREATE TABLE `t_ticket` (
  `TICKET_ID` bigint(20) NOT NULL,
  `ACT_TYPE` char(1) NOT NULL COMMENT '0  审核  1 合同变更 2 合同归档 3 合同作废',
  `BATCH_ID` int(11) DEFAULT NULL,
  `CUST_ID` bigint(20) DEFAULT NULL,
  `CONTRACT_ID` bigint(20) DEFAULT NULL,
  `TICKET_U_ID` bigint(20) DEFAULT NULL,
  `SEND_ID` int(11) DEFAULT NULL,
  `POND_ID` bigint(20) DEFAULT NULL,
  `BALANCE_TON` varchar(32) DEFAULT NULL,
  `BALANCE_FEE` int(11) DEFAULT NULL,
  `BALANCE_FRE` int(11) DEFAULT NULL,
  `AGENT` varchar(32) DEFAULT NULL,
  `AGENT_LINK` varchar(12) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ACT_TYPE  1：入库 2：出库';

/*Data for the table `t_ticket` */

/*Table structure for table `t_ticket_item` */

DROP TABLE IF EXISTS `t_ticket_item`;

CREATE TABLE `t_ticket_item` (
  `TICKET_ID` bigint(20) NOT NULL,
  `ATTR_ID` varchar(256) NOT NULL,
  `ATTR_VALUE` varchar(1024) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_ticket_item` */

/*Table structure for table `t_ticket_pond` */

DROP TABLE IF EXISTS `t_ticket_pond`;

CREATE TABLE `t_ticket_pond` (
  `POND_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_ticket_pond` */

/*Table structure for table `t_trans` */

DROP TABLE IF EXISTS `t_trans`;

CREATE TABLE `t_trans` (
  `TRANS_ID` bigint(20) NOT NULL,
  `TICKET_ID` bigint(20) DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_trans` */

/*Table structure for table `t_trans_info` */

DROP TABLE IF EXISTS `t_trans_info`;

CREATE TABLE `t_trans_info` (
  `TRANS_TYPE_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_trans_info` */

/*Table structure for table `t_trans_price` */

DROP TABLE IF EXISTS `t_trans_price`;

CREATE TABLE `t_trans_price` (
  `TRANS_PRICE_ID` bigint(20) NOT NULL,
  `TRANS_PRICE_TYPE` char(1) NOT NULL COMMENT '1：煤矿-煤场 2：煤矿-港口 3：煤矿-客户 4：煤场-煤场 5：煤场-港口 6：煤场-客户',
  `COAL_FACTORY_TYPE` varchar(12) DEFAULT NULL,
  `TRANS_PRICE_OLD` varchar(8) DEFAULT NULL,
  `TRANS_PRICE` varchar(8) NOT NULL,
  `SMS_FLAG` char(1) DEFAULT NULL,
  `RECEIVER` varchar(24) DEFAULT NULL,
  `NOTICE` longtext,
  `START_DATE` datetime DEFAULT NULL,
  `STS` char(1) NOT NULL COMMENT '0：已审核  1：已签订 2：执行中 3：已到期 4：已作废 5：已违约 6:归档 7:已关联',
  `STS_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_trans_price` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
