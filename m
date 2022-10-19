Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB667E
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 06:39:29 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29J6OpRl032586;
	Wed, 19 Oct 2022 06:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8gODlmPO3C96dcCGB9jnsttLKBJ4wEik3HB/JFkPCUk=;
 b=ojTwdbaAlBJfuYuQzr/ZAUCeYZKmvhd8ayf37HQ0AS4JZzBh7HRwqRkj55e7EQOBEhVH
 zS/aF0FFqCpkfwgGGid78l//EgZMgwCEoh0ZeuBRYI79Z4fqRnr5VsjdLBiM5bJeEm2K
 KQEfMdjaj/zlUV7R6JzgRa7PxSPxO4UdzH615325vgMq7pqNdKY7XwSCS2Pk7tXjthvm
 MFcI0Mt/3Hga4v7s6CtnMHddD/i/vSTsnsWPtRtVUEyfMBvp6OHm7bc7mTWbUzSY74bb
 sRlZTp8wPOmuAYjZwiOTQ8XL4NQ/ESfloX903cXZ4d6KZpPiotXnKc8l5qqNL4kDYJQo Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kabxv8fc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 06:39:26 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29J6OxHh000769;
	Wed, 19 Oct 2022 06:39:26 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kabxv8fbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 06:39:26 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29J6aNnm002203;
	Wed, 19 Oct 2022 06:39:25 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma03dal.us.ibm.com with ESMTP id 3k7mg9yxkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 06:39:25 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29J6dNXC52363690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Oct 2022 06:39:23 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CB2F5805D;
	Wed, 19 Oct 2022 06:39:23 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 184C858053;
	Wed, 19 Oct 2022 06:39:21 +0000 (GMT)
Received: from [9.160.89.171] (unknown [9.160.89.171])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Oct 2022 06:39:20 +0000 (GMT)
Message-ID: <50d4c2e4-701f-681e-df5a-7c73012f69bf@linux.ibm.com>
Date: Wed, 19 Oct 2022 09:39:30 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: Christophe de Dinechin <cdupontd@redhat.com>
Cc: jejb@linux.ibm.com, Tom Lendacky <thomas.lendacky@amd.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        Dov Murik <dovmurik@linux.ibm.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4W3rbX16L808RBqUY8bvXeQVk5hxnppu
X-Proofpoint-GUID: I8Sv-DmQ7Zzh8lLzpJUzDuhSUMrGwgs_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_02,2022-10-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210190035



On 19/10/2022 8:47, Christophe de Dinechin wrote:
> 
> 
>> On 18 Oct 2022, at 22:22, Dov Murik <dovmurik@linux.ibm.com> wrote:
>>
>>
>>
>> On 13/10/2022 18:30, James Bottomley wrote:
>>> On Thu, 2022-10-13 at 10:14 -0500, Tom Lendacky wrote:
>>>> On 10/12/22 13:44, James Bottomley wrote:
>>>>> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
>>>>>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
>>>>> [...]
>>>>>> It's important that the VMPL level in the attestation report
>>>>>> reflects the side asking for the attestation; in particular one
>>>>>> TPM story goes that the firmware (in VMPL0) would ask for an
>>>>>> attestation and the attestor would return the vTPM stored
>>>>>> state.  It's important that the state could only be returned to
>>>>>> the vTPM not the guest, so the attestor would check that the VMPL
>>>>>> level in the attestation was 0; any guest attestation would have
>>>>>> a VMPL>0 and so the attestor wouldn't hand it the vTPM state.
>>>>>> Hmm or are you saying such a report would be triggered by the
>>>>>> guest rather than the firmware, but it would be protected by
>>>>>> VMPCK0 so the guest wouldn't be able to read it?
>>>>
>>>> No, the VMPCK0 key is just used for communication with the PSP.
>>>>
>>>> While the SVSM would request the attestation report from the PSP,
>>>> the guest would need to request it from the SVSM.
>>>
>>> I think this is fine.  The SVSM would do the attestation as it starts
>>> the TPM but the guest would be able to retrieve it at any time. 
>>> Essentially, if you use something like keylime, the agent would request
>>> it on start up to prove it should trust the vTPM, but that could occur
>>> way after VM boot.
>>>
>>>>
>>>>>> I think one of the vTPMs keys should be in the SNP attestation
>>>>>> report (the EK???) - I think that would allow you to attest that
>>>>>> the vTPM you're talking to is a vTPM running in an SNP protected
>>>>>> firmware.
>>>>>
>>>>> Traditionally the TPM identity is the public EK, so that should
>>>>> definitely be in the report.  Ideally, I think the public storage
>>>>> root key (key derived from the owner seed) should be in there two
>>>>> because it makes it easy to create keys that can only be read by
>>>>> the TPM (keys should be in the owner hierarchy which means they
>>>>> have to be encrypted to the storage seed, so we need to know what a
>>>>> public key corresponding to it is).
>>>>>
>>>>> One wrinkle of the above is that, when provisioned, the TPM will
>>>>> only have the seeds, not the keys (the keys are derived from the
>>>>> seeds via a TPM2_CreatePrimary command).  The current TPM
>>>>> provisioning guidance:
>>>>>
>>>>> https://trustedcomputinggroup.org/resource/tcg-tpm-v2-0-provisioning-guidance/
>>>>>
>>>>> Says that the EK should be at permanent handle
>>>>>
>>>>> 81010001
>>>>>
>>>>> And there's an update saying that should be the RSA-2048 key and
>>>>> there should be an EC (NIST-P256) one at 81010002.  The
>>>>> corresponding storage keys should be at 81000001 and 81000002
>>>>> respectively.  I think when the SVSM provisions the TPM, it should
>>>>> run TPM2_CreatePrimary for those four keys and put them into the
>>>>> persistent indexes, then insert the EC keys only for EK and SRK
>>>>> into the attestation report.
>>>>
>>>> We only have 512 bits to work with for the SVSM-provided data, so
>>>> would hashes of the keys be ok?
>>>
>>> Well, if you put the hashes in, the consuming entity would then have to
>>> find out via an additional channel what the actual keys were because
>>> you can't reverse the hash (it's possible, just more effort).  If you
>>> use point compression, an EC key (for the NIST p-256 curve) is only 32
>>> bytes anyway, so it's the same size as a sha256 hash, so I'd say place
>>> the actual public keys into the report to give complete and usable
>>> information
>>>
>>
>> Do we need to leave room for a Guest-Owner-provided nonce?  Guest owner
>> will provide it to the guest OS which will provide it to the SVSM to be
>> included in REPORT_DATA of the VMPL0 attestation report.
>>
> I think it’s a good idea, but I’m not clear on which component in the
> guest would be responsible for that exchange.
> 
> You need a functioning networking stack, and you need a way to know what
> attestation server to talk to.
> 

