Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5204F1ACCC
	for <linux-coco@lists.linux.dev>; Wed,  7 Jun 2023 15:07:02 +0000 (UTC)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357ErbLF012470
	for <linux-coco@lists.linux.dev>; Wed, 7 Jun 2023 15:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ke56fl3lxP7JfgQULmGdBnlosEP3YT8lAP1Sp75TJ60=;
 b=tKyPjaz217+P70NhLHzVmoqIYnogYRlOqzxbf3W4TmLsr6uNOO/2w3sqLxe261JdHFbG
 xrpAff9HCk+5v11X9dvjiP8b0xA8j+bliWzHGn3xk2Wfrv4dipjU3wQh+UE4tOdy9rx/
 FECzcVuo7pb8Jc2nrdkKF3k+ADpG+g1c8KjIhnEPm7pO8mbrd68xngaGn+4ZYNtt0OGw
 XVBFQ+jZHg9yv0jBjWwGny6t+mkPfY3MDFIBj3JiiuXm1fc9IBH9HJhdu0BKCsF7uu/m
 s9m7h/jeAAw59g42xVSW69/ACOcu+qhRKyWOelIB+7iHi65wmgu1Ljz10yvGzggHa0yI UQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2v2brcvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 07 Jun 2023 15:07:01 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 357Bxp4O008323
	for <linux-coco@lists.linux.dev>; Wed, 7 Jun 2023 15:07:01 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3r2a7846n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 07 Jun 2023 15:07:01 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 357F6xkk62587388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 15:06:59 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 558F05805E;
	Wed,  7 Jun 2023 15:06:59 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F08758051;
	Wed,  7 Jun 2023 15:06:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.148.32.97])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 15:06:57 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: linux-coco@lists.linux.dev
Cc: Dov Murik <dovmurik@linux.ibm.com>,
        Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: [RFC PATCH 3/3] virt: sevguest: Add support to get attestation report from SVSM
Date: Wed,  7 Jun 2023 18:06:46 +0300
Message-Id: <20230607150646.97208-4-dovmurik@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 4cF-zfrDrwtbwAqEg08gG2WVPyNsmxNS
X-Proofpoint-GUID: 4cF-zfrDrwtbwAqEg08gG2WVPyNsmxNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_07,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070128

Expose SNP_SVSM_ATTEST_SERVICES ioctl function which allows userspace to
retrieve SNP attestation report.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 drivers/virt/coco/sevguest/sevguest.c | 95 +++++++++++++++++++++++++++
 include/uapi/linux/sev-guest.h        | 34 ++++++++++
 2 files changed, 129 insertions(+)

diff --git a/drivers/virt/coco/sevguest/sevguest.c b/drivers/virt/coco/sevguest/sevguest.c
index 0c6d1d05b9e7..a1c4acec679f 100644
--- a/drivers/virt/coco/sevguest/sevguest.c
+++ b/drivers/virt/coco/sevguest/sevguest.c
@@ -510,6 +510,97 @@ static int get_ext_report(struct snp_guest_dev *snp_dev, struct snp_guest_reques
 	return ret;
 }
 
