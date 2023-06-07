Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0423F1ACBB
	for <linux-coco@lists.linux.dev>; Wed,  7 Jun 2023 15:07:06 +0000 (UTC)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357EisYh006523
	for <linux-coco@lists.linux.dev>; Wed, 7 Jun 2023 15:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FXwlcLhVvP/o8HtmxgRSrCdzHJhE2Fnam4asIc+B+Qk=;
 b=Z9JcMOIM2QHKXLHYXk58OY551IbG5FkiaV3X5XnS+jP9Y3EduWxS7lkK6EmemA1FbeE1
 EXJjlTVlvrMqWhW/bw7EFsiuAueWm2SlhDF/fEU34/LpFP4bI1y/Ene652aswi9ZYaqi
 D94tJCFsBse6u6Cvg9ybnyjgiLOaxLvL0ZR1CIeALV4Cc8sXHlK5YxCrLd1x2hUma8Bo
 Xd4PeqKs5RVPtsbpVlZswCHVNBWZT8cI1zm+hdD3pJz2OP2y+ZTMfcGXDjfDqiQTwpMT
 Go1rabe/ILnwH4khPWTV/0nC6oqWLue/XrokkEvE1HBOmxosU7uh4+5Kotz2GPn3ZJ8f 0Q== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2uww8p15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 07 Jun 2023 15:06:59 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 357C1ckP008371
	for <linux-coco@lists.linux.dev>; Wed, 7 Jun 2023 15:06:58 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3r2a7846mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 07 Jun 2023 15:06:58 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 357F6vdF43319780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 15:06:57 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD8215805C;
	Wed,  7 Jun 2023 15:06:56 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96C7A5805A;
	Wed,  7 Jun 2023 15:06:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.148.32.97])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 15:06:55 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: linux-coco@lists.linux.dev
Cc: Dov Murik <dovmurik@linux.ibm.com>,
        Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: [RFC PATCH 2/3] x86/sev: Add snp_svsm_attest_services()
Date: Wed,  7 Jun 2023 18:06:45 +0300
Message-Id: <20230607150646.97208-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230607150646.97208-1-dovmurik@linux.ibm.com>
References: <20230607150646.97208-1-dovmurik@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jWWJTFV3wqTBi2420dcSjk1k4Cxz8py4
X-Proofpoint-ORIG-GUID: jWWJTFV3wqTBi2420dcSjk1k4Cxz8py4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_07,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=743 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070128

Allow retrieving SNP attestation report from SVSM.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 arch/x86/include/asm/sev.h | 26 +++++++++++++++++++++
 arch/x86/kernel/sev.c      | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index c6835bd7af95..5abc8f0e4823 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -177,6 +177,21 @@ struct svsm_pvalidate_call {
 	struct svsm_pvalidate_entry entry[];
 };
 
+struct svsm_attest_services_call {
+	u64 report_address;
+	u32 report_size;
+	u8  reserved_1[4];
+	u64 nonce_address;
+	u16 nonce_size;
+	u8  reserved_2[6];
+	u64 services_manifest_address;
+	u16 services_manifest_size;
+	u8  reserved_3[4];
+	u64 certs_address;
+	u16 certs_size;
+	u8  reserved_4[4];
+};
+
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 extern struct static_key_false sev_es_enable_key;
 extern void __sev_es_ist_enter(struct pt_regs *regs);
@@ -246,6 +261,10 @@ bool snp_init(struct boot_params *bp);
 void snp_abort(void);
 int snp_issue_guest_request(u64 exit_code, struct snp_req_data *input, unsigned long *fw_err);
 int snp_get_vmpl(void);
+int snp_svsm_attest_services(void *nonce, u32 nonce_size,
+			     void *report, u32 *report_size,
+			     void *services_manifest, u32 *services_manifest_size,
+			     void *certs, u32 *certs_size);
 #else
 static inline void sev_es_ist_enter(struct pt_regs *regs) { }
 static inline void sev_es_ist_exit(void) { }
@@ -271,6 +290,13 @@ static inline int snp_issue_guest_request(u64 exit_code, struct snp_req_data *in
 	return -ENOTTY;
 }
 static inline int snp_get_vmpl(void) { return 0; }
+static inline int snp_svsm_attest_services(void *nonce, u32 nonce_size,
+					   void *report, u32 *report_size,
+					   void *services_manifest, u32 *services_manifest_size,
+					   void *certs, u32 *certs_size)
+{
+	return 0;
+}
 #endif
 
 #endif
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 6fe742b31c4e..1a2dd58a485e 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -606,6 +606,52 @@ static void __base_pvalidate_pages(unsigned long vaddr, unsigned int npages, boo
 	}
 }
 
+int snp_svsm_attest_services(void *nonce, u32 nonce_size, void *report,
+			     u32 *report_size, void *services_manifest,
+			     u32 *services_manifest_size, void *certs,
+			     u32 *certs_size)
+{
+	struct svsm_caa *this_caa;
+	unsigned long flags;
+	int ret;
+	struct svsm_attest_services_call *svsm_call;
+	unsigned long svsm_call_gpa;
+	u64 function = (u64)1 << 32 | (u64)0;
+	u64 rax, rcx, rdx, r8, r9;
+
+	local_irq_save(flags);
+
+	this_caa = this_cpu_read(svsm_caa);
+
+	svsm_call = (struct svsm_attest_services_call *)this_caa->svsm_buffer;
+	svsm_call_gpa = __pa(this_caa) + offsetof(struct svsm_caa, svsm_buffer);
+
+	memset(this_caa->svsm_buffer, 0, sizeof(*this_caa->svsm_buffer));
+	svsm_call->report_address = __pa(report);
+	svsm_call->report_size = *report_size;
+	svsm_call->nonce_address = __pa(nonce);
+	svsm_call->nonce_size = nonce_size;
+	svsm_call->services_manifest_address = __pa(services_manifest);
+	svsm_call->services_manifest_size = *services_manifest_size;
+	svsm_call->certs_address = __pa(certs);
+	svsm_call->certs_size = *certs_size;
+
+	rax = function;
+	rcx = svsm_call_gpa;
+	rdx = 0;
+	r8 = 0;
+	r9 = 0;
+	ret = __svsm_msr_protocol_2(this_caa, &rax, &rcx, &rdx, &r8, &r9);
+
+	local_irq_restore(flags);
+
+	*report_size = r8;
+	*services_manifest_size = rcx;
+	*certs_size = rdx;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snp_svsm_attest_services);
+
 static void __svsm_pvalidate_pages(struct svsm_caa *caa, unsigned long caa_gpa,
 				   unsigned long paddr, unsigned int npages, bool validate)
 {
-- 
2.35.3

