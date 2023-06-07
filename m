Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD651ACD0
	for <linux-coco@lists.linux.dev>; Wed,  7 Jun 2023 15:07:03 +0000 (UTC)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357EimsU006374
	for <linux-coco@lists.linux.dev>; Wed, 7 Jun 2023 15:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Kx8Arlwwh5gsbst3RgbQwy7nHAXB3fhzX3CxHEc4EsA=;
 b=TAbwB6l3tc/GaJQjnWUSjCfsaeBEhtm07rwga7JwKqIII1mWbWA5Kzb+Y3rXom3/68wo
 73/4nwf7KexgwXOjNBWgnSBQTtYE47pzkn7JLqFC7fzVGrOPOVv/YkD85kzfiUHHS8YE
 4YFg85ouOgv7Q3r2W6MUe5cAc+qjjeUnxAQYArUJcRFvmi34JJ+FA9iyuwlYkivTIekw
 DNvVRMpKeXsda5GPW+c8t9v9n5H5Cj7fd3dmYIkWnUUI4VQtz+9awaa+9SyjF6EChJTd
 CZpRqXw+r5SI40UHv3X2IJ1HuYcPjRpgiYU3Qk51sfei0VcGw+sdZG3rsAja7EKfehl4 lQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2uww8ny1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 07 Jun 2023 15:06:56 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3577JWWv024244
	for <linux-coco@lists.linux.dev>; Wed, 7 Jun 2023 15:06:55 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3r2a761hn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 07 Jun 2023 15:06:55 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 357F6sbe62915022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 15:06:54 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 694005805C;
	Wed,  7 Jun 2023 15:06:54 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22A635805A;
	Wed,  7 Jun 2023 15:06:53 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.148.32.97])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 15:06:52 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: linux-coco@lists.linux.dev
Cc: Dov Murik <dovmurik@linux.ibm.com>,
        Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: [RFC PATCH 1/3] x86/sev: Add __svsm_msr_protocol_2() which returns register values
Date: Wed,  7 Jun 2023 18:06:44 +0300
Message-Id: <20230607150646.97208-2-dovmurik@linux.ibm.com>
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
X-Proofpoint-GUID: Fvp62p30b8uq3E2XBA3nVBz5gVOsvKJF
X-Proofpoint-ORIG-GUID: Fvp62p30b8uq3E2XBA3nVBz5gVOsvKJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_07,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=959 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070128

Existing function __svsm_msr_protocol() performs an SVSM call but
returns only the value of rax.

Complex SVSM calls (like SVSM_ATTEST_SERVICES) may return several
values: in rax, rcx, rdx, r8, and r9.  The new call allows callers to
get all these values.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 arch/x86/kernel/sev-shared.c | 49 ++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index d989b1add933..1e4960cf1e6e 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -115,6 +115,55 @@ static int __svsm_msr_protocol(struct svsm_caa *caa, u64 rax, u64 rcx, u64 rdx,
 	return ret;
 }
 
+static int __svsm_msr_protocol_2(struct svsm_caa *caa, u64 *rax, u64 *rcx, u64 *rdx,
+				 u64 *r8, u64 *r9)
+{
+	u64 val, resp;
+	u8 pending;
+	int ret;
+	u64 rax_ret, rcx_ret, rdx_ret, r8_ret, r9_ret;
+
+	val = sev_es_rd_ghcb_msr();
+
+	sev_es_wr_ghcb_msr(GHCB_MSR_VMPL_REQ_LEVEL(0));
+
+	asm volatile("mov %8, %%r8\n\t"
+		     "mov %9, %%r9\n\t"
+		     "movb $1, %10\n\t"
+		     "rep; vmmcall\n\t"
+		     "mov %%r8, %3\n\t"
+		     "mov %%r9, %4\n\t"
+		     : "=a" (rax_ret), "=c" (rcx_ret), "=d" (rdx_ret), "=r" (r8_ret), "=r" (r9_ret)
+		     : "a" (*rax), "c" (*rcx), "d" (*rdx), "r" (*r8), "r" (*r9),
+		       "m" (caa->call_pending) : );
+
+	resp = sev_es_rd_ghcb_msr();
+
+	sev_es_wr_ghcb_msr(val);
+	ret = (int)rax_ret;
+
+	pending = 0;
+	asm volatile("xchgb %0, %1" : "+r" (pending) : "m" (caa->call_pending) : "memory");
+	if (pending)
+		ret = -EINVAL;
+
+	if (GHCB_RESP_CODE(resp) != GHCB_MSR_VMPL_RESP)
+		ret = -EINVAL;
+
+	if (GHCB_MSR_VMPL_RESP_VAL(resp) != 0)
+		ret = -EINVAL;
+
+	if (ret != -EINVAL) {
+		*rax = rax_ret;
+		*rcx = rcx_ret;
+		*rdx = rdx_ret;
+		*r8 = r8_ret;
+		*r9 = r9_ret;
+	}
+
+	return ret;
+}
+
 static bool __init sev_es_check_cpu_features(void)
 {
 	if (!has_cpuflag(X86_FEATURE_RDRAND)) {
-- 
2.35.3