+static int call_svsm_attest_services(struct snp_guest_dev *snp_dev,
+				     struct snp_guest_request_ioctl *arg)
+{
+	struct snp_svsm_attest_services_req req;
+	struct snp_svsm_attest_services_resp *resp;
+	int ret;
+	struct page *page;
+	u8 *nonce, *report, *services_manifest, *certs;
+	u32 report_size, services_manifest_size, certs_size;
+
+	if (!arg->req_data || !arg->resp_data)
+		return -EINVAL;
+
+	if (copy_from_user(&req, (void __user *)arg->req_data, sizeof(req)))
+		return -EFAULT;
+
+	if (!access_ok(req.certs_address, req.certs_len))
+		return -EFAULT;
+
+	/*
+	 * Since we're allocating 32 bytes, the buffer is ensured to not cross
+	 * a page boundary.
+	 */
+	nonce = kzalloc(sizeof(req.nonce), GFP_KERNEL_ACCOUNT);
+	if (!nonce)
+		return -EFAULT;
+	memcpy(nonce, req.nonce, sizeof(req.nonce));
+
+	/* The report buffer passed to SVSM must be 4KB aligned */
+	page = alloc_pages(GFP_KERNEL_ACCOUNT, get_order(sizeof(resp->report)));
+	if (IS_ERR(page)) {
+		ret = -EFAULT;
+		goto free_nonce;
+	}
+	report = page_address(page);
+	report_size = sizeof(resp->report);
+
+	/* The services manifest buffer passed to SVSM must be 4KB aligned */
+	page = alloc_pages(GFP_KERNEL_ACCOUNT,
+			   get_order(sizeof(resp->services_manifest)));
+	if (IS_ERR(page)) {
+		ret = -EFAULT;
+		goto free_report;
+	}
+	services_manifest = page_address(page);
+	services_manifest_size = sizeof(resp->services_manifest);
+
+	/* The certificates buffer passed to SVSM must be 4KB aligned */
+	page = alloc_pages(GFP_KERNEL_ACCOUNT, get_order(req.certs_len));
+	if (IS_ERR(page)) {
+		ret = -EFAULT;
+		goto free_manifest;
+	}
+	certs = page_address(page);
+	certs_size = req.certs_len;
+
+	ret = snp_svsm_attest_services(nonce, sizeof(req.nonce), report,
+				       &report_size, services_manifest,
+				       &services_manifest_size, certs,
+				       &certs_size);
+	if (ret)
+		goto free_certs;
+
+	if (copy_to_user((void __user *)req.certs_address, certs,
+			 req.certs_len)) {
+		ret = -EFAULT;
+		goto free_certs;
+	}
+	resp = kzalloc(sizeof(*resp), GFP_KERNEL_ACCOUNT);
+	resp->report_len = report_size;
+	resp->services_manifest_len = services_manifest_size;
+	resp->certs_len = certs_size;
+	memcpy(resp->services_manifest, services_manifest,
+	       sizeof(services_manifest_size));
+	memcpy(resp->report, report, sizeof(report_size));
+	if (copy_to_user((void __user *)arg->resp_data, resp, sizeof(*resp)))
+		ret = -EFAULT;
+	kfree(resp);
+
+free_certs:
+	free_pages((unsigned long)certs, get_order(req.certs_len));
+free_manifest:
+	free_pages((unsigned long)services_manifest,
+		   get_order(sizeof(resp->services_manifest)));
+free_report:
+	free_pages((unsigned long)report, get_order(sizeof(resp->report)));
+free_nonce:
+	kfree(nonce);
+	return ret;
+}
+
 static long snp_guest_ioctl(struct file *file, unsigned int ioctl, unsigned long arg)
 {
 	struct snp_guest_dev *snp_dev = to_snp_dev(file);
@@ -545,6 +636,9 @@ static long snp_guest_ioctl(struct file *file, unsigned int ioctl, unsigned long
 	case SNP_GET_EXT_REPORT:
 		ret = get_ext_report(snp_dev, &input);
 		break;
+	case SNP_SVSM_ATTEST_SERVICES:
+		ret = call_svsm_attest_services(snp_dev, &input);
+		break;
 	default:
 		break;
 	}
@@ -703,6 +797,7 @@ static int __init snp_guest_probe(struct platform_device *pdev)
 		goto e_free_cert_data;
 
 	dev_info(dev, "Initialized SNP guest driver (using vmpck_id %d)\n", vmpck_id);
+	//do_svsm_attest(dev);
 	return 0;
 
 e_free_cert_data:
diff --git a/include/uapi/linux/sev-guest.h b/include/uapi/linux/sev-guest.h
index 256aaeff7e65..60caf767e024 100644
--- a/include/uapi/linux/sev-guest.h
+++ b/include/uapi/linux/sev-guest.h
@@ -66,6 +66,36 @@ struct snp_ext_report_req {
 	__u32 certs_len;
 };
 
+struct snp_svsm_attest_services_req {
+	/* nonce that should be included in the report */
+	__u8 nonce[32];
+
+	/* where to copy the certificate blob */
+	__u64 certs_address;
+
+	/* length of the certificate buffer */
+	__u32 certs_len;
+};
+
+struct snp_svsm_attest_services_resp {
+	/* length of the returned attestation report */
+	__u32 report_len;
+
+	/* length of the returned services manifest */
+	__u32 services_manifest_len;
+
+	/* length of the returned certificates blob */
+	__u32 certs_len;
+
+	__u8 rsvd[4];
+
+	/* services manifest */
+	__u8 services_manifest[1024];
+
+	/* attestation report, see SEV-SNP spec for the format */
+	__u8 report[3000];
+};
+
 #define SNP_GUEST_REQ_IOC_TYPE	'S'
 
 /* Get SNP attestation report */
@@ -77,4 +107,8 @@ struct snp_ext_report_req {
 /* Get SNP extended report as defined in the GHCB specification version 2. */
 #define SNP_GET_EXT_REPORT _IOWR(SNP_GUEST_REQ_IOC_TYPE, 0x2, struct snp_guest_request_ioctl)
 
+/* Get SVSM attest services report as defined in the SVSM specification */
+#define SNP_SVSM_ATTEST_SERVICES                                               \
+	_IOWR(SNP_GUEST_REQ_IOC_TYPE, 0x3, struct snp_guest_request_ioctl)
+
 #endif /* __UAPI_LINUX_SEV_GUEST_H_ */
-- 
2.35.3

