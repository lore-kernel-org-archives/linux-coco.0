Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC382809
	for <linux-coco@lists.linux.dev>; Mon, 24 Oct 2022 11:46:23 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29OBORDh002416;
	Mon, 24 Oct 2022 11:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : subject; s=pp1;
 bh=lFhdMlUHOIxys/+yUrCkmamAHzP08/zi+nS9k3SYmHI=;
 b=SY+iVcIx0UMEUsYHdeAttCdT6IjWLVbm54NL7ToRdokDkdk5T2olfl7SSygj0P/tj6TV
 hM7siVzYbJ7QhfrsogLUhcZvcjRTlnyJDnm3jlF0Sg83ngyYQ7bb3zdugp/j5n+HfK5T
 yr2ajO+7XHaGUum8Sor8UanpS/MuZbRAhi3qtvQSII16dvA2ENvkSJnc0QpWjgVpqorC
 5wFBasPvXHCQbCThSW5wRGpACT/3lVJRfJlZNbD84+cFXh3/FXwTcm0vIFNK+2Gkumzd
 8HkSCeCZHyDSgsSOXJMITcMzFzpgS2YquZmFzl7K923yqQJqFWjvLD6fXABrAEP07JHu 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kdst0rkk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 11:46:16 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29OBPVkQ004487;
	Mon, 24 Oct 2022 11:46:15 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kdst0rkjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 11:46:15 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29OBaOns001931;
	Mon, 24 Oct 2022 11:45:59 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma05wdc.us.ibm.com with ESMTP id 3kc85awcj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 11:45:59 +0000
Received: from smtpav02.wdc07v.mail.ibm.com ([9.208.128.114])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29OBjvUe22676182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Oct 2022 11:45:58 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B97FC5805E;
	Mon, 24 Oct 2022 11:45:57 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 579E358067;
	Mon, 24 Oct 2022 11:45:55 +0000 (GMT)
Received: from [9.160.37.66] (unknown [9.160.37.66])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Oct 2022 11:45:55 +0000 (GMT)
Message-ID: <d8b21444-7829-5f5c-41dd-b103ae3a52fa@linux.ibm.com>
Date: Mon, 24 Oct 2022 14:45:55 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Jon Lange <jlange@microsoft.com>, James Bottomley <jejb@linux.ibm.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
        David Altobelli <David.Altobelli@microsoft.com>,
        Christophe de Dinechin <cdupontd@redhat.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        Dov Murik <dovmurik@linux.ibm.com>
References: <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
 <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
 <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com>
 <SJ0PR21MB132342D2808DF609F37D6018E92B9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <CABayD+cYCj=uOtC5h1d781jh_B6XqxmZNfR69taEex7yvkizRw@mail.gmail.com>
 <SJ0PR21MB132378C080FFED1E283B4051E92A9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
 <MN0PR21MB3072186C88BB26EA883F8612CA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <7e67f33577aaebe09205c9a93597de9f742fd08f.camel@linux.ibm.com>
 <MN0PR21MB307280C94C1C54497ADDEFCECA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y1ZwJvNvky6Wst7k@work-vm>
Content-Language: en-US
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <Y1ZwJvNvky6Wst7k@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ql3WElpz4dmS26quC4UakIhjtykY-hKx
X-Proofpoint-GUID: 0Jz4ruZrOULhIfyV_YtCkxX_C04b7V7D
Subject: RE: SVSM vTPM specification
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_03,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=999
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210240071



