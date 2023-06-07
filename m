Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520181ACBB
	for <linux-coco@lists.linux.dev>; Wed,  7 Jun 2023 15:07:01 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357Et9A9031807
	for <linux-coco@lists.linux.dev>; Wed, 7 Jun 2023 15:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ZBceJGUL9bX8Hoc6vTE35Fx5tlxCDolyHPSk5E+InRE=;
 b=hfpI9i76Pr1EbGDJ7BU/jv6iS+0vDxEuZuBkUur2YtEgTlzkAGYmM6tQVL983QPIxhNf
 mnH5+5ASQbjG1PNcIOnv+ERY4LtI6FxavMt5DH7FLhjIq8uRYuTIXTl1YRGWpJ8kD2aK
 vXCVtow/BAuhxZDk4jEqE7Oz6M2MUSYeMjlr1SqP+yUQXmiMWaN/vX48eMJjuWclgQSe
 5lg7xPfDUaPeyjOVKGlsSDzd56ACsEJ9yMNcx3ztgmfmiVcoz3qA/K76SJ5diEcFoVpL
 x8c8MZSChukvIIFReP8rgouJ5qAl79OKXyFPvwDdvNIwC1UW+DS7oQH29Uwktl1LO+Be AQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2v328dc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 07 Jun 2023 15:06:54 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3577CBNY024240
	for <linux-coco@lists.linux.dev>; Wed, 7 Jun 2023 15:06:54 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3r2a761hn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 07 Jun 2023 15:06:54 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 357F6qN151708246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 15:06:52 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E26A5805C;
	Wed,  7 Jun 2023 15:06:52 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B47515805A;
	Wed,  7 Jun 2023 15:06:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.148.32.97])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 15:06:50 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: linux-coco@lists.linux.dev
Cc: Dov Murik <dovmurik@linux.ibm.com>,
        Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: [RFC PATCH 0/3] Retrieve SNP attestation from SVSM
Date: Wed,  7 Jun 2023 18:06:43 +0300
Message-Id: <20230607150646.97208-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5aUrxmYAqz1nf9rRlb2GdS-S2WZo34YM
X-Proofpoint-ORIG-GUID: 5aUrxmYAqz1nf9rRlb2GdS-S2WZo34YM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_07,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=939 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306070128

This is an initial attempt to allow userspace to fetch attestation
report from SVSM on SNP.  It was tested with AMD's linux-svsm to which
we added support for the attestation protocol.  The kernel patches in
this series only expose the SVSM_ATTEST_SERVICES function, for now.

The request for the attestation report is exposed to userspace as a new
ioctl call (SNP_SVSM_ATTEST_SERVICES) on /dev/sev-guest.  It returns the
VMPL0 attestation report, the services manifest, and the host
certificate chain, according to the SVSM spec.

Note that the existing SNP_GET_REPORT and SNP_GET_EXT_REPORT calls still
work under SVSM, as long as a VMPL1 report is requested.

This series should be applied on top of AMD's SVSM guest tree:
https://github.com/AMDESE/linux/tree/svsm-preview-guest

The SVSM code which supports the attestation protocol is in:
https://github.com/svsm-vtpm/linux-svsm/tree/attestation-protocol-v2
(as of writing, it hasn't yet been merged to AMD's linux-svsm.)

Dov Murik (3):
  x86/sev: Add __svsm_msr_protocol_2() which returns register values
  x86/sev: Add snp_svsm_attest_services()
  virt: sevguest: Add support to get attestation report from SVSM

 arch/x86/include/asm/sev.h            | 26 ++++++++
 arch/x86/kernel/sev-shared.c          | 49 ++++++++++++++
 arch/x86/kernel/sev.c                 | 46 +++++++++++++
 drivers/virt/coco/sevguest/sevguest.c | 95 +++++++++++++++++++++++++++
 include/uapi/linux/sev-guest.h        | 34 ++++++++++
 5 files changed, 250 insertions(+)

-- 
2.35.3

