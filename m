Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F3F2560
	for <linux-coco@lists.linux.dev>; Thu, 22 Sep 2022 21:14:28 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MLB5Ia017563;
	Thu, 22 Sep 2022 21:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=g2MMj3EJ8Nd43mL84IUUaE3BtIAedClhXZoXmGdvbO0=;
 b=q40GmltbOzdSrqoRHA15iXmxt8uPsPNDHOU7wpN74PMV2JTXjV8VkSdkS/GUZOwsA1xP
 YRuG5b0s/j43vAt2akU2cee/Ce3DPGo85fqFrVYh2UJTMNCjPSHFElQdov04J7BkHgKq
 K+xF6y21PeoUpuAHu5fpMn7tgjT4zYDQRhQd25K+9d1qdjPC+V6DyMEUvYQTGutRnJyl
 2I1jpdpCBwnfgB3YuuPHnPZjx/4VKuhHO7kw3OHX0AnapwG9L6lDK9VzeYY0ACyuBowA
 7vGlNuOGDLbGDkWZfDqhL53LZgeMXi1f34UjIau+pCJ6tOzGKY6S6Noc0cESKs8n4Pf1 aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrx72a0uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 21:14:24 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28MLBBeS019244;
	Thu, 22 Sep 2022 21:14:23 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrx72a0uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 21:14:23 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28ML6ctU019500;
	Thu, 22 Sep 2022 21:14:23 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma03wdc.us.ibm.com with ESMTP id 3jn5v9ud40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 21:14:23 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28MLELPL7340788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Sep 2022 21:14:22 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B036558058;
	Thu, 22 Sep 2022 21:14:21 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B47D858054;
	Thu, 22 Sep 2022 21:14:20 +0000 (GMT)
Received: from [9.65.232.84] (unknown [9.65.232.84])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Sep 2022 21:14:20 +0000 (GMT)
Message-ID: <0b3558a6-e5a5-a45e-c5c0-cc59ebfe167d@linux.ibm.com>
Date: Thu, 22 Sep 2022 17:14:20 -0400
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: Secure vTPMs for confidential VMs
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>,
        =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <jroedel@suse.de>,
        Dov Murik <dovmurik@linux.ibm.com>
Cc: linux-coco@lists.linux.dev,
        =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>,
        amd-sev-snp@lists.suse.com
References: <84d6ee10-ff8a-a121-d62f-19becf400e75@linux.ibm.com>
 <YyrQGXO34ZRxSbgl@suse.de> <fbb87137-1b54-29e7-b1f4-a8b5c2f968a5@amd.com>
From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
In-Reply-To: <fbb87137-1b54-29e7-b1f4-a8b5c2f968a5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Er96c0lRu_xG9iXfH-6YPKBVw3RNf3ZD
X-Proofpoint-ORIG-GUID: upd5-fmm3jebm-y84BjXAWjzuqFyUpjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_14,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220135

On 9/21/22 1:07 PM, Tom Lendacky wrote:
> On 9/21/22 03:49, Jörg Rödel wrote:
>>
>> The current plan is to have VMPL1 talk to the VMPL0 vTPM via
>> standardised SVSM commands. This requires new TPM drivers for all VMPL1
>> components. At least unless someone comes up with a better idea :)
> 
> This is probably the best approach. We will have to modify the kernel no
> matter what, either recognize the MMIO range being accessed from within
> the #VC handler (and then parse the instruction, etc.) or modify/create
> a TPM driver that talks to the SVSM (and thus eliminates the exception
> path). Either way, an update to the kernel is required.
> 
Yeah, supporting unenlightened guests is tricky. We were initially
thinking we could use the RMP table to cause an exit on the MMIO writes
and have the HV transfer control to VMPL0, but it's fairly complex (and
slow) to figure out what VMPL1 was about to write.

Still, it would be really big if we could do this without diverging from
the existing TPM interfaces. So here's a totally orthogonal idea that
you might not like.

What about adding an additional vCPU to the guest? This extra vCPU would
always run at VMPLO and would simply watch the TPM MMIO region. This
vCPU would also handle TPM emulation.

I realize this isn't really how AMD have envisioned using VMPL0
(although it could work alongside the current approach), but I think it
has some advantages. First, it seems like it would allow us to use the
existing interfaces without adding much extra complexity.

Second, I think it might be more in line with what we could support on
other platforms. Only SEV-SNP has VMPLs. It seems likely that any
complex reflection-based approach won't work on other platforms. Having
a vTPM VMPL0 vCPU on the other hand, would be fairly similar to having a
second VM with a shared address space. We might even be able to
implement something similar on SEV(-ES) using the so-called mirror VM.

Now there are also some drawbacks, but I'll let you guys point those out.

-Tobin
> I'm not an expert in TPMs, but when using an SVSM enligntened TPM
> driver, maybe it becomes possible to even batch up multiple operations,
> which would improve overall performance.
> 
> We need to start looking at what the interface to the SVSM would look
> like. What is required from the SVSM (e.g. attestation report) and how
> to provide that to the VMPL1 guest, what is required to be supplied by
> the VMPL1 guest to perform the operation, etc.
> 
> To that end we can probably start talking about how we want to advertise
> support for a vTPM in the SVSM. I imagine it will be a new protocol with
> new functions (btw, look for an announcement shortly as the SVSM draft
> specification is now available from our website).
> 
> Thanks,
> Tom
> 
>>
>> Regards,
>>