You're right.  I was thinking about an attestation request coming later
during the guest OS boot (after bringing up networking).

> IIUC, at this stage, we have no valid storage yet, since that would
> require having received the response from the attestation server.
> So the only storage we have is host storage managed by the hypervisor,
> plus whatever fits in your SVSM-provided data.
> 
> Can we send this data without additional encryption since it’s already
> cyphertext? Or do we want additional mechanisms, and if so, what root
> certificates do we use? Where do we get them from without guest storage?
> 
> Do we rely on guest networking being up at that point? Or do we need
> to provide additional mechanisms in the hypervisor to perform this
> initial exchange on behalf of the guest?
> 

If we need early-launch attestation and secret injection (to get the
confidential TPM state very early, before firmware starts), then we'll
need an SEV-like flow: SVSM will stop the boot sequence, wait for a
nonce from host (which will proxy to guest owner), produce attestation
report, wait for secret injection, and then resume boot to firmware.

(And maybe the nonce can be generated by SVSM, like in SEV's
LAUNCH_MEASURE; this removes one network round-trip to guest owner.)

We can try to reuse the existing QEMU commands and secret-injection
structures (we'll need to define a small protocol between HV and SVSM to
pass these buffers); or invent something new (vsock support in SVSM?).

I wonder if all of this complication (early-launch secret injection for
SNP) can be decoupled from SVSM vTPM spec effort.  Other uses for these
early injected secrets?

-Dov

> 
> 
>> If we don't add a nonce not, how can the guest owner verify the
>> freshness of the report?  Maybe the pub-EK is enough because it signs
>> the rest of the TPM-report and the guest-owner can somehow verify its
>> freshness?
> 
> I think that would work for transient vTPMs. If we want a long-lived
> vTPM, then we’d need a mechanism for the guest owner to tell, ahead of
> time, when to regenerate a new vTPM state, and to independently get
> that state. In that case, the policy of when to update the vTPM state
> would be deferred to some external server, and the process would be:
> 
> - Day 1: External server requests a new TPM state, stores state
> - Day N: Guest boots, uses that TPM state, which is then verified
>   by the external server
> - Day M: External server decides to refresh the TPM state, will now
>   only accept boots with fresher state
> 
> 
>>
>>
>> It looks like REPORT_DATA needs to be
>>
>> SHA512(guest_owner_nonce || pub_EK || pub_SRK)
>>
>> And the guest does this:
>>
>> 1. Receive nonce from guest owner
>> 2. Calls SVSM_GET_TPM_PUB_KEYS
>> 3. Constructs report_data=sha512(guest_owner_nonce || pub_EK || pub_SRK)
>> 4. Calls SVSM_GET_SNP_ATTESTATION_REPORT(report_data)
>> 5. Send back both the report and pub_* to guest owner
>>
>>
>> -Dov
> 
