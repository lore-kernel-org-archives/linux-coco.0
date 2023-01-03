Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A566D8F6B
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 21:01:38 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 303JToPV031813
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MF7Z6Q5inorXzCXUGO0cAJGz5AwsKSZbZqyEtUIQp1U=;
 b=epOmrgjEON0XNzWTwjKiYi4FwjwicxVOy1vL4AHjrQd/30amrZD6OGKJwokWDlPncnJc
 uBp5bZN9yPpg7RC017/+fJ/T4lYucRuvTYyVXOZuxeDHgtuhek+5NsW6Nivltk9OoxTU
 azO26R1rZx81/VJK5HIq9qe/Ch3mPMMjjiI9rxqvAWIrXfIshQvuB2LIrN4GAybBk+tD
 C3qzOaU6RPzOcji2w6UJ6ttRvWsQzvX2+OYaxfd5VwztTyqJkYGW2YDLXJVJT4LELB0E
 slvpPPkKkFDJjoBjmjdkfhfg623Fi6bKEK/DQnJZMrrhVNxdZpGRcXLrgsALj7OhQHf2 zA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mvh8pqwgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 03 Jan 2023 21:01:36 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 303J0Hwv019422
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:01:36 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3mtcq7kxwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 03 Jan 2023 21:01:36 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 303L1Zv111272926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-coco@lists.linux.dev>; Tue, 3 Jan 2023 21:01:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C31AD78068
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:34:01 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 611D57805C
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:34:01 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.211.64.53])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP
	for <linux-coco@lists.linux.dev>; Tue,  3 Jan 2023 22:34:01 +0000 (GMT)
Message-ID: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
Subject: [RFC 0/3] Enlightened vTPM support for SVSM on SEV-SNP
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: linux-coco@lists.linux.dev
Date: Tue, 03 Jan 2023 16:01:33 -0500
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
X-Proofpoint-GUID: ddbA8sG4CS6a61ueLwhDXOsQkwHS8svF
X-Proofpoint-ORIG-GUID: ddbA8sG4CS6a61ueLwhDXOsQkwHS8svF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_07,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=387
 suspectscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1011 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301030174

This is a sketch for how a fully enlightened vTPM driver would work. 
The idea is that the SVSM responds on function 8 to vTPM requests, so
we use that to send down a buffer which is modified on return (the
buffer must be big enough, so the agreed protocol is it should be a
page in length, which is larger than any possible TPM command or
response).  The protocol used is the MSSIM one which is self describing
in terms of length, so there's no need to transmit sizes (it also
leaves room for expansion to localities and cancellation, which is
useful in the light of discussions).  A NULL in place of the buffer is
a probe and the SVSM call simply returns SVSM_SUCCESS without doing
anything.  This can be used to probe for vTPM support because any other
return would indicate no vTPM present.

Hopefully IBM will publish the new svsm-vtpm repo shortly, but we're
still working with the old CRB based one at the moment, so it may take
some time.

The three following patches are for two different repos.  Patch 1 will
apply to any upstream Linux kernel, Patch 2 requires the non-upstream
sev-snp repo and patch 3 is against the non upstream sev-snp edk repo.

James

