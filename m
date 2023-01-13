Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F46BAD4A
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 18:02:37 +0000 (UTC)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30DHehog027721;
	Fri, 13 Jan 2023 18:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=KdtR52tUskRt2rc1l90u9Col5FL/TBa4q1rr/gumkRk=;
 b=EAjIA9X6vzv/H4zKmZ0709R72Y/qAmF+9epmtpt1ofDjrwJCZXaipuq0fNjK+OdwaESM
 0ko5NlaepLOXRopKeMrtUIJzYiJOPqq6sCky7M4BFDal33KP/uUPcA+e5BXIqOjlPURc
 pDV2BPbjzTg5hLzKhnnxXKnpovk5/Ipbf42Q/r0orcUOUvz/Mjlmg4tAN4ln8t/QQVBj
 DCPpqkyyI4wH8LS5ssL3BUr9QSXzOJW+9w/xu58bq8ckLLLJC4qIBCS+4VxQwHhYMVqC
 eavycbY4V85MFUbz66ro0gta1UHObuhdejZTb4pWHXaI3z1RvDgcvog7iIbyxG///sCT tA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n38uh5dm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 18:02:36 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30DHhS7D001904;
	Fri, 13 Jan 2023 18:02:35 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n38uh5dkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 18:02:35 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30DGgIu6012721;
	Fri, 13 Jan 2023 18:02:34 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3n1ka1desh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 18:02:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30DI2XCG34538170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jan 2023 18:02:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A23257805E;
	Fri, 13 Jan 2023 19:41:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBBB87805C;
	Fri, 13 Jan 2023 19:41:51 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 13 Jan 2023 19:41:51 +0000 (GMT)
Message-ID: <45f0dc31e61f111832f5da83dea6e1418deb3aee.camel@linux.ibm.com>
Subject: Re: SVSM initiated early attestation / guest secrets injection
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>,
        "Daniel P."
	=?ISO-8859-1?Q?Berrang=E9?=
	 <berrange@redhat.com>
Cc: linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Date: Fri, 13 Jan 2023 13:02:30 -0500
In-Reply-To: <Y8GTXpfqlOe53cEr@suse.de>
References: <Y8AbnM0cnKfXXW23@redhat.com> <Y8GTXpfqlOe53cEr@suse.de>
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
X-Proofpoint-GUID: bnS6iIIdfM0qkSdJg9zOR2poWuNsjbq5
X-Proofpoint-ORIG-GUID: UoEE-wn3f6Z8UysneyOYgR15C7v5ey2C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_08,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=905 impostorscore=0 malwarescore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130122

On Fri, 2023-01-13 at 18:22 +0100, Jörg Rödel wrote:
[...]
>         2. Host owner attaches a different disk image with malicious
>            content, e.g. a boot loader that sends the secrets to the
> host
>            owner.


This attack was discussed in the initial encrypted image prototype for
SEV and SEV-ES.  The idea is that either the disk is encrypted with the
injected encryption key (i.e. decodes correctly) or it isn't, in which
case it's up to the mounting component (grub in the initial prototype
and initrd in this proposal) to declare failure and destroy the
secrets.

In the original proposal, grub was combined with ovmf to produce
attestation covering the mounting component.  In this new scheme, you
could use measured direct boot to ensure that the initial attestation
covers the initrd since the boot partition isn't encrypted.

James

