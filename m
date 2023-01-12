Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B8B1369
	for <linux-coco@lists.linux.dev>; Thu, 12 Jan 2023 08:20:06 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30C8IoLe015991;
	Thu, 12 Jan 2023 08:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : cc : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=soGFzcoL9qOL1VAZuc2LmRPVEMg7HEVfakiUeeMP0g4=;
 b=BtoNX+ueSH+Cls9l4OXqvTzUttq4191S2adHNNl1tcjJKTnqAc0e7QwH3vjwXGIafNY2
 a6nsB9Iy4+hNyKw7rVDxWZ2qmIRtV9Ci5o80NpXR1SfqfEjmn9oC+XHk4z/Yw5UMQbvl
 2GfV2kuVMTMZFtQ92NTWCRQ74Vl52dF1krOA6fjZSOEX0YnUXTozfghfVc8/dYVmGdEx
 CZ2TI5TLu5h/Xy2DlWJvnQk54masg5UYmkUGmRAIB0toQEGlwlZjCW851BTsug7POExE
 6qTm3X4nV4iZIZUyvJ8yYA+XhRn6xm5ZQDAisBXool+yxTjFIa/wi/wp9dEHUS3tcWuq UA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n2eka00g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jan 2023 08:19:57 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30C88whn007152;
	Thu, 12 Jan 2023 08:19:57 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3n1kwkqx4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jan 2023 08:19:57 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30C8JtFS5178062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jan 2023 08:19:56 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C0F658060;
	Thu, 12 Jan 2023 08:19:55 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3BF258054;
	Thu, 12 Jan 2023 08:19:53 +0000 (GMT)
Received: from [9.160.176.15] (unknown [9.160.176.15])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Jan 2023 08:19:53 +0000 (GMT)
Message-ID: <ec43c1b9-8239-16c5-a4b5-5fe46970c9e4@linux.ibm.com>
Date: Thu, 12 Jan 2023 10:19:52 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        James Bottomley <jejb@linux.ibm.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0YuUjWDjGZ7tqbmN4OD16ONqAouH4-Hf
X-Proofpoint-ORIG-GUID: 0YuUjWDjGZ7tqbmN4OD16ONqAouH4-Hf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_04,2023-01-11_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120056

Thanks Tom for these additions.

On 10/01/2023 20:54, Tom Lendacky wrote:
> Attached is an updated draft version of the SVSM specification with
> added support for an attestation protocol and a vTPM protocol as well as
> other miscellaneous changes (all identified by change bar). Please take
> a look and reply with any feedback you may have.
> 

Few comments/questions:

Page 25: 7.1 SVSM_ATTEST_SERVICES

1. Should we add two fields in Table 11 for certs_addr and certs_len? If
certs_len input is > 0, then SVSM will perform guest_ext_request and
retrieve the host/VMM certs into certs_addr.  Provided certs_len must be
4KB-aligned.  Not sure about certs_addr.

If the size of the certs exceeds the size of the supplied certs buffer,
R8 will be set to the size of the certs (in bytes) and the call will
return SVSM_ERR_INVALID_PARAMETER.

2. Table 11: The 'Attestation report buffer gPA': should have enough
space to hold the resulting SNP attestation report (0x500 bytes).

(I assume the implementation will ask the PSP to generate the report
into an SVSM-HV shared page, and then copy the result to the
caller-provided buffer in guest private memory.  So the caller doesn't
need to worry about page alignment/crossing?)

3. Consider stating that the SNP attestation report is always generated
with MSG_REPORT_REQ.VMPL=0.

4. Services Manifest (page 26): Can we require that the same SVSM source
code will produce the same (binary) manifest buffer (in different VMs)?
For example, at which order do the entries appear? I think James was
aiming at durable/repeatable attestations.



Page 28: vTPM Protocol

5. Will the SVSM update any PCRs on its own? For example, will it
measure the content of OVMF into PCR0?  Or are relying on the SNP
launch-update measurement (which currently includes both SVSM and OVMF)
to attest that part of the guest?


-Dov
