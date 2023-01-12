Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F04E2CA4
	for <linux-coco@lists.linux.dev>; Thu, 12 Jan 2023 12:18:14 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30CBF7vg020683;
	Thu, 12 Jan 2023 12:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=yCRCoLU8kzFecNwvs0GS18QHSKDBnUfA9uDZSjmD+C8=;
 b=pIyIS3LDLIQhH5NX6ZsClwlUdARr4WpsWz5GclO3ZUkhi4/9rMpgT2Wc9lRY6gDA7na3
 cJltOjIPkSpUEYdhGl7tHGJDG155UItjFPmP/YILiGicF7vspChYEb2GF+CHP53ls2Uy
 JNxNSSoHrFX6qsG7YjIA+R22kpCHddHiGD6V+MQbWSE+n0hX+HzEPe1dgrH8X/DhNIAr
 m95OS6uN70ujVUue9qEde8xhI3hLuMUHKaXIXwOlYodQF/K91yZGN8H5e1vYLR9/KFuk
 loQeK4vgzHehSCCLaJkhaUBe9zwtx1DkwGjFJkAyPTLNdBtD61tWH+CMam1bPvBsNtKp rw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2h5wsja8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jan 2023 12:18:06 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30CBIRBY004552;
	Thu, 12 Jan 2023 12:18:05 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3n1kk7h3ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jan 2023 12:18:05 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30CCI4LT9241252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jan 2023 12:18:04 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B8887805E;
	Thu, 12 Jan 2023 13:56:32 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B0D97805C;
	Thu, 12 Jan 2023 13:56:31 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 12 Jan 2023 13:56:31 +0000 (GMT)
Message-ID: <95318d8211fcd9a7adb574c5e293034937869331.camel@linux.ibm.com>
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Dov Murik <dovmurik@linux.ibm.com>,
        Tom Lendacky
 <thomas.lendacky@amd.com>,
        "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com"
 <amd-sev-snp@lists.suse.com>
Date: Thu, 12 Jan 2023 07:18:02 -0500
In-Reply-To: <ec43c1b9-8239-16c5-a4b5-5fe46970c9e4@linux.ibm.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
	 <ec43c1b9-8239-16c5-a4b5-5fe46970c9e4@linux.ibm.com>
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
X-Proofpoint-GUID: 97OU2OZEneZL0v8dzJ739wC8I5KFdOl4
X-Proofpoint-ORIG-GUID: 97OU2OZEneZL0v8dzJ739wC8I5KFdOl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_07,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=724 malwarescore=0 clxscore=1015 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120085

On Thu, 2023-01-12 at 10:19 +0200, Dov Murik wrote:
> Page 28: vTPM Protocol
> 
> 5. Will the SVSM update any PCRs on its own? For example, will it
> measure the content of OVMF into PCR0?  Or are relying on the SNP
> launch-update measurement (which currently includes both SVSM and
> OVMF) to attest that part of the guest?

If the SVSM were to load OVMF then it would have to because the SVSM
would become the root of trust.  While SVSM+OVMF are loaded together
(and attested by the PSP) there's no need because the combined entity
is the root of trust and thus measurements can begin in OVMF.

James

