Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A81A8BE9
	for <linux-coco@lists.linux.dev>; Sat, 14 Jan 2023 18:22:53 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30EGZ2UE030654;
	Sat, 14 Jan 2023 18:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=Uw1wTkZiktg0k17F5uplC2ASZKB3ZZ/3Txgf+pL6RLE=;
 b=WXtCrwwPW2CxZ9GQhgJJ1mPAy3XF0kZZerEimItCbABQHJyl/yNOOH3k9vV0VRGiwkwY
 ay07+LUdlsKt6NtTNSsFVGdHzbCdxWGzo+DwXXCOAg3zOWSWzEVt51kXngg8Y2FExK3v
 Klfxrcv60NkGiryppuWvVIyruFnSFK8HFB/Kkae1LxZ8uu7kxiBciL573woXElXZqMmS
 TZPBnfB2GNjpE9A/VFrQn/BCjg+r3jIzgjUUMvmiEuSpultp2MpjL6sSVyk2tyoga+Zn
 o9ISKFOe+JsKXAxKmLRBm+7bqJ1qsyGql6BAT/67NIT0qxAmbfdiZl2Pkd2Qv9Dso1ty 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n401s973b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jan 2023 18:22:46 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30EIKQiQ034056;
	Sat, 14 Jan 2023 18:22:45 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n401s972y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jan 2023 18:22:45 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30EHE5FC018337;
	Sat, 14 Jan 2023 18:22:45 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3n3m16krmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jan 2023 18:22:45 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30EIMhxr41746790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Jan 2023 18:22:44 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE1F17805E;
	Sat, 14 Jan 2023 20:02:45 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 103847805C;
	Sat, 14 Jan 2023 20:02:44 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.128.24])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Sat, 14 Jan 2023 20:02:44 +0000 (GMT)
Message-ID: <45342f9ca1170817b2f741b35a5b0b2c85dc72c6.camel@linux.ibm.com>
Subject: Re: SVSM initiated early attestation / guest secrets injection
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>,
        "Daniel P."
	=?ISO-8859-1?Q?Berrang=E9?=
	 <berrange@redhat.com>
Cc: linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Date: Sat, 14 Jan 2023 13:22:41 -0500
In-Reply-To: <Y8Lhd/H4yGTsOM/+@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com> <Y8GTXpfqlOe53cEr@suse.de>
	 <Y8Gi0KLj5JbhCqBE@redhat.com> <Y8Lhd/H4yGTsOM/+@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QzuuGPi1600-0_eteAcCpa6uV0zifLWS
X-Proofpoint-ORIG-GUID: tUhSYFIRLT9YSShJvCYQ-cplDgJf_VaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-14_06,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=819 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301140132

On Sat, 2023-01-14 at 18:08 +0100, Jörg Rödel wrote:

[...]
> As James also said, the measurement to unlock secrets need to include
> all software/data components up to the point where the encrypted disk
> gets mounted.

Well, we have a prototype in IBM Research using keylime to do this
based on the vTPM measurements.  We currently bring up a network
interface inside the initrd to run the keylime agent, but if you're
already inventing a non-network method for attestation, there's no
reason we couldn't transport TPM quotes over it as well.

James
 