On 24/10/2022 13:59, Dr. David Alan Gilbert wrote:
> * Jon Lange (jlange@microsoft.com) wrote:
>> The drawback to having an identifier-prefixed document is that it necessarily restricts each report to providing only a single statement from a single SVSM protocol.  If, in the future, we find it is common for a relying party to require, say, five different protocol statements, this imposes a requirement to obtain five separate reports.  This means a minimum of five round trips from the SVSM to the PSP, which seems undesirable.  I think we will really want to invest in defining an extensible format that can be placed into a single report.  I'm not claiming that JSON is the only option here, but I think we will regret any format that prevents extension within a single report.
> 
> Having something structured does seem to me better than tacking a magic
> byte on.
> (Although as I remember, the SNP report already contains a flag saying
> which VMPL level the request was generated from; whether that's enough
> to discriminate between guest requests, and requests by the firmware
> I don't know).
> 

The VMPL level is not enough to distinguish between different reports
which all originate from the SVSM (for example, let's say we have an
SVSM-vTPM report and an SVSM-migration-helper report).

I think that the two options presented here are:

1. SNP REPORT_DATA = type_byte + nonce + sha256(extra_data) [James]. The
meaning/format of extra_data depends on type_byte.  For now we design
just for vtpm (type_byte=0x00).  In the future, adding more info (like
migration-helper report) will use new type_byte values (0x01, ...).

2. SNP REPORT_DATA = nonce + sha256(extra_data) [Jon]. extra_data is a
JSON document which may contain a vtpm section, a migration-helper
section.  In the future, we can add more info but adding sections to
this JSON document.


(please correct me if I didn't get your suggestions)


In both approaches, when the guest asks for the report from the SVSM, it
will receive:

1. The SNP VMPL0 attestation report (~3KB)
2. The extra_data in plaintext (for vtpm: just two public keys, <1KB)
3. The certs chain from the host (<10KB)


-Dov


>> I'm having a hard time understanding any scenario that involves an entity that has access both to an SNP report and the vTPM and which also needs to verify the report.  If the objective is for the guest (which has access to the vTPM) to obtain the TPM's endorsement key, then it could obtain it directly via the vTPM protocol without requiring the SNP report.  After all, the vTPM SVSM protocol does not need to be limited to providing exactly the functionality of the vTPM command set, but can also include other utilities that are useful to the guest.  If the objective is for an external party to obtain information about the vTPM, then it doesn't have access to the vTPM anyway and will have to rely solely on what's in the report. 
> 
>> If the vTPM endorsement key is rooted to a well-known certificate,
>> then the TPM certificate can be provided directly by the guest without relying on any SNP report (in exactly the same way that physical TPMs do not rely on a separate hardware root of trust to authenticate them).  Can you shed some light on scenarios in which you think the guest has no choice but to compare the SNP report and the vTPM state to verify that they match?
> 
> I think that depends on the lifetime of the keys, and who manages them.
> If you're in a cloud environment where something apparently trusted is
> managing the state of your vTPMs, you might be able to do what you say;
> but then you still need a mechanism somewhere to get the SNP state
> to the trusted entity that then provides your vTPM state before anything
> in the guest uses the vTPM stored state.
> 
> I think the argument is that if you used an ephemeral set of vTPM state,
> then at any time after boot you could provide a combined vTPM+SNP
> attestation report to a third party who would do the normal TPM
> validation and then do the SNP validation.  That avoids the need for
> magically loading state from some trusted entity in the firmware.
> 
> Dave
> 
>>
>> -Jon
>>
>> -----Original Message-----
>> From: James Bottomley <jejb@linux.ibm.com> 
>> Sent: Friday, October 21, 2022 6:04 AM
>> To: Jon Lange <jlange@microsoft.com>; David Altobelli <David.Altobelli@microsoft.com>; Steve Rutherford <srutherford@google.com>
>> Cc: Daniel P. Berrangé <berrange@redhat.com>; Christophe de Dinechin <cdupontd@redhat.com>; linux-coco@lists.linux.dev; amd-sev-snp@lists.suse.com
>> Subject: [EXTERNAL] RE: SVSM vTPM specification
>>
>> On Fri, 2022-10-21 at 00:02 +0000, Jon Lange wrote:
>>> Surely the primary value of a document hash is to prove its 
>>> authenticity, not to determine whether two documents reflect identical 
>>> information.  I understand your concern that two "canonical" 
>>> representations of the same data may result in different JSON 
>>> encodings and therefore produce different hashes, but as long as each 
>>> document can be authenticated by its hash, does it really matter if 
>>> the hashes of the two documents are different?
>>
>> If you only have an AMD-SNP attestation report and access to the vTPM, you have to query the TPM properties then construct and hash the document yourself to verify the report.  I sometimes think half the history of security protocol implementation consists of one engineer struggling to reproduce the hash created and signed by another, which is why I have a preference for it being exactly specified and simple.
>>
>>> There is a ton of discussion here about vTPM because it's an important 
>>> problem, and it is valuable to recognize that a vTPM implementation 
>>> will likely require some sort of SVSM-issued document to describe that 
>>> vTPM.  There's no reason to back away from defining the structure of 
>>> such an SVSM-issued document.  But we should also expect that in the 
>>> next 2-3 years, we're going to invent other valuable functionality 
>>> that an SVSM can implement that will also require the SVSM to issue 
>>> some sort of authenticated statement.  If we marry the SVSM report 
>>> information to a vTPM, then it's going to be really hard to add that 
>>> new functionality, and if we don't anticipate the need for 
>>> extensibility, then we're going to wind up in a future where an SVSM 
>>> will issue different kinds of authenticated information (vTPM on one 
>>> hand and new feature on the other) and the relying party won't be able 
>>> to know which is which.  I don't see how we can avoid the problem of 
>>> defining an extensible document schema now that we can extend in the 
>>> future as the role of the SVSM expands.  JSON is an extremely 
>>> attractive syntax for such a schema - certainly much more so than XML, 
>>> and also likely to fare much better than any binary standard.
>>
>> Allowing the relying party to know what type of authentication was why I proposed a type prefix to the guest data in the report.  The reason I like the type in the guest data and not the hash is so the bare report is self identifying even if it costs us a byte or two of the nonce.
>>
>> There are 2^32-1 possible SVSM protocols, so nothing in the above precludes adding a json based hash call if a need arises (or indeed many other binary/json/xml ones if that's what people prefer).
>>
>> James
>>
>>
