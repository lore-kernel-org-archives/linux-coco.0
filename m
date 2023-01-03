Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063F48F6B
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 21:04:05 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303KpMXZ022623
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=idWNCyO6OwR2ACZwis77WGrFCX+y6PtlF9nQh05/BGM=;
 b=KOwVwvEFfTLoaxOkPVp5LTGSL2tHG1b2XL0FdmhQozSqrwevLsogWc/K73/tG+0Ajtje
 2PnbjCzZJHoKR8PUucUYYzWbq9dqtu5YMkEVbUtrOcn0uIh/c/H/PUjCPz4fPsmEDxpw
 aEuDySUMOQuCACXR2PDcdez0NJIv6UW0/FQGzrjNFiYD/DYTop7LdL2DaKAC2H4KucBy
 IMcYHRMcrn8tuh9/5FbjmAwIeyBenXTFoPWbxVDt+7lHwokWTr3fXDl982qM+GaJDbu6
 ABvz4KL/Ao6/uLSq5i3zU0b/2Ip4c/IgJ/dJyB3NnuYSC9iJrMqiiTE1wGRZ3oDSzFV7 FA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvjd76h7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 03 Jan 2023 21:04:05 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 303K66oe007448
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:04:04 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3mtcq88vnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 03 Jan 2023 21:04:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 303L42pB50856206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:04:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B40407805E
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:36:28 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 578DC7805F
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:36:28 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.64.53])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:36:28 +0000 (GMT)
Message-ID: <83bcfc398d885f9e42d5aae42359fe02ab12d306.camel@linux.ibm.com>
Subject: [RFC 2/2] x86/sev: add a SVSM vTPM platform device
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: linux-coco@lists.linux.dev
Date: Tue, 03 Jan 2023 16:04:00 -0500
In-Reply-To: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
References: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NOwika58uRzTiGiIoSpcL8LvdaobZqmw
X-Proofpoint-GUID: NOwika58uRzTiGiIoSpcL8LvdaobZqmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_07,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=851 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301030178

From: James Bottomley <James.Bottomley@HansenPartnership.com>

If the SNP boot has a SVSM, probe for the vTPM device by sending a
call to SVSM function 8 with no arguments.  If this returns
successfully, the vTPM is present in the SVSM (If the SVSM doesn't
have a vTPM, this call should return SVSM_ERR_UNSUPPORTED_CALLID).

If a vTPM is found, register a platform device as "platform:tpm" so it
can be attached to the tpm_platform.c driver.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 arch/x86/kernel/sev.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 0297077f7602..276568b1f01a 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -21,6 +21,7 @@
 #include <linux/cpumask.h>
 #include <linux/efi.h>
 #include <linux/platform_device.h>
+#include <linux/tpm_platform.h>
 #include <linux/io.h>
 
 #include <asm/cpu_entry_area.h>
@@ -2426,6 +2427,11 @@ static struct platform_device guest_req_device = {
 	.id		= -1,
 };
 
+static struct platform_device tpm_device = {
+	.name		= "tpm",
+	.id		= -1,
+};
+
 static u64 get_secrets_page(void)
 {
 	u64 pa_data = boot_params.cc_blob_address;
@@ -2450,10 +2456,19 @@ static u64 get_secrets_page(void)
 	return info.secrets_phys;
 }
 
+static int tpm_send_buffer(u8 *buffer)
+{
+	struct svsm_caa *caa;
+
+	caa = this_cpu_read(svsm_caa);
+	return __svsm_msr_protocol(caa, 8, __pa(buffer), 0, 0, 0);
+}
+
 static int __init snp_init_platform_device(void)
 {
 	struct snp_guest_platform_data data;
 	u64 gpa;
+	struct svsm_caa *caa = this_cpu_read(svsm_caa);
 
 	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
 		return -ENODEV;
@@ -2470,6 +2485,24 @@ static int __init snp_init_platform_device(void)
 		return -ENODEV;
 
 	pr_info("SNP guest platform device initialized.\n");
+
+	/* 
+	 * The VTPM device is available only if we have a SVSM and it
+	 * probes correctly (probe is to send a call with no arguments
+	 * to function 8 and see it comes back as OK)
+	 */
+	if (IS_ENABLED(CONFIG_TCG_PLATFORM) && svsm_vmpl &&
+	    __svsm_msr_protocol(caa, 8, 0, 0, 0, 0) == 0) {
+		struct tpm_platform_ops pops = {
+			.sendrcv = tpm_send_buffer,
+		};
+
+		if (platform_device_add_data(&tpm_device, &pops, sizeof(pops)))
+			return -ENODEV;
+		if (platform_device_register(&tpm_device))
+			return -ENODEV;
+		pr_info("SNP SVSM VTPM platform device initialized\n");
+	}
 	return 0;
 }
 device_initcall(snp_init_platform_device);
-- 
2.35.3


