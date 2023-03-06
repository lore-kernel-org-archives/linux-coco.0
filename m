Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A9419B
	for <linux-coco@lists.linux.dev>; Mon,  6 Mar 2023 10:58:37 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3269lSOX028056;
	Mon, 6 Mar 2023 10:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : cc : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Nljsbk/Kzz/nlaSYw0i5+FLFWhvIonmrGalX5CBQPh8=;
 b=slqDtEwgdG4QKIKb92W8W+We6DK/ZUwPMF/mslvv9WNn3r8PWJPP8prB8NU24Lla3Fdv
 TF6cyLmAG97EpgYmL/M2yI+2ub4b29md4PEK75hnLjLXzPSx3Q+XQjQvbEqjxj5X2Kkn
 bOFRidfYXhgIQyOhCipWez6CkaqgaJwCi+KVEvpD581dlz0NCC2wyJV7n9ywQ/Jm4VEX
 I8rmFel0cqjFn8u5+m9dLDMhyRWL0PVpBgBF2gf5/FIOLUVSqlatZ+f3pPrIACH+ktJC
 TkCuK35VUmtuXIaxr1T/6/P/EYivaUWbR4JePV/Ott/P5MsNVGlTCsX3HVZ5Q9Nd756j ng== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4u1jd2h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 10:33:15 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3268S37H023888;
	Mon, 6 Mar 2023 10:33:13 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3p41877svu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 10:33:13 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 326AXCQk3015308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Mar 2023 10:33:12 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2186958060;
	Mon,  6 Mar 2023 10:33:12 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A6825805F;
	Mon,  6 Mar 2023 10:33:11 +0000 (GMT)
Received: from [9.148.12.120] (unknown [9.148.12.120])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Mar 2023 10:33:10 +0000 (GMT)
Message-ID: <4ec32298-be2f-c572-0cbf-6be3656944ac@linux.ibm.com>
Date: Mon, 6 Mar 2023 12:33:10 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: SVSM Attestation and vTPM specification additions - v0.61
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CFRVXzvZ0r3g_jnhEQrMTL_WhI6SONoH
X-Proofpoint-ORIG-GUID: CFRVXzvZ0r3g_jnhEQrMTL_WhI6SONoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_03,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1011 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060088

Hi Tom,

On 08/02/2023 23:55, Tom Lendacky wrote:
> Attached is an updated draft version of the SVSM specification with
> feedback incorporated from the previous review. Please take a look and
> reply with any feedback you may have.
> 

In section 7.1 (SVSM_ATTEST_SERVICES Call), Table 11 lists the field
"Attestation report buffer size (in bytes)", but this field is not used
in the description of the operation.  There's also no register defined
to return the expected length of the report itself in case the supplied
report buffer is too small.

I suggest adding something like:


If the size of the SNP attestation report exceeds the size of the
supplied attestation report buffer, R8 will be set to the size of the
attestation report and the call will return SVSM_ERR_INVALID_PARAMETER.

(and fill RCX and RDX too in the response?)


-Dov



