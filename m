Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB20BA2E
	for <linux-coco@lists.linux.dev>; Wed,  4 Jan 2023 23:00:06 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 304L1oqu009118;
	Wed, 4 Jan 2023 23:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=MzePfOzwG4FQA4DXVNREF8s3xmVk1iAA2AsL8J3TU2o=;
 b=KadIraXVZyaxfXzDsQne2QdlfslmtbnnXCEwfxibVmIKZV/IYVSSAFEzP2769TRgpD0W
 9Pu4Nngt+nLoKzus9LPP0WF08GDoOY0Co6IPRr1HGBzg+oDAmCvPQ9YZUsH7TNgczCND
 Xsarbj0jMgyxUCA+CZCqhgZHQmqF7weMXknJ5im5XgbBOgWJM4+U0H+i/Dm0jQUyB+es
 Q5Bpk16EW8NK6Na53Y0SjZD9zq5wbp5eoAuvd6ahsyfV/LuyyKqXG/8rcFy1bvEPVrpa
 m2bD2SsjevDUPjwFWMOoRhvVfVxfmOMgLqflDonhd8izeln/Ud6sbW2QuLDSkAOGouXf lQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwh0xtdjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 23:00:02 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 304LPMbt029520;
	Wed, 4 Jan 2023 23:00:02 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3mtcq7s5rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 23:00:02 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 304N00mq36504260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jan 2023 23:00:01 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 799607805F;
	Thu,  5 Jan 2023 00:33:12 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECC867805E;
	Thu,  5 Jan 2023 00:33:11 +0000 (GMT)
Received: from [IPv6:2601:5c4:4302:c21::a774] (unknown [9.211.64.53])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu,  5 Jan 2023 00:33:11 +0000 (GMT)
Message-ID: <57f57492540f1cad4a677bb5fb96183ce8847306.camel@linux.ibm.com>
Subject: Re: [RFC 0/3] Enlightened vTPM support for SVSM on SEV-SNP
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Tom Lendacky <thomas.lendacky@amd.com>, linux-coco@lists.linux.dev
Date: Wed, 04 Jan 2023 17:59:58 -0500
In-Reply-To: <93bb47b9-4381-469b-b02e-6e494d0c189c@amd.com>
References: <acb06bc7f329dfee21afa1b2ff080fe29b799021.camel@linux.ibm.com>
	 <93bb47b9-4381-469b-b02e-6e494d0c189c@amd.com>
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
X-Proofpoint-GUID: kwxRjRbZ7bWgfp9vrwsnJgLQ_L6Y4PH9
X-Proofpoint-ORIG-GUID: kwxRjRbZ7bWgfp9vrwsnJgLQ_L6Y4PH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 adultscore=0 mlxlogscore=578 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301040183

On Wed, 2023-01-04 at 16:44 -0600, Tom Lendacky wrote:
> How should we indicate when cancellation or locality support is
> available? Should there just be a protocol call ID that returns a
> bitmap of supported command values (e.g.: bit 8 would be set for
> TPM_SEND_COMMAND) and a bitmap of supported features?

I'm not sure anyone will ever care about cancellation.  There are only
two cancellable points in the entire MS TPM implementation; one is in
CryptRsa to abort the prime search and the other is in
CryptEccCommitCompute.  On a full power CPU system you're unlikely ever
to be able to signal a cancellation in time for it to be meaningfully
useful.

Discovery for all the commands bar locality is simply they return -
EINVAL if you try to invoke them in the SVSM when they're not
implemented (that's an extension to the MSSIM protocol).

Locality can't simply be added, it needs someone to come up with the
actual locality properties and for the SVSM to police them.  Presumably
discovery would be part of that exercise.

James

