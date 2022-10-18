Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FDD5386
	for <linux-coco@lists.linux.dev>; Tue, 18 Oct 2022 20:45:48 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29IKCmfo021611;
	Tue, 18 Oct 2022 20:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lg2+4uKWQ2vLNLVKbiq1JBCk1fW19uVVM25CJMCZj68=;
 b=PRP91mb8qjubCrC3kQbCgmQeGQiOm3xtYBpfdRSTeC5oVuid4focpUQ/VMWiIVxPFwEg
 1Gi/podzhAvhaPMNmj0dTbZhf2Np+BeUy0vNNnRJ3wnStrTXYH6dk1AizS2xwHZp4p3O
 e7e/Tm+xcuc3Sd8Tj/r34C5VXynkFA1TMsk22GPaNviRllW6C0BO+E7D0UQp4CqYMfdJ
 o9cbHXvAEWCfumqC0iq6bUgQTHj1FKUVjxqgNEAvY+zsPpxFyAb1SgESAH2s+PFgI0wx
 MkgFA4nq4GIFZQQQBMtGziwE9YE1i1OICRWPG8M4HTNA8/ERe4qJidRSLQDikqu+FvYa dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ka2yxrxyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 20:45:40 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29IKKPUW023908;
	Tue, 18 Oct 2022 20:45:40 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ka2yxrxyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 20:45:39 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29IKaMYZ021579;
	Tue, 18 Oct 2022 20:45:39 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma03dal.us.ibm.com with ESMTP id 3k7mg9v5gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 20:45:39 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29IKjbH47996138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Oct 2022 20:45:38 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5EDD758053;
	Tue, 18 Oct 2022 20:45:37 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A386958065;
	Tue, 18 Oct 2022 20:45:35 +0000 (GMT)
Received: from [9.160.89.171] (unknown [9.160.89.171])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Oct 2022 20:45:35 +0000 (GMT)
Message-ID: <4a5bde7e-c473-0fdc-3c3f-e08321e0b911@linux.ibm.com>
Date: Tue, 18 Oct 2022 23:45:45 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: jejb@linux.ibm.com, Tom Lendacky <thomas.lendacky@amd.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        Dov Murik <dovmurik@linux.ibm.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <b6b22a1f4741a29c68dbdfae59e3fb201e3aa5e8.camel@linux.ibm.com>
 <820ddc4a-ac48-00a1-d284-23d08899f1cc@amd.com>
 <294b08e11e53cff01607004737f6f20c6784c40b.camel@linux.ibm.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <294b08e11e53cff01607004737f6f20c6784c40b.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4fZq-wl-ek-sMpIqDInCcoUj5biausws
X-Proofpoint-GUID: TygyBKKnlblrwdPfq_TaJM1mqt6lWA3F
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-18_07,2022-10-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210180115



On 13/10/2022 22:20, James Bottomley wrote:
> On Thu, 2022-10-13 at 13:54 -0500, Tom Lendacky wrote:
>> On 10/12/22 14:05, James Bottomley wrote:
>>> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
>>>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
>> ...
>>> It is theoretically possible to emulate a CRB TPM with just a
>>> single
>>> communication page and an ACPI entry (the Linux CRB driver is ACPI
>>> only
>>> at this time and responds to the "MSFT0101" ACPI entry).
>>>
>>> The CRB device responds to a very compact MMIO region (0x30 bytes
>>> long)
>>> described in the CRB spec:
>>>
>>> https://trustedcomputinggroup.org/resource/tpm-2-0-mobile-command-response-buffer-interface-specification/
>>>
>>> In theory we could use a page that keeps trapping to the SVSM for
>>> this,
>>> but the problem is that the CRB driver polls a register in the MMIO
>>> region to check command completion, so even a single TPM command is
>>> going to generate a huge number of such traps.  So while it's
>>> theoretically possible to generate a SVSM emulation of the CRB
>>> device,
>>> it would likely be too expensive in terms of traps, particularly if
>>> we're using the SVSM vTPM for runtime measurements like IMA.
>>>
>>> If we're going to do a new driver, I think basing it off the CRB
>>> spec
>>> would be fine (the spec envisages command request/response being
>>> via
>>> areas outside the MMIO region) and we could simply do a new driver
>>> that
>>> plumbs directly into the nine operations in the tpm_class_ops
>>> structure
>>>
>>
>> This sounds good. I think we can model an API call to the SVSM vTPM
>> using 
>> this. We can provide a struct that looks similar to the CRB Control
>> Area 
>> and supply the GPA of this struct in RCX to the SVSM for the vTPM to 
>> perform the operation:
>>
>>      - Command GPA
>>      - Command Size
>>      - Response GPA
>>      - Response Size
>>      - Status
> 
> Realistically, I think all TPM2 command/response actions can be packed
> into
> 
> u32 TPM2_action(u64 command_gpa, u32 command_len, u64 response_gpa, u32
> *response_len)
> 
> Where the u32 return would be the status (although if the SVSM has
> trouble with the return status, we could add it as an extra modified
> variable).
> 
> The way the current TPM driver interface works is shown in the
> tpm_class_ops structure:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/tpm.h
> 
> we can shim all the non-ignorable calls into the above.  The standard
> way of sending a command is tpm_try_transmit in
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/char/tpm/tpm-interface.c
> 
> I think we can emulate an interrupt driven tpm (set TPM_CHIP_FLAG_IRQ
> in the driver) and it will simply do a ->send() ->receive() pair, which
> works for us since the thread of execution in ->send() will pass into
> the SVSM and return with the result which we can then copy over in
> ->recv

Yep, the ftpm driver [1] stores the TPM response at the end of ->send()
and then just copies it over in ->recv(), like you said.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/char/tpm/tpm_ftpm_tee.c

> 
> Also note that tpm_try_transmit() uses the same buffer for send and
> receive, so it is possible to reduce the number of parameters in
> TPM2_action() above if that's the route people want to go.

I think that the leftover space in the SVSM's Calling Area (svsm_caa.svsm_buf:
4088 bytes) should be enough for the CRB struct and the command+response data buffer.
Using it might simplify the kernel driver a bit (reduce alloc/free calls).

-Dov


> 
>> Anything else that would go in the struct? Locality?
> 
> Well, this is a question.  CRB devices are actually allowed not to have
> a locality at all, so ignoring it is perfectly legal.  On the other
> hand, locality is used to allow or deny certain accesses. 
> Traditionally you allow firmware access at locality 4 as the trusted
> hardware component.  However, the problem with implementing localities
> is how does the SVSM know where we're calling from?  If it's unable to
> bar access at certain localities, there's not much point implementing
> them.  For reference the TIS TPM implements separate memory maps of its
> registers, one for each locality and firmware bars access to the OS by
> unmapping a range and refusing to allow the OS to map it back.
> 
> I suspect we'd get on faster by being pejorative and saying we won't
> implement locality since we can't police it.
> 
> James
>  
> 
